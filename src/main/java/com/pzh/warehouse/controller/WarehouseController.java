package com.pzh.warehouse.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.warehouse.domain.Warehouse;
import com.pzh.warehouse.service.WarehouseService;
import com.pzh.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/warehouse")
public class WarehouseController {
    @Autowired
    private WarehouseService warehouseService;

    /**
     * 根据仓库编号查找仓库
     * @param id 仓库编号w_id
     * @return 指定仓库
     */
    @RequestMapping("/getById")
    public R getById(String id) {
        return new R(true, warehouseService.getById(id));
    }

    /**
     * @return 所有仓库对象
     */
    @RequestMapping("/getAll")
    public R getAll() {
        return new R(true, warehouseService.list());
    }

    /**
     * 根据仓库地址查询仓库
     * @param address 仓库地址
     * @return 指定仓库
     */
    @RequestMapping("/getByAddress")
    public R getByName(String address) {
        LambdaQueryWrapper<Warehouse> userLambdaQueryWrapper = new LambdaQueryWrapper<Warehouse>();
        userLambdaQueryWrapper.like(!address.equals(""), Warehouse::getAddress, address);
        return new R(true, warehouseService.list(userLambdaQueryWrapper));
    }
}
