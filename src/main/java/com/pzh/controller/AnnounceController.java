package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Announce;
import com.pzh.service.impl.AnnounceServiceImpl;
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

@Api(tags = "公告控制器")
@RestController
@RequestMapping("/announce")
public class AnnounceController {
    @Autowired
    private AnnounceServiceImpl announceServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询公告", notes = "根据输入条件进行公告查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "announce", value = "输入的查询条件（json对象）", dataTypeClass = Announce.class, required = true)
    })
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getRoleByCondition(@RequestBody Announce announce) {
        LambdaQueryWrapper<Announce> announceLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据公告编号查
        announceLambdaQueryWrapper.eq((announce.getId()!=null) && (announce.getId()>=0),
                                                Announce::getId, announce.getId());
        // 根据公告标题查
        announceLambdaQueryWrapper.eq((announce.getTitle()!=null) && (!announce.getTitle().equals("")),
                                                Announce::getTitle, announce.getTitle());
        // 根据发布者查
        announceLambdaQueryWrapper.eq((announce.getPublisher()!=null) && (!announce.getPublisher().equals("")),
                                                Announce::getPublisher, announce.getPublisher());
        return new R(true, announceServiceImpl.list(announceLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加公告", notes = "根据公告信息进行公告添加")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "announce", value = "输入的公告信息（json对象）", dataTypeClass = Announce.class, required = true)
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addRole(@RequestBody Announce announce) {
        return new R(announceServiceImpl.save(announce));
    }

    //------------------修改-----------------------
    @ApiOperation(value = "修改公告", notes = "根据公告编号ID修改公告信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "announce", value = "公告信息", dataTypeClass = Announce.class, required = true)
    })
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateRole(@RequestBody Announce announce) {
        return new R(announceServiceImpl.updateById(announce));
    }

    //------------------删除-----------------------
    @ApiOperation(value = "删除公告", notes = "根据ID删除公告")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "公告编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteRole(Integer id) {
        return new R(announceServiceImpl.removeById(id));
    }
}
