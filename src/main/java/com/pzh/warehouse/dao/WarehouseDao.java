package com.pzh.warehouse.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.warehouse.domain.Warehouse;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WarehouseDao extends BaseMapper<Warehouse> {
}
