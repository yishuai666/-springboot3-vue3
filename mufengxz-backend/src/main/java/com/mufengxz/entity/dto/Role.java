package com.mufengxz.entity.dto;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@TableName("sys_role")
@AllArgsConstructor
@NoArgsConstructor
public class Role {

    @TableId(type = IdType.AUTO)
    private Integer id;
    // 名称
    private String name;
    // 唯一标识
    private String flag;
    // 逻辑删除
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;
    // 创建时间
    private Date createTime;
    // 更新时间
    private Date updateTime;

    @TableField(exist = false)
    private List<Integer> permissionIds;
}
