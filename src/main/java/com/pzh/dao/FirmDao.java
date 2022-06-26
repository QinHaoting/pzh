package com.pzh.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.domain.Firm;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FirmDao extends BaseMapper<Firm> {
}
