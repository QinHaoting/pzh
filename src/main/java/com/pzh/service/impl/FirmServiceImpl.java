package com.pzh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.dao.FirmDao;
import com.pzh.domain.Firm;
import com.pzh.service.FirmService;
import org.springframework.stereotype.Service;

@Service
public class FirmServiceImpl extends ServiceImpl<FirmDao, Firm> implements FirmService {
}
