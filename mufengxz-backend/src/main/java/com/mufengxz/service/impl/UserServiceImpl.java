package com.mufengxz.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mufengxz.entity.dto.Permission;
import com.mufengxz.entity.dto.Role;
import com.mufengxz.entity.dto.RolePermission;
import com.mufengxz.entity.dto.User;
import com.mufengxz.entity.vo.request.EmailRegisterVo;
import com.mufengxz.entity.vo.response.ConfirmResetVo;
import com.mufengxz.entity.vo.response.EmailResetVo;
import com.mufengxz.mapper.RolePermissionMapper;
import com.mufengxz.mapper.UserMapper;
import com.mufengxz.service.PermissionService;
import com.mufengxz.service.RoleService;
import com.mufengxz.service.UserService;
import com.mufengxz.utils.Const;
import com.mufengxz.utils.FlowUtils;
import jakarta.annotation.Resource;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;


@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    AmqpTemplate amqpTemplate;
    @Resource
    StringRedisTemplate stringRedisTemplate;
    @Resource
    FlowUtils flowUtils;
    @Resource
    PasswordEncoder encoder;
    @Resource
    RoleService roleService;
    @Resource
    RolePermissionMapper rolePermissionMapper;
    @Resource
    PermissionService permissionService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = this.findUserByNameOrEmail(username);
        if(user == null) {
            throw new UsernameNotFoundException("用户名或密码错误");
        }
        return org.springframework.security.core.userdetails.User
                .withUsername(username)
                .password(user.getPassword())
                .roles(user.getRole())
                .build();
    }

    public User findUserByNameOrEmail(String text) {
        return this.query()
                .eq("username", text).or()
                .eq("email", text)
                .one();
    }

    //验证码
    @Override
    public String registerEmailVerifyCode(String type, String email, String ip) {
        //防止同一时间同一ip多次调用
        synchronized (ip.intern()) {
            if(!this.verifyLimit(ip))
                return "请求频繁，请稍后再试！";

        Random random = new Random();
        int code = random.nextInt(899999) + 100000;
        Map<String, Object> data = Map.of("type", type, "email", email, "code", code);
        amqpTemplate.convertAndSend("mail", data);
        stringRedisTemplate.opsForValue()
                .set(Const.VERIFY_EMAIL_DATA + email,String.valueOf(code), 5, TimeUnit.MINUTES);
        return null;
        }
    }
    //新注册用户
    @Override
    public String registerEmailUser(EmailRegisterVo vo) {
        String email = vo.getEmail();
        String username = vo.getUsername();
        String key = Const.VERIFY_EMAIL_DATA + email;
        String code = stringRedisTemplate.opsForValue().get(key);
        if (code == null) return "请先获取验证码！";
        if(!code.equals(vo.getCode())) return "验证码输入错误，请重新输入";
        if(this.existsUserByEmail(email)) return "此电子邮箱已被其他用户注册！";
        if(this.existsUserByUsername(username)) return "此用户名已被其他人注册，请使用新的用户名！";
        String password = encoder.encode(vo.getPassword());
        User user = new User(null, username, password, username, email,UUID.randomUUID().toString(), 0, new Date(), new Date(),"", "USER", "");
        if(this.save(user)) {
            stringRedisTemplate.delete(key);
            return null;
        } else {
            return "内部错误，请联系管理员！";
        }
    }

    @Override
    public String resetConfirm(ConfirmResetVo vo) {
        String email = vo.getEmail();
        String code = stringRedisTemplate.opsForValue().get(Const.VERIFY_EMAIL_DATA + email);
        if(code == null) return "请先获取验证码！";
        if(!code.equals(vo.getCode())) return "验证码错误，请重新输入！";
        return null;
    }

    @Override
    public String resetEmailUserPassword(EmailResetVo vo) {
        String email = vo.getEmail();
        String verify = stringRedisTemplate.opsForValue().get(Const.VERIFY_EMAIL_DATA + email);
        if(verify != null) return verify;
        String password = encoder.encode(vo.getPassword());
        boolean update = this.update().eq("email", email).set("password", password).update();
        if (update) {
            stringRedisTemplate.delete(Const.VERIFY_EMAIL_DATA + email);
        }
        return null;
    }

    //验证邮箱是否已存在
    private boolean existsUserByEmail(String email) {
        return this.baseMapper.exists(Wrappers.<User>query().eq("email", email));
    }

    //验证用户名是否已存在
    private boolean existsUserByUsername(String username) {
        return this.baseMapper.exists(Wrappers.<User>query().eq("username", username));
    }
    //ip限流
    private boolean verifyLimit(String ip) {
        String key = Const.VERIFY_EMAIL_LIMIT + ip;
        return flowUtils.limitOnceCheck(ip, 60);
    }

    //重置密码，获取验证码


    //获取User权限列表
    public List<Permission> getPermissions(String roleFlag) {
        Role role = roleService.getOne(new QueryWrapper<Role>().eq("flag", roleFlag));
        List<RolePermission> rolePermissions = rolePermissionMapper.selectList(new QueryWrapper<RolePermission>().eq("role_id", role.getId()));
        List<Integer> permissionIds = rolePermissions.stream().map(RolePermission::getPermissionId).collect(Collectors.toList());
        List<Permission> permissionList = permissionService.list();
        List<Permission> all = new ArrayList<>();  // 水平的菜单树
        for (Integer permissionId : permissionIds) {
            permissionList.stream().filter(permission -> permission.getId().equals(permissionId)).findFirst()
                    .ifPresent(all::add);
        }
        return all;
    }

    // 获取角色对应的菜单树
    public List<Permission> getTreePermissions(List<Permission> all) {
        // 菜单树 1级 -> 2级
        List<Permission> parentList = all.stream().filter(permission -> permission.getType() == 1
                || (permission.getType() == 2 && permission.getPid() == null)).collect(Collectors.toList());// type==1 是目录  或者  pid = null
        for (Permission permission : parentList) {
            Integer pid = permission.getId();
            List<Permission> level2List = all.stream().filter(permission1 -> pid.equals(permission1.getPid())).collect(Collectors.toList());// 2级菜单
            permission.setChildren(level2List);
        }
        return parentList.stream().sorted(Comparator.comparing(Permission::getOrders)).collect(Collectors.toList());  // 排序
    }
}
