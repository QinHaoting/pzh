package com.pzh.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@ApiModel(value="Car车辆实体",description="一辆车")
@Data
@TableName("tbl_car")
public class Car {
    @ApiModelProperty(value="主键：车辆编号", name="id", required=true, example = "1")
    @TableId(value = "c_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="车辆类型", name="type", required=true, example = "货车")
    @TableField(value = "c_type")
    private String type;

    @ApiModelProperty(value="车辆容量", name="capacity", required=true, example = "5000")
    @TableField(value = "c_capacity")
    private Integer capacity;

    @ApiModelProperty(value="车辆图片", name="image", example = "五菱宏光:D.jpg")
    @TableField(value = "c_image")
    private String image;

    @ApiModelProperty(value="车辆证件", name="card", required=true, example = "C1")
    @TableField(value = "c_card")
    private String card;

    @ApiModelProperty(value="车牌", name="number", required=true, example = "渝A001")
    @TableField(value = "c_number")
    private String number;

    @ApiModelProperty(value="有效位", name="valid", required=true, example = "1")
    @TableField(value = "c_valid")
    private Boolean valid;
}
