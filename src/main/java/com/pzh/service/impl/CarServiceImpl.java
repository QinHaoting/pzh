package com.pzh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.dao.CarDao;
import com.pzh.domain.Car;
import com.pzh.service.CarService;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl extends ServiceImpl<CarDao, Car> implements CarService {
}
