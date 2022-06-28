package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Warehouse;
import com.pzh.service.impl.WarehouseServiceImpl;
import com.pzh.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "仓库控制器")
@RestController
@RequestMapping("/warehouse")
public class WarehouseController {
    @Autowired
    private WarehouseServiceImpl warehouseServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询仓库", notes = "根据输入条件进行仓库查询")
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getWarehouseByCondition(@RequestBody Warehouse warehouse) {
        LambdaQueryWrapper<Warehouse> warehouseLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 筛选出有效的仓库
        warehouseLambdaQueryWrapper.eq(true, Warehouse::getValid, true);
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
    @ApiOperation(value = "添加仓库", notes = "根据仓库信息添加仓库")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addOrder(@RequestBody Warehouse warehouse) {
        warehouse.setValid(true); // 将仓库启用
        return new R(warehouseServiceImpl.save(warehouse));
    }


    //------------------更新-----------------------
    @ApiOperation(value = "修改仓库", notes = "根据仓库编号ID修改仓库信息")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateWarehouse(@RequestBody Warehouse warehouse) {
        return new R(warehouseServiceImpl.updateById(warehouse));
    }

    //------------------删除-----------------------
    @ApiOperation(value = "删除仓库", notes = "根据仓库编号ID删除仓库")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "仓库编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteWarehouse(Integer id) {
        Warehouse warehouse = warehouseServiceImpl.getById(id);
        warehouse.setValid(false); // 有效位设为失效
        return new R(warehouseServiceImpl.updateById(warehouse));
    }
}
