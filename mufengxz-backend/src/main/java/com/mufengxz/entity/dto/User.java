package com.mufengxz.entity.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mufengxz.entity.BaseData;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@TableName("sys_user")
@AllArgsConstructor
public class User implements BaseData {
    @TableId(type = IdType.AUTO)
    private Integer id;
    // 用户名
    private String username;
    // 密码
    private String password;
    // 昵称
    private String name;
    // 邮箱
    private String email;
    // 用户唯一id
    private String uid;
    // 逻辑删除 0存在  id删除
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;
    // 创建时间
    private Date createTime;
    // 更新时间
    private Date updateTime;
    //头像
    private String avatar;
    // 角色
    private String role;
    // 个性签名
    private String sign;
}
