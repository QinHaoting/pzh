package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Goods;
import com.pzh.service.impl.GoodsServiceImpl;
import com.pzh.util.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "货物控制器")
@Transactional
@RestController
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsServiceImpl goodsServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询货物", notes = "根据输入条件进行货物查询")
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getGoodsByCondition(@RequestBody Goods goods) {
        LambdaQueryWrapper<Goods> goodsLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 筛选出有效的货物
        goodsLambdaQueryWrapper.eq(true, Goods::getValid, true);
        // 根据货物编号查
        goodsLambdaQueryWrapper.eq((goods.getId()!=null) && (goods.getId()>=0),
                                                Goods::getId, goods.getId());
        // 根据仓库编号查
        goodsLambdaQueryWrapper.eq((goods.getWarehouse_id()!=null) && (goods.getWarehouse_id()>=0),
                                                Goods::getWarehouse_id, goods.getWarehouse_id());
        // 根据货物类型查
        goodsLambdaQueryWrapper.eq((goods.getType()!=null) && (!goods.getType().equals("")),
                                                Goods::getType, goods.getType());
        // 根据货物描述查
        goodsLambdaQueryWrapper.eq((goods.getDescription()!=null) && (!goods.getDescription().equals("")),
                                                Goods::getDescription, goods.getDescription());
        // 根据货物状态查
        goodsLambdaQueryWrapper.eq((goods.getStatus()!=null) && (goods.getStatus()>=0),
                                                Goods::getStatus, goods.getStatus());
        return new R(true, goodsServiceImpl.list(goodsLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加货物", notes = "根据货物信息进行货物添加")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addGoods(@RequestBody Goods goods) {
        goods.setValid(true); // 将有效位启用
        return new R(goodsServiceImpl.save(goods), goods);
    }

    //------------------修改-----------------------
    @ApiOperation(value = "修改货物", notes = "根据货物编号ID修改货物信息")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateGoods(@RequestBody Goods goods) {
        return new R(goodsServiceImpl.updateById(goods));
    }

    //------------------删除-----------------------
    @ApiOperation(value = "删除货物", notes = "根据ID删除货物")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "货物编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteGoods(Integer id) {
        Goods goods = goodsServiceImpl.getById(id);
        goods.setValid(false); // 有效位设为失效
        return new R(goodsServiceImpl.updateById(goods));
    }
}
