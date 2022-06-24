package com.pzh.info.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@ApiModel(value="user实体",description="用户")
@Data
@TableName("tbl_user")
public class User implements Serializable {
    @ApiModelProperty(value="主键", name="id", required=true, example = "1")
    @TableId(value = "u_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="用户账号", name="account", required=true, example = "123")
    @TableField(value = "u_account")
    private String account;

    @ApiModelProperty(value="角色编号", name="role_id", required=true, example = "2")
    @TableField(value = "r_id")
    private Integer role_id;

    @ApiModelProperty(value="密码", name="password", required=true, example = "123456")
    @TableField(value = "u_password")
    private String password;

    @TableField(value = "u_phone")
    private String phone;

    @TableField(value = "u_email")
    private String email;

    @ApiModelProperty(value="用户名", name="u_name", required=true, example = "宝儿姐")
    @TableField(value = "u_name")
    private String name;
}
