package com.mufengxz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mufengxz.entity.dto.Permission;
import com.mufengxz.mapper.PermissionMapper;
import com.mufengxz.service.PermissionService;
import org.springframework.stereotype.Service;


@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

}
