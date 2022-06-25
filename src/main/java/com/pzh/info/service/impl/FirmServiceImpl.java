package com.pzh.info.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.info.dao.FirmDao;
import com.pzh.info.domain.Firm;
import com.pzh.info.service.FirmService;
import org.springframework.stereotype.Service;

@Service
public class FirmServiceImpl extends ServiceImpl<FirmDao, Firm> implements FirmService {
}
