package com.pzh.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@ApiModel(value="User用户实体")
@Data
@TableName("tbl_user")
public class User implements Serializable {
    @ApiModelProperty(value="主键：用户编号", name="id", required=true, example = "1")
    @TableId(value = "u_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="用户账号", name="account", required=true, example = "abc123")
    @TableField(value = "u_account")
    private String account;

    @ApiModelProperty(value="外键：角色编号", name="role_id", required=true, example = "1")
    @TableField(value = "r_id")
    private Integer role_id;

    @ApiModelProperty(value="角色名称", name="role_name", example = "系统管理员")
    @TableField(exist = false)
    private String role_name;

    @ApiModelProperty(value="密码", name="password", required=true, example = "123456")
    @TableField(value = "u_password")
    private String password;

    @ApiModelProperty(value="电话", name="phone", example = "10086")
    @TableField(value = "u_phone")
    private String phone;

    @ApiModelProperty(value="邮箱", name="email", example = "123456@qq.com")
    @TableField(value = "u_email")
    private String email;

    @ApiModelProperty(value="用户名", name="name", required=true, example = "宝儿姐")
    @TableField(value = "u_name")
    private String name;

    @ApiModelProperty(value="有效位", name="valid", required=true, example = "1")
    @TableField(value = "u_valid")
    private Boolean valid;
}
