package com.pzh.transport.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.transport.domain.Order;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDao extends BaseMapper<Order> {
}
