package com.pzh.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pzh.domain.Goods;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GoodsDao extends BaseMapper<Goods> {
}
