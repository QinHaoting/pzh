package com.pzh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.dao.AnnounceDao;
import com.pzh.domain.Announce;
import com.pzh.service.AnnounceService;
import org.springframework.stereotype.Service;

@Service
public class AnnounceServiceImpl extends ServiceImpl<AnnounceDao, Announce> implements AnnounceService {
}
