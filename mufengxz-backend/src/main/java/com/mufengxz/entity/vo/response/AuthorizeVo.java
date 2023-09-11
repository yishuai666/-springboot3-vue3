package com.mufengxz.entity.vo.response;

import com.mufengxz.entity.dto.Permission;
import com.mufengxz.entity.dto.User;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class AuthorizeVo {
    private User user;
    private String token;
    private List<Permission> menus;
    private List<Permission> auths;
    private Date expire;
}
