package com.pzh.info.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.info.domain.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao extends BaseMapper<User> {
}
