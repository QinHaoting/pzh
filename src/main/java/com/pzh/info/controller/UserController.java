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
    private UserServiceImpl userService;

    //------------------查询-----------------------
    /**
     * 根据用户账号查找用户
     * @param id 用户账号u_id
     * @return 指定用户
     */
    @RequestMapping("/getById")
    public R getById(Integer id) {
        return new R(true, userService.getById(id));
    }

    /**
     * @return 所有用户对象
     */
    @RequestMapping("/getAll")
    public R getAll() {
        return new R(true, userService.list());
    }

    /**
     * 根据用户账号查询用户
     * @param account 用户账号
     * @return 指定用户
     */
    @RequestMapping("/getByAccount")
    public R getByAccount(String account) {
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<User>();
        userLambdaQueryWrapper.eq(!account.equals(""), User::getAccount, account);
        return new R(true, userService.list(userLambdaQueryWrapper));
    }

    /**
     * 根据用户名查询用户
     * @param name 用户名
     * @return 指定用户
     */
    @RequestMapping("/getByName")
    public R getByName(String name) {
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<User>();
        userLambdaQueryWrapper.like(!name.equals(""), User::getName, name);
        return new R(true, userService.list(userLambdaQueryWrapper));
    }

    /**
     * 根据电话查询用户
     * @param phone 用户名
     * @return 指定用户
     */
    @RequestMapping("/getByPhone")
    public R getByPhone(String phone) {
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<User>();
        userLambdaQueryWrapper.like(!phone.equals(""), User::getPhone, phone);
        return new R(true, userService.list(userLambdaQueryWrapper));
    }


    //------------------添加-----------------------
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public R addUser(@RequestBody User user) {
        if (user.getRole_id() != 1) {
            user.setRole_id(2); // 默认为普通用户
        }
        return new R(true, userService.save(user));
    }


    //------------------更新-----------------------
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public R updateUser(@RequestBody User user) {
        return new R(true, userService.updateById(user));
    }

    /**
     * 根据ID删除用户
     * @param id 用户编号
     * @return 是否删除成功
     */
    @RequestMapping(value = "/delete")
    public R deleteUserByID(Integer id) {
        return new R(true, userService.removeById(id));
    }

    /**
     * 根据用户账号删除用户
     * @param account 用户账号
     * @return 是否删除成功
     */
    @RequestMapping(value = "/deleteByAccount")
    public R deleteUserByAccount(String account) {
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<User>();
        userLambdaQueryWrapper.eq(!account.equals(""), User::getAccount, account);
        return new R(true, userService.remove(userLambdaQueryWrapper));
    }
}
