package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Car;
import com.pzh.service.impl.CarServiceImpl;
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

@Api(tags = "车辆控制器")
@RestController
@RequestMapping("/car")
public class CarController {
    @Autowired
    private CarServiceImpl carServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询车辆", notes = "根据输入条件进行车辆查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "car", value = "输入的查询条件（json对象）", dataTypeClass = Car.class, required = true)
    })
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getRoleByCondition(@RequestBody Car car) {
        LambdaQueryWrapper<Car> carLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据车辆编号查
        carLambdaQueryWrapper.eq((car.getId()!=null) && (car.getId()>=0),
                                                Car::getId, car.getId());
        // 根据车辆类型查
        carLambdaQueryWrapper.eq((car.getType()!=null) && (!car.getType().equals("")),
                                                Car::getType, car.getType());
        // 根据车辆证件查
        carLambdaQueryWrapper.eq((car.getCard()!=null) && (!car.getCard().equals("")),
                                                Car::getCard, car.getCard());
        // 根据车牌查
        carLambdaQueryWrapper.eq((car.getNumber()!=null) && (!car.getNumber().equals("")),
                                                Car::getNumber, car.getNumber());
        return new R(true, carServiceImpl.list(carLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加车辆", notes = "根据车辆信息进行车辆添加")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "car", value = "输入的车辆信息（json对象）", dataTypeClass = Car.class, required = true)
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addRole(@RequestBody Car car) {
        return new R(carServiceImpl.save(car));
    }

    //------------------修改-----------------------
    @ApiOperation(value = "修改车辆", notes = "根据车辆编号ID修改车辆信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "car", value = "车辆信息", dataTypeClass = Car.class, required = true)
    })
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateRole(@RequestBody Car car) {
        return new R(carServiceImpl.updateById(car));
    }

    //------------------删除-----------------------
    @ApiOperation(value = "删除车辆", notes = "根据ID删除车辆")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "车辆编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteRole(Integer id) {
        return new R(carServiceImpl.removeById(id));
    }
}