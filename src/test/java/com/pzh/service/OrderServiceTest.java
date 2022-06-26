package com.pzh.service;

import com.pzh.domain.Order;
import com.pzh.service.impl.OrderServiceImpl;
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
