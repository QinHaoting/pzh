package com.pzh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.dao.CheckDao;
import com.pzh.domain.Check;
import com.pzh.service.CheckService;
import org.springframework.stereotype.Service;

@Service
public class CheckServiceImpl extends ServiceImpl<CheckDao, Check> implements CheckService {
}
