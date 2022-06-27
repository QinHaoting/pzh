package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Check;
import com.pzh.service.impl.CheckServiceImpl;
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

@Api(tags = "车辆维修控制器")
@RestController
@RequestMapping("/check")
public class CheckController {
    @Autowired
    private CheckServiceImpl checkServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询车辆维修记录", notes = "根据输入条件进行车辆维修记录查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "check", value = "输入的查询条件（json对象）", dataTypeClass = Check.class, required = true)
    })
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getRoleByCondition(@RequestBody Check check) {
        LambdaQueryWrapper<Check> checkLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据车辆维修记录编号查
        checkLambdaQueryWrapper.eq((check.getId()!=null) && (check.getId()>=0),
                                                Check::getId, check.getId());
        // 根据车辆编号查
        checkLambdaQueryWrapper.eq((check.getCar_id()!=null) && (check.getCar_id()>=0),
                                                Check::getCar_id, check.getCar_id());
        // 根据车辆维修问题查
        checkLambdaQueryWrapper.eq((check.getQuestion()!=null) && (!check.getQuestion().equals("")),
                                                Check::getQuestion, check.getQuestion());
        // 根据车辆维修结果查
        checkLambdaQueryWrapper.eq((check.getResult()!=null) && (!check.getResult().equals("")),
                                                Check::getResult, check.getResult());
        return new R(true, checkServiceImpl.list(checkLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加车辆维修记录", notes = "根据车辆维修信息进行车辆维修记录添加")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "check", value = "输入的车辆维修信息（json对象）", dataTypeClass = Check.class, required = true)
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addRole(@RequestBody Check check) {
        return new R(checkServiceImpl.save(check));
    }

    //------------------修改-----------------------
    @ApiOperation(value = "修改车辆维修记录", notes = "根据车辆维修记录ID修改车辆维修信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "check", value = "车辆维修信息", dataTypeClass = Check.class, required = true)
    })
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateRole(@RequestBody Check check) {
        return new R(checkServiceImpl.updateById(check));
    }

    //------------------删除-----------------------
    @ApiOperation(value = "删除车辆维修记录", notes = "根据ID删除车辆维修记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "车辆维修记录编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteRole(Integer id) {
        return new R(checkServiceImpl.removeById(id));
    }
}
