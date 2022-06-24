package com.pzh.warehouse.dao;

import com.pzh.warehouse.domain.Warehouse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class WarehouseTest {
    @Autowired
    private WarehouseDao warehouseDao;

    @Test
    void getById() {
        Warehouse warehouse = warehouseDao.selectById("w001");
        System.out.println(warehouse);
    }
}
