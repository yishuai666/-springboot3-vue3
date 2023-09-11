package com.mufengxz.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mufengxz.entity.dto.Permission;
import com.mufengxz.entity.dto.User;
import com.mufengxz.entity.vo.request.EmailRegisterVo;
import com.mufengxz.entity.vo.response.ConfirmResetVo;
import com.mufengxz.entity.vo.response.EmailResetVo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends IService<User>, UserDetailsService {
    //根据用户名或邮箱查询用户
    User findUserByNameOrEmail(String text);
    //邮箱验证码
    String registerEmailVerifyCode(String type, String email, String ip);
    //邮箱账户注册
    String registerEmailUser(EmailRegisterVo vo);
    //重置密码，获取验证码
    String resetConfirm(ConfirmResetVo vo);
    //保存新密码
    String resetEmailUserPassword(EmailResetVo vo);
    //获取User权限列表
    List<Permission> getPermissions(String roleFlag);
    // 获取角色对应的菜单树
    List<Permission> getTreePermissions(List<Permission> all);

}
