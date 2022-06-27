package com.pzh.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@ApiModel(value="Firm公司实体")
@Data
@TableName("tbl_firm")
public class Firm implements Serializable {
    @ApiModelProperty(value="主键：公司编号", name="id", required=true, example = "1")
    @TableId(value = "f_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="公司简介", name="introduce", required=true, example = "好的公司都不会加班")
    @TableField(value = "f_introduce")
    private String introduce;

    @ApiModelProperty(value="总部地址", name="address", required=true, example = "重庆大学")
    @TableField(value = "f_address")
    private String address;

    @ApiModelProperty(value="公司名称", name="name", required=true, example = "攀枝花不爱物流公司")
    @TableField(value = "f_name")
    private String name;

    @ApiModelProperty(value="公司负责人", name="leader", required=true, example = "宝儿姐")
    @TableField(value = "f_leader")
    private String leader;

    @ApiModelProperty(value="联系电话", name="phone", required=true, example = "10086")
    @TableField(value = "f_phone")
    private String phone;

    @ApiModelProperty(value="创办时间", name="date", required=true, example = "10086")
    @TableField(value = "f_date")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date date;
}
