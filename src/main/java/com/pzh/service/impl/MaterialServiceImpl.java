package com.pzh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pzh.dao.MaterialDao;
import com.pzh.domain.Material;
import com.pzh.service.MaterialService;
import org.springframework.stereotype.Service;

@Service
public class MaterialServiceImpl extends ServiceImpl<MaterialDao, Material> implements MaterialService {
}
