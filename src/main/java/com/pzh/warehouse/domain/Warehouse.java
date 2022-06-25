package com.pzh.warehouse.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("tbl_warehouse")
public class Warehouse implements Serializable {
    @ApiModelProperty(value="主键：仓库编号", name="id", required=true, example = "1")
    @TableId(value = "w_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="外键：公司编号", name="f_id", example = "1")
    @TableField(value = "f_id")
    private Integer firm_id;

    @ApiModelProperty(value="仓库最大容量", name="hold", example = "10000")
    @TableField(value = "w_hold")
    private Integer hold;

    @ApiModelProperty(value="仓库地址", name="address", example = "重庆")
    @TableField(value = "w_address")
    private String address;
}
