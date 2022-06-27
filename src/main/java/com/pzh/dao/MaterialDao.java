package com.pzh.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.domain.Material;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MaterialDao extends BaseMapper<Material> {
}
