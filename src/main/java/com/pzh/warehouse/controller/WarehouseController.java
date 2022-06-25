package com.pzh.warehouse.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.transport.domain.Order;
import com.pzh.warehouse.domain.Warehouse;
import com.pzh.warehouse.service.WarehouseService;
import com.pzh.util.R;
import com.pzh.warehouse.service.impl.WarehouseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/warehouse")
public class WarehouseController {
    @Autowired
    private WarehouseServiceImpl warehouseServiceImpl;

    //------------------查询-----------------------
    /**
     * 根据条件查询仓库
     * 没有条件返回所有仓库
     * @param warehouse 查询条件
     * @return 指定仓库
     */
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getWarehouseByCondition(@RequestBody Warehouse warehouse) {
        LambdaQueryWrapper<Warehouse> warehouseLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据仓库编号查
        warehouseLambdaQueryWrapper.eq((warehouse.getId()!=null) && (warehouse.getId()>=0),
                                                Warehouse::getId, warehouse.getId());
        // 根据公司编号查
        warehouseLambdaQueryWrapper.eq((warehouse.getFirm_id()!=null) && (warehouse.getFirm_id()>=0),
                                                Warehouse::getFirm_id, warehouse.getFirm_id());
        // 根据仓库地址查
        warehouseLambdaQueryWrapper.eq((warehouse.getAddress()!=null) && (!warehouse.getAddress().equals("")),
                                                Warehouse::getAddress, warehouse.getAddress());
        return new R(true, warehouseServiceImpl.list(warehouseLambdaQueryWrapper));
    }


    //------------------添加-----------------------
    /**
     * 添加一个仓库
     * @param warehouse 仓库信息
     * @return 是否添加成功
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addOrder(@RequestBody Warehouse warehouse) {
        return new R(warehouseServiceImpl.save(warehouse));
    }


    //------------------更新-----------------------
    /**
     * 根据用户输入修改仓库信息
     * @param warehouse 前端传入的仓库对象
     * @return 是否删除成功
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateWarehouse(@RequestBody Warehouse warehouse) {
        return new R(warehouseServiceImpl.updateById(warehouse));
    }


    //------------------删除-----------------------
    /**
     * 根据仓库编号删除一个仓库
     * @param id 仓库编号
     * @return 是否删除成功
     */
    @RequestMapping(value = "/delete")
    public R deleteWarehouse(Integer id) {
        return new R(warehouseServiceImpl.removeById(id));
    }
}
