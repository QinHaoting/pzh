package com.pzh.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.domain.Order;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDao extends BaseMapper<Order> {
}
