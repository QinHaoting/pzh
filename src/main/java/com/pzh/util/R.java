package com.pzh.util;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@ApiModel(value = "R前后端信息通讯协议数据")
@Data
public class R {
    @ApiModelProperty(value="操作标志位", name="flag", required=true, example = "true")
    private boolean flag;

    @ApiModelProperty(value="本次操作返回的数据", name="data", required=true)
    private Object data;

    @ApiModelProperty(value="本次操作的信息", name="message", required=true)
    private String message;

    public R(boolean flag, Object data, String message) {
        this.flag = flag;
        this.data = data;
        this.message = message;
    }

    public R() {
    }

    public R(boolean flag, Object data) {
        this.flag = flag;
        this.data = data;
    }

    public R(boolean flag) {
        this.flag = flag;
    }
}
