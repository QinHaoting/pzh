package com.pzh.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@ApiModel(value = "Warehouse仓库实体")
@Data
@TableName("tbl_warehouse")
public class Warehouse implements Serializable {
    @ApiModelProperty(value="主键：仓库编号", name="id", required=true, example = "1")
    @TableId(value = "w_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="外键：公司编号", name="firm_id", required=true, example = "1")
    @TableField(value = "f_id")
    private Integer firm_id;

    @ApiModelProperty(value="仓库最大容量", name="hold", example = "10000")
    @TableField(value = "w_hold")
    private Integer hold;

    @ApiModelProperty(value="仓库地址", name="address", example = "重庆")
    @TableField(value = "w_address")
    private String address;

    @ApiModelProperty(value="有效位", name="valid", required=true, example = "1")
    @TableField(value = "w_valid")
    private Boolean valid;
}
