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

@ApiModel(value="Announce公告实体",description="公告记录")
@Data
@TableName("tbl_announce")
public class Announce {
    @ApiModelProperty(value="主键：公告编号", name="id", required=true, example = "1")
    @TableId(value = "a_id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value="公告标题", name="title", required=true, example = "标题1")
    @TableField(value = "a_title")
    private String title;

    @ApiModelProperty(value="公告内容", name="content", required=true, example = "这是一条公告")
    @TableField(value = "a_content")
    private String content;

    @ApiModelProperty(value="发布人", name="publisher", required=true, example = "宝儿姐")
    @TableField(value = "a_publisher")
    private String publisher;

    @ApiModelProperty(value="发布时间", name="time", required=true, example = "2022-06-23 16:25:25")
    @TableField(value = "a_time")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date time;
}
