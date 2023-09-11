package com.mufengxz.entity.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mufengxz.entity.BaseData;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import java.util.Date;

@Data
@TableName("sys_permission")
@AllArgsConstructor
@NoArgsConstructor
public class Permission implements BaseData {
    @TableId(type = IdType.AUTO)
    private Integer id;
    // 名称
    private String name;
    // 路径
    private String path;
    // 顺序
    private String orders;
    // 图标
    private String icon;
    // 页面路径
    private String page;
    // 权限
    private String auth;
    // 父级id
    private Integer pid;
    // 类型
    private Integer type;
    // 逻辑删除
    private Integer deleted;
    // 创建时间
    private Date createTime;
    // 更新时间
    private Date updateTime;
    // 是否隐藏
    private Boolean hide;

    @TableField(exist = false)
    private List<Permission> children;
}
