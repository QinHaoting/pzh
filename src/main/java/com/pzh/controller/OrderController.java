package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Order;
import com.pzh.service.impl.OrderServiceImpl;
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

@Api(tags = "订单控制器")
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderServiceImpl orderServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询订单", notes = "根据输入条件进行订单查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "order", value = "输入的查询条件（json对象）", dataTypeClass = Order.class, required = true)
    })
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getOrderByCondition(@RequestBody Order order) {
        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 筛选出有效的订单
        orderLambdaQueryWrapper.eq(true, Order::getValid, true);
        // 根据订单编号查
        orderLambdaQueryWrapper.eq((order.getId()!=null) && (order.getId()>=0),
                                            Order::getId, order.getId());
        // 车辆编号查
        orderLambdaQueryWrapper.eq((order.getCar_id()!=null) && (order.getCar_id()>=0),
                                            Order::getCar_id, order.getCar_id());
        // 用户编号查
        orderLambdaQueryWrapper.eq((order.getUser_id()!=null) && (order.getUser_id()>=0),
                                            Order::getUser_id, order.getUser_id());
        // 出发地查
        orderLambdaQueryWrapper.eq((order.getStart_address()!=null) && (!order.getStart_address().equals("")),
                                            Order::getStart_address, order.getStart_address());
        // 目的地查
        orderLambdaQueryWrapper.eq((order.getEnd_address()!=null) && (!order.getEnd_address().equals("")),
                                            Order::getEnd_address, order.getEnd_address());
        // 当前状态查
        orderLambdaQueryWrapper.eq((order.getStatus()!=null) && (order.getStatus()>=0),
                                            Order::getStatus, order.getStatus());
        // 货物编号查
        orderLambdaQueryWrapper.eq((order.getGoods_id()!=null) && (order.getGoods_id()>=0),
                                            Order::getGoods_id, order.getGoods_id());
        return new R(true, orderServiceImpl.list(orderLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加订单", notes = "根据订单信息进行订单添加")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "order", value = "输入的角色信息（json对象）", dataTypeClass = Order.class, required = true)
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addOrder(@RequestBody Order order) {
        order.setValid(true); // 启用有效位
        return new R(orderServiceImpl.save(order));
    }


    //------------------更新-----------------------
    @ApiOperation(value = "修改订单", notes = "根据订单编号ID修改订单信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "order", value = "订单信息", dataTypeClass = Order.class, required = true)
    })
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateOrder(@RequestBody Order order) {
        return new R(orderServiceImpl.updateById(order));
    }


    //------------------删除-----------------------
    @ApiOperation(value = "删除订单", notes = "根据订单编号ID删除订单")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "订单编号", dataTypeClass = Order.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteOrder(Integer id) {
        Order order = orderServiceImpl.getById(id);
        order.setValid(false); // 有效位设为失效
        return new R(orderServiceImpl.updateById(order));
    }
}
