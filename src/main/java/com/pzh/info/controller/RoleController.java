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
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleServiceImpl roleService;

    /**
     * 根据角色ID查找角色
     * @param id 角色ID
     * @return 指定用户
     */
    @RequestMapping("/getById")
    public R getRoleById(Integer id) {
        return new R(true, roleService.getById(id));
    }

    /**
     * @return 所有角色
     */
    @RequestMapping("/getAll")
    public R getAllRoles() {
        return new R(true, roleService.list());
    }

    /**
     * 根据角色名查询角色
     * @param name 角色名
     * @return 指定角色
     */
    @RequestMapping("/getByName")
    public R getRoleByName(String name) {
        LambdaQueryWrapper<Role> userLambdaQueryWrapper = new LambdaQueryWrapper<Role>();
        userLambdaQueryWrapper.like(!name.equals(""), Role::getName, name);
        return new R(true, roleService.list(userLambdaQueryWrapper));
    }

    /**
     * 添加一个角色
     * @param role 角色名
     * @return 是否添加成功
     */
    @RequestMapping("/add")
    public R addRole(@RequestBody Role role) {
        return new R(roleService.save(role));
    }

    /**
     * 删除一个角色
     * @param ID 角色编号
     * @return 是否删除成功
     */
    @RequestMapping("/delete")
    public R deleteRole(String ID) {
        return new R(roleService.removeById(ID));
    }

    /**
     * 根据角色编号修改一个角色
     * @param role 角色信息
     * @return 是否删除成功
     */
    @RequestMapping("/update")
    public R deleteRole(@RequestBody Role role) {
        return new R(roleService.updateById(role));
    }
}
