package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Role;
import com.pzh.domain.User;
import com.pzh.service.impl.RoleServiceImpl;
import com.pzh.service.impl.UserServiceImpl;
import com.pzh.util.R;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;

@RestController
public class RegisterController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private RoleServiceImpl roleServiceImpl;

    /**
     * 用户账号检查
     * @param account 用户账号
     * @return 用户账号是否被注册
     */
    @Transactional
    @ApiOperation(value = "用户账号检查", notes = "检查用户账号是否重复")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "account", value = "用户编号", dataTypeClass = String.class, required = true)
    })
    @RequestMapping(value = "/registerCheck", method = RequestMethod.GET)
    public R userAccountCheck(String account){
        if (account!=null && !account.equals("")) {
            return new R(false, null, "用户名为空");
        }
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(true, User::getAccount, account);
        // 查询用户是否存在
        User destUser = userServiceImpl.getOne(userLambdaQueryWrapper);
        if(destUser != null){ // 用户账号已存在
            return new R(false, null, "用户账号已被注册");
        }
        return new R(true, null, "用户账号可用");
    }

    @Transactional
    @PostMapping("/register")
    public R register(@RequestBody User user, HttpSession session){
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(true, User::getAccount, user.getAccount());
        // 查询用户是否存在
        User destUser = userServiceImpl.getOne(userLambdaQueryWrapper);
        if(destUser != null){ // 用户账号已存在
            return new R(false, null, "用户账号已被注册");
        }

        if (user.getPassword() == null || user.getPassword().equals("")) {
            return new R(false, null, "密码为空");
        }
        // 对输入的密码加密
        String password = new String(DigestUtils.md5Digest(user.getPassword().getBytes(StandardCharsets.UTF_8)), StandardCharsets.UTF_8);
        user.setPassword(password);
        user.setValid(true); // 启用用户
        boolean flag = userServiceImpl.save(user);
        if (flag) {
            // 返回信息添加：角色类型
            Integer role_id = 2;
            Role role = roleServiceImpl.getById(2); // 默认是普通用户
            user.setRole_id(role.getId());
            user.setRole_name(role.getName());
            // 以下信息不传
            user.setPassword(null); // 不传密码
            user.setValid(null);

            // 注册后默认登录
            // 将用户数据放入session
            session.setAttribute("userInfo", user);
            // 设置session过期时间
            session.setMaxInactiveInterval(60 * 60); // 60分钟过期
            return new R(true, user, "注册成功");
        }
        return new R(false, null, "注册失败");
    }
}
