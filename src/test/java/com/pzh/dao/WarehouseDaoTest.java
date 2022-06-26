package com.pzh.dao;

import com.pzh.domain.Warehouse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class WarehouseDaoTest {
    @Autowired
    private WarehouseDao warehouseDao;

    @Test
    void getById() {
        Warehouse warehouse = warehouseDao.selectById("1");
        System.out.println(warehouse);
    }
}
