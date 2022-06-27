package com.pzh.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.domain.Announce;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnnounceDao extends BaseMapper<Announce> {
}
