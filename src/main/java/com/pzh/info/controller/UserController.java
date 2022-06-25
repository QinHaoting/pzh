package com.pzh.info.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.info.domain.User;
import com.pzh.info.service.impl.UserServiceImpl;
import com.pzh.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceImpl userServiceImpl;

    //------------------查询-----------------------
    /**
     * 根据条件查询用户
     * 没有条件返回所有用户
     * @param user 查询条件
     * @return 指定用户
     */
    @RequestMapping("/get")
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
        // 根据电话查
        userLambdaQueryWrapper.eq((user.getPhone()!=null) && (!user.getPhone().equals("")),
                                            User::getPhone, user.getPhone());
        // 根据邮箱查
        userLambdaQueryWrapper.eq((user.getEmail()!=null) && (!user.getEmail().equals("")),
                                            User::getEmail, user.getEmail());
        return new R(true, userServiceImpl.list(userLambdaQueryWrapper));
    }


    //------------------添加-----------------------
    /**
     * 根据用户填写信息添加用户
     * @param user 用户信息
     * @return 是否添加
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addUser(@RequestBody User user) {
        if (user.getRole_id()!=null || user.getRole_id() != 1) {
            user.setRole_id(2); // 默认为普通用户
        }
        return new R(true, userServiceImpl.save(user));
    }


    //------------------更新-----------------------

    /**
     * 根据用户输入进行用户信息修改
     * @param user 用户输入条件
     * @return 是否修改成功
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateUser(@RequestBody User user) {
        return new R(true, userServiceImpl.updateById(user));
    }

    //------------------删除--------------------
    /**
     * 根据ID删除用户
     * @param id 用户编号
     * @return 是否删除成功
     */
    @RequestMapping(value = "/delete")
    public R deleteUserByID(Integer id) {
        return new R(true, userServiceImpl.removeById(id));
    }

    /**
     * 根据用户账号删除用户
     * @param account 用户账号
     * @return 是否删除成功
     */
    @RequestMapping(value = "/deleteByAccount")
    public R deleteUserByAccount(String account) {
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(!account.equals(""), User::getAccount, account);
        return new R(true, userServiceImpl.remove(userLambdaQueryWrapper));
    }
}
