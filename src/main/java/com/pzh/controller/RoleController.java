package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Role;
import com.pzh.service.impl.RoleServiceImpl;
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

@Api(tags = "角色控制器")
@Transactional
@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleServiceImpl roleServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询角色", notes = "根据输入条件进行角色查询")
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getRoleByCondition(@RequestBody Role role) {
        LambdaQueryWrapper<Role> roleLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 筛选出有效的角色
        roleLambdaQueryWrapper.eq(true, Role::getValid, true);
        // 根据角色编号查
        roleLambdaQueryWrapper.eq((role.getId()!=null) && (role.getId()>=0),
                                            Role::getId, role.getId());
        // 根据角色名查
        roleLambdaQueryWrapper.eq((role.getName()!=null) && (!role.getName().equals("")),
                                            Role::getName, role.getName());
        return new R(true, roleServiceImpl.list(roleLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    @ApiOperation(value = "添加角色", notes = "根据角色信息进行角色添加")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addRole(@RequestBody Role role) {
        role.setValid(true); // 将角色启用
        return new R(roleServiceImpl.save(role));
    }

    //------------------修改-----------------------
    @ApiOperation(value = "修改角色", notes = "根据角色编号ID修改角色信息")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateRole(@RequestBody Role role) {
        return new R(roleServiceImpl.updateById(role));
    }

    //------------------删除-----------------------
    @ApiOperation(value = "删除角色", notes = "根据ID删除角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "角色编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public R deleteRole(Integer id) {
        Role role = roleServiceImpl.getById(id);
        role.setValid(false); // 有效位设为失效
        return new R(roleServiceImpl.updateById(role));
    }
}
