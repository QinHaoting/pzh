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

@ApiModel(value="Goods货物实体",description="货物记录")
@Data
@TableName("tbl_goods")
public class Goods {
    @ApiModelProperty(value="主键：货物编号", name="id", required=true, example = "1")
    @TableId(value = "g_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="外键：仓库编号", name="warehouse_id", example = "1")
    @TableField(value = "w_id")
    private Integer warehouse_id;

    @ApiModelProperty(value="货物种类", name="type", required=true, example = "农产品")
    @TableField(value = "g_type")
    private String type;

    @ApiModelProperty(value="货物数量", name="num", required=true, example = "80")
    @TableField(value = "g_num")
    private Integer num;

    @ApiModelProperty(value="货物描述", name="describe", example = "西瓜")
    @TableField(value = "g_describe")
    private String describe;

    @ApiModelProperty(value="货物状态", name="status", required=true, example = "1")
    @TableField(value = "g_status")
    private Integer status;
}
