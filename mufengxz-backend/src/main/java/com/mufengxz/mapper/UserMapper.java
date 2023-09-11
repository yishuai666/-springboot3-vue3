package com.mufengxz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mufengxz.entity.dto.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {

}
