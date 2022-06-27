package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.User;
import com.pzh.service.impl.UserServiceImpl;
import com.pzh.util.R;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = "用户控制器")
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceImpl userServiceImpl;

    //------------------查询-----------------------
    @ApiOperation(value = "查询用户", notes = "根据输入条件进行用户查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "user", value = "输入的查询条件（json对象）", dataTypeClass = User.class, required = true)
    })
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getUserByCondition(@RequestBody User user) {
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 根据用户编号查
        userLambdaQueryWrapper.eq((user.getId()!=null) && (user.getId()>=0),
                                            User::getId, user.getId());
        // 根据用户账号查
        userLambdaQueryWrapper.eq((user.getAccount()!=null) && (!user.getAccount().equals("")),
                                            User::getAccount, user.getAccount());
        // 根据用户名查
        userLambdaQueryWrapper.eq((user.getName()!=null) && (!user.getName().equals("")),
                                            User::getName, user.getName());
        // 根据角色编号查
        userLambdaQueryWrapper.eq((user.getRole_id()!=null) && (user.getRole_id()>=0),
                                            User::getRole_id, user.getRole_id());
        // 根据电话查
        userLambdaQueryWrapper.eq((user.getPhone()!=null) && (!user.getPhone().equals("")),
                                            User::getPhone, user.getPhone());
        // 根据邮箱查
        userLambdaQueryWrapper.eq((user.getEmail()!=null) && (!user.getEmail().equals("")),
                                            User::getEmail, user.getEmail());
        return new R(true, userServiceImpl.list(userLambdaQueryWrapper));
    }


    //------------------添加-----------------------
    @ApiOperation(value = "添加用户", notes = "根据用户填写的信息添加用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "user", value = "输入的用户信息（json对象）", dataTypeClass = User.class, required = true)
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addUser(@RequestBody User user) {
        if (user.getRole_id()!=null || user.getRole_id() != 1) {
            user.setRole_id(2); // 默认为普通用户
        }
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        String account = user.getAccount(); // 用户账号
        userLambdaQueryWrapper.eq(account!=null && !account.equals(""),
                                        User::getAccount, account);
        if (userServiceImpl.getOne(userLambdaQueryWrapper) != null) {
            return new R(false, null, "用户账号已被注册");
        }
        return new R(true, userServiceImpl.save(user), "用户注册成功");
    }


    //------------------更新-----------------------
    @ApiOperation(value = "修改用户信息", notes = "根据用户编号ID修改用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "user", value = "输入的用户信息（json对象）", dataTypeClass = User.class, required = true)
    })
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateUser(@RequestBody User user) {
        return new R(true, userServiceImpl.updateById(user));
    }

    //------------------删除--------------------
    @ApiOperation(value = "根据ID删除用户", notes = "根据用户编号删除用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户编号", dataTypeClass = Integer.class, required = true)
    })
    @RequestMapping(value = "/deleteByID", method = RequestMethod.GET)
    public R deleteUserByID(Integer id) {
        return new R(true, userServiceImpl.removeById(id));
    }

    /**
     * 根据用户账号删除用户
     * @param account 用户账号
     * @return 是否删除成功
     */
    @ApiOperation(value = "根据account删除用户", notes = "根据用户账号删除用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "account", value = "用户账号", dataTypeClass = String.class, required = true)
    })
    @RequestMapping(value = "/deleteByAccount", method = RequestMethod.GET)
    public R deleteUserByAccount(String account) {
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(!account.equals(""), User::getAccount, account);
        return new R(true, userServiceImpl.remove(userLambdaQueryWrapper));
    }
}