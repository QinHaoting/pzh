package com.pzh.aspect;


import com.pzh.util.R;
import com.pzh.util.result.VerifyUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

@Component
@Aspect
public class AroundCut {
    public static final String POINT_CUT = "execution(* com.pzh.controller..*.*(..))"+ " && "
            + "!execution(* com.pzh.controller.LoginController.login(..))" + " && "  // 排除登录
            + "!execution(* com.pzh.controller.RegisterController.*(..))"; // 排除注册


    @Around(AroundCut.POINT_CUT)
    public R checkSession(ProceedingJoinPoint pjp) throws Throwable {
        //获取session
        HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
        //用于判断用户登入是否有效
        if(VerifyUtil.isNull(session.getAttribute("userInfo"))){
            //返回登录失败
            return new R(false, null, "未登录");
        }
        return (R) pjp.proceed();
    }
}

