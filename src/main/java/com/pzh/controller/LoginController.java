package com.pzh.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pzh.domain.Role;
import com.pzh.domain.User;
import com.pzh.service.impl.RoleServiceImpl;
import com.pzh.service.impl.UserServiceImpl;
import com.pzh.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

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
        // 1.查询用户是否存在
        User loginUser = userServiceImpl.getOne(userLambdaQueryWrapper);
        if(loginUser == null){//用户不存在
            return new R(false, null, "用户不存在");
//            return  DataResult.errByErrCode(Code.LOGIN_NOT_EXIST);
        }
        if (user.getPassword() == null || user.getPassword().equals("")) {
            return new R(false, null, "密码为空");
        }
        String userPassword = Arrays.toString(DigestUtils.md5Digest(user.getPassword().getBytes(StandardCharsets.UTF_8)));
        String loginUserPassword = Arrays.toString(DigestUtils.md5Digest(loginUser.getPassword().getBytes(StandardCharsets.UTF_8)));
//        System.out.println();
//        System.out.println(pwd);
//        byte[]

        if (userPassword.equals(loginUserPassword)) { // 正常登入
            User userInfo = new User();
            // 返回用户账号
            userInfo.setAccount(loginUser.getAccount());
            // 返回信息添加：角色类型
            Role role = roleServiceImpl.getById(loginUser.getRole_id());
            userInfo.setRole_name(role.getName());

            // 3.将用户数据放入session
            session.setAttribute("userInfo", userInfo);
            // 4.设置session过期时间
            session.setMaxInactiveInterval(20 * 60);
            return new R(true, null, "登录成功");
        }
        return new R(false, null, "密码不正确");
    }

    @GetMapping("/loginOut")
    public R loginOut(HttpSession session){
        session.removeAttribute("userInfo");
        return new R(true, null, "注销成功");
    }
}
