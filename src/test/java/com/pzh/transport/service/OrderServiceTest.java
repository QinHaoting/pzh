package com.pzh.transport.service;

import com.pzh.transport.domain.Order;
import com.pzh.transport.service.impl.OrderServiceImpl;
import com.pzh.warehouse.dao.WarehouseDao;
import com.pzh.warehouse.domain.Warehouse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class OrderServiceTest {
    @Autowired
    private OrderServiceImpl orderService;

    @Test
    void getById() {
        Order order = orderService.getById(1);
        System.out.println(order);
    }
}
