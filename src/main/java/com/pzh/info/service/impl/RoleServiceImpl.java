package com.pzh.info.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.info.dao.RoleDao;
import com.pzh.info.domain.Role;
import com.pzh.info.service.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleDao, Role> implements RoleService {
}
