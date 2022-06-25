package com.pzh.transport.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.transport.dao.OrderDao;
import com.pzh.transport.domain.Order;
import com.pzh.transport.service.OrderService;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl extends ServiceImpl<OrderDao, Order> implements OrderService {
}
