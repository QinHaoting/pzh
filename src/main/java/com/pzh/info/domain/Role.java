package com.pzh.info.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel(value="role实体",description="系统角色")
@Data
@TableName("tbl_role")
public class Role {
    @ApiModelProperty(value="角色编号", name="id", required=true, example = "r001")
    @TableId(value = "r_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="角色名称", name="name", required=true, example = "普通用户")
    @TableField(value = "r_name")
    private String name;
}
