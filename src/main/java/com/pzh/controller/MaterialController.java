package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Material;
import com.pzh.service.impl.MaterialServiceImpl;
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

@Api(tags = "物资控制器")
@RestController
@RequestMapping("/material")
public class MaterialController {
    @Autowired
    private MaterialServiceImpl materialServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询物资", notes = "根据输入条件进行物资查询")
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getMaterialByCondition(@RequestBody Material material) {
        LambdaQueryWrapper<Material> materialLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 筛选出有效的物资
        materialLambdaQueryWrapper.eq(true, Material::getValid, true);
        // 根据物资编号查
        materialLambdaQueryWrapper.eq((material.getId()!=null) && (material.getId()>=0),
                                                Material::getId, material.getId());
        // 根据仓库编号查
        materialLambdaQueryWrapper.eq((material.getWarehouse_id()!=null) && (material.getWarehouse_id()>=0),
                                                Material::getWarehouse_id, material.getWarehouse_id());
        // 根据物资名称查
        materialLambdaQueryWrapper.eq((material.getName()!=null) && (!material.getName().equals("")),
                                                Material::getName, material.getName());
        return new R(true, materialServiceImpl.list(materialLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加物资", notes = "根据物资信息进行物资添加")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addMaterial(@RequestBody Material material) {
        material.setValid(true); // 启用有效位
        return new R(materialServiceImpl.save(material));
    }

    //------------------修改-----------------------
    @ApiOperation(value = "修改物资", notes = "根据物资编号ID修改物资信息")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateMaterial(@RequestBody Material material) {
        return new R(materialServiceImpl.updateById(material));
    }

    //------------------删除-----------------------
    @ApiOperation(value = "删除物资", notes = "根据ID删除物资")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "物资编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteMaterial(Integer id) {
        Material material = materialServiceImpl.getById(id);
        material.setValid(false); // 有效位设为失效
        return new R(materialServiceImpl.updateById(material));
    }
}
