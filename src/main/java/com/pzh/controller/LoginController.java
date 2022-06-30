package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Role;
import com.pzh.domain.User;
import com.pzh.service.impl.RoleServiceImpl;
import com.pzh.service.impl.UserServiceImpl;
import com.pzh.util.R;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;

@Api(tags = "登录控制器")
@Transactional
@RestController
public class LoginController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private RoleServiceImpl roleServiceImpl;


    @PostMapping("/login")
    public R login(@RequestBody User user, HttpSession session){
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(true, User::getAccount, user.getAccount());
        // 查询用户是否存在
        User loginUser = userServiceImpl.getOne(userLambdaQueryWrapper);
        if(loginUser == null){ // 用户不存在
            return new R(false, null, "用户不存在");
        }
        if (user.getPassword() == null || user.getPassword().equals("")) {
            return new R(false, null, "密码为空");
        }
        // 对输入的密码加密
        String userPassword = new String(DigestUtils.md5Digest(user.getPassword().getBytes(StandardCharsets.UTF_8)), StandardCharsets.UTF_8);
        System.out.println(userPassword);
        if (loginUser.getPassword().equals(userPassword)) { // 正常登入
            User userInfo = new User();
            // 返回用户账号
            userInfo.setAccount(loginUser.getAccount());
            // 返回信息添加：角色类型
            Role role = roleServiceImpl.getById(loginUser.getRole_id());
            userInfo.setRole_id(role.getId());
            userInfo.setRole_name(role.getName());
            // 返回用户信息
            userInfo.setId(loginUser.getId());
            userInfo.setPhone(loginUser.getPhone());
            userInfo.setEmail(loginUser.getEmail());
            userInfo.setName(loginUser.getName());
            // 将用户数据放入session
            session.setAttribute("userInfo", userInfo);
            // 设置session过期时间
            session.setMaxInactiveInterval(60 * 60); // 60分钟过期
            return new R(true, userInfo, "登录成功");
        }
        return new R(false, null, "密码不正确");
    }

    @GetMapping("/loginOut")
    public R loginOut(HttpSession session){
        session.removeAttribute("userInfo");
        return new R(true, null, "注销成功");
    }
}
