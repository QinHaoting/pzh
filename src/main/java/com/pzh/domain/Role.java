package com.pzh.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel(value="Role角色实体",description="每个角色代表不同的访问等级")
@Data
@TableName("tbl_role")
public class Role {
    @ApiModelProperty(value="主键：角色编号", name="id", required=true, example = "1")
    @TableId(value = "r_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="角色名称", name="name", required=true, example = "普通用户")
    @TableField(value = "r_name")
    private String name;

    @ApiModelProperty(value="角色描述", name="info", required=true, example = "系统管理员拥有最高权限")
    @TableField(value = "r_info")
    private String info;
}
