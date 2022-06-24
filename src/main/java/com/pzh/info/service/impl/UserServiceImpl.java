package com.pzh.info.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.info.dao.UserDao;
import com.pzh.info.domain.User;
import com.pzh.info.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
}
