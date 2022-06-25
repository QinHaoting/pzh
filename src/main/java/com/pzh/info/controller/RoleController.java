package com.pzh.info.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.info.domain.Role;
import com.pzh.info.domain.User;
import com.pzh.info.service.impl.RoleServiceImpl;
import com.pzh.info.service.impl.UserServiceImpl;
import com.pzh.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleServiceImpl roleServiceImpl;
    //------------------查询-----------------------
    /**
     * 根据条件查询角色
     * 没有条件返回所有角色
     * @param role 查询条件
     * @return 指定角色
     */
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getRoleByCondition(@RequestBody Role role) {
        LambdaQueryWrapper<Role> roleLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据角色编号查
        roleLambdaQueryWrapper.eq((role.getId()!=null) && (role.getId()>=0),
                                            Role::getId, role.getId());
        // 根据角色名查
        roleLambdaQueryWrapper.eq((role.getName()!=null) && (!role.getName().equals("")),
                                            Role::getName, role.getName());
        return new R(true, roleServiceImpl.list(roleLambdaQueryWrapper));
    }

    //------------------添加-----------------------
    /**
     * 添加一个角色
     * @param role 角色名
     * @return 是否添加成功
     */
    @RequestMapping("/add")
    public R addRole(@RequestBody Role role) {
        return new R(roleServiceImpl.save(role));
    }

    //------------------删除-----------------------
    /**
     * 删除一个角色
     * @param ID 角色编号
     * @return 是否删除成功
     */
    @RequestMapping("/delete")
    public R deleteRole(String ID) {
        return new R(roleServiceImpl.removeById(ID));
    }

    //------------------修改-----------------------
    /**
     * 根据角色编号修改一个角色
     * @param role 角色信息
     * @return 是否修改成功
     */
    @RequestMapping("/update")
    public R updateRole(@RequestBody Role role) {
        return new R(roleServiceImpl.updateById(role));
    }
}
