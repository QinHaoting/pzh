package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Firm;
import com.pzh.service.impl.FirmServiceImpl;
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

@Api(tags = "公司控制器")
@RestController
@RequestMapping("/firm")
public class FirmController {
    @Autowired
    private FirmServiceImpl firmServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询公司", notes = "根据输入条件进行公司查询")
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getFirmByCondition(@RequestBody Firm firm) {
        LambdaQueryWrapper<Firm> firmLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 筛选出有效的公司
        firmLambdaQueryWrapper.eq(true, Firm::getValid, true);
        // 根据公司编号查
        firmLambdaQueryWrapper.eq((firm.getId()!=null) && (firm.getId()>=0),
                                            Firm::getId, firm.getId());
        // 根据公司名称查
        firmLambdaQueryWrapper.eq((firm.getName()!=null) && (!firm.getName().equals("")),
                                            Firm::getName, firm.getName());
        // 根据公司负责人查
        firmLambdaQueryWrapper.eq((firm.getLeader()!=null) && (!firm.getLeader().equals("")),
                                            Firm::getLeader, firm.getLeader());
        // 根据电话查
        firmLambdaQueryWrapper.eq((firm.getPhone()!=null) && (!firm.getPhone().equals("")),
                                            Firm::getPhone, firm.getPhone());
        return new R(true, firmServiceImpl.list(firmLambdaQueryWrapper));
    }


    //------------------添加-----------------------
    @ApiOperation(value = "添加公司", notes = "根据输入的公司信息添加公司")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addFirm(@RequestBody Firm firm) {
        firm.setValid(true); // 启用有效位
        return new R(true, firmServiceImpl.save(firm));
    }


    //------------------更新-----------------------
    @ApiOperation(value = "修改公司", notes = "根据公司编号修改公司信息")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateFirm(@RequestBody Firm firm) {
        return new R(true, firmServiceImpl.updateById(firm));
    }

    //------------------删除--------------------
    @ApiOperation(value = "删除公司", notes = "根据公司编号删除公司")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "公司编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteFirmByID(Integer id) {
        Firm firm = firmServiceImpl.getById(id);
        firm.setValid(false); // 有效位设为失效
        return new R(true, firmServiceImpl.updateById(firm));
    }
}
