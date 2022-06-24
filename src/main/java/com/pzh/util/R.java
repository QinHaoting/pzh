package com.pzh.util;

import lombok.Data;

/**
 * 前后端信息通讯协议数据
 */
@Data
public class R {
    /**
     * 操作标志位
     */
    private boolean flag;

    /**
     * 错误信息
     */
//    private String message;

    /**
     * 本次操作返回的数据
     */
    private Object data;

//    public R(boolean flag, String message, Object data) {
//        this.flag = flag;
//        this.message = message;
//        this.data = data;
//    }

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
