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

@ApiModel(value="Feedback反馈实体",description="反馈记录")
@Data
@TableName("tbl_feedback")
public class Feedback {
    @ApiModelProperty(value="主键：反馈记录编号", name="id", required=true, example = "1")
    @TableId(value = "fb_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="反馈内容", name="content", required=true, example = "这是一条反馈记录")
    @TableField(value = "fb_content")
    private String content;


    @ApiModelProperty(value="标志位:是否处理", name="status", required=true, example = "0")
    @TableField(value = "fb_status")
    private Integer status;
}
