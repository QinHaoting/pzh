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

@ApiModel(value="Check车辆维修实体",description="车辆维修记录")
@Data
@TableName("tbl_check")
public class Check {
    @ApiModelProperty(value="主键：编号", name="id", required=true, example = "1")
    @TableId(value = "ch_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="外键：车辆编号", name="car_id", required=true, example = "1")
    @TableField(value = "c_id")
    private Integer car_id;

    @ApiModelProperty(value="车辆问题描述", name="question", required=true, example = "爆胎")
    @TableField(value = "ch_question")
    private String question;

    @ApiModelProperty(value="维修开始时间", name="time", required=true, example = "2022-06-23 16:25:25")
    @TableField(value = "ch_time")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date time;

    @ApiModelProperty(value="维修结果", name="result", required=true, example = "修好了")
    @TableField(value = "ch_result")
    private String result;

    @ApiModelProperty(value="车牌", name="number", required=true, example = "渝A001")
    @TableField(exist = false)
    private String number;

    @ApiModelProperty(value="车辆类型", name="type", required=true, example = "货车")
    @TableField(exist = false)
    private String type;

    @ApiModelProperty(value="有效位", name="valid", required=true, example = "1")
    @TableField(value = "ch_valid")
    private Boolean valid;
}
