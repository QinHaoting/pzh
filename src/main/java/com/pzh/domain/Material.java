package com.pzh.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@ApiModel(value="Material物资实体",description="物资记录")
@Data
@TableName("tbl_material")
public class Material {
    @ApiModelProperty(value="主键：物资编号", name="id", required=true, example = "1")
    @TableId(value = "m_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="外键：仓库编号", name="warehouse_id", example = "1")
    @TableField(value = "w_id")
    private Integer warehouse_id;

    @ApiModelProperty(value="物资名称", name="name", required=true, example = "物资1")
    @TableField(value = "m_name")
    private String name;

    @ApiModelProperty(value="物资数量", name="num", required=true, example = "20")
    @TableField(value = "m_num")
    private Integer num;

    @ApiModelProperty(value="备注", name="other", example = "/个")
    @TableField(value = "m_other")
    private String other;

    @ApiModelProperty(value="有效位", name="valid", required=true, example = "1")
    @TableField(value = "m_valid")
    private Boolean valid;
}
