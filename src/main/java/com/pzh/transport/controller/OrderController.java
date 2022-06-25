package com.pzh.transport.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.transport.domain.Order;
import com.pzh.transport.service.impl.OrderServiceImpl;
import com.pzh.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderServiceImpl orderServiceImpl;

    //------------------查询-----------------------
    /**
     * 根据用户条件查询订单
     * @param order 输入的条件
     * @return 指定仓库
     */
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getOrderByCondition(@RequestBody Order order) {
        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<>();
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
    /**
     * 添加一个订单
     * @param order 订单
     * @return 是否添加成功
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addOrder(@RequestBody Order order) {
        return new R(orderServiceImpl.save(order));
    }


    //------------------更新-----------------------
    /**
     * 根据用户输入修改订单对象
     * @param order 前端传入的订单对象
     * @return 是否更新成功
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateOrder(@RequestBody Order order) {
        return new R(orderServiceImpl.updateById(order));
    }


    //------------------删除-----------------------
    /**
     * 根据订单编号删除一个订单
     * @param id 订单编号
     * @return 是否删除成功
     */
    @RequestMapping(value = "/delete")
    public R deleteOrder(Integer id) {
        return new R(orderServiceImpl.removeById(id));
    }
}
