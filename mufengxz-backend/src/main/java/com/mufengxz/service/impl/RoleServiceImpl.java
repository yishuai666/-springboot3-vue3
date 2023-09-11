package com.mufengxz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mufengxz.entity.dto.Role;
import com.mufengxz.mapper.RoleMapper;
import com.mufengxz.service.RoleService;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
