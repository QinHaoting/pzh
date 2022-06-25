package com.pzh.transport.domain;

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

@ApiModel(value="order实体",description="物流订单")
@Data
@TableName("tbl_order")
public class Order implements Serializable {
    @ApiModelProperty(value="主键：订单编号", name="id", required=true, example = "1")
    @TableId(value = "o_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="外键：车辆编号", name="car_id", required=true, example = "1")
    @TableField(value = "c_id")
    private Integer car_id;

    @ApiModelProperty(value="外键：用户编号", name="user_id", required=true, example = "2")
    @TableField(value = "u_id")
    private Integer user_id;

    @ApiModelProperty(value="出发地", name="start_address", required=true, example = "重庆")
    @TableField(value = "o_start")
    private String start_address;

    @ApiModelProperty(value="目的地", name="end_address", required=true, example = "四川")
    @TableField(value = "o_end")
    private String end_address;

    @ApiModelProperty(value="订单状态", name="status", required=true, example = "0")
    @TableField(value = "o_status")
    private Integer status;

    @ApiModelProperty(value="外键：货物编号", name="goods_id", required=true, example = "2")
    @TableField(value = "g_id")
    private Integer goods_id;

    @ApiModelProperty(value="出发时间", name="start_time", required=true, example = "2022-06-23 16:25:25")
    @TableField(value = "o_starttime")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date start_time;

    @ApiModelProperty(value="备注", name="remark", required=true, example = "务必休息一天的订单")
    @TableField(value = "o_other")
    private String remark;
}
