package com.pzh.warehouse.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.warehouse.dao.WarehouseDao;
import com.pzh.warehouse.domain.Warehouse;
import com.pzh.warehouse.service.WarehouseService;
import org.springframework.stereotype.Service;

@Service
public class WarehouseServiceImpl extends ServiceImpl<WarehouseDao, Warehouse> implements WarehouseService {
}
