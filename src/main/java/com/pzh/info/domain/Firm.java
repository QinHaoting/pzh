package com.pzh.info.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@ApiModel(value="user实体",description="用户")
@Data
@TableName("tbl_firm")
public class Firm implements Serializable {
    @ApiModelProperty(value="主键：公司编号", name="id", required=true, example = "1")
    @TableId(value = "f_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="公司简介", name="introduce", required=true, example = "好公司别加班")
    @TableField(value = "f_introduce")
    private String introduce;

    @ApiModelProperty(value="总部地址", name="address", required=true, example = "重庆")
    @TableField(value = "f_address")
    private String address;

    @ApiModelProperty(value="公司名称", name="name", required=true, example = "攀枝花不爱物流公司")
    @TableField(value = "f_name")
    private String name;

    @ApiModelProperty(value="公司负责人", name="leader", required=true, example = "宝儿姐")
    @TableField(value = "f_leader")
    private String leader;

    @ApiModelProperty(value="联系电话", name="phone", required=true, example = "110")
    @TableField(value = "f_phone")
    private String phone;
}
