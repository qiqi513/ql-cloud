package com.qiqi.common.model.msg;

import lombok.Data;

/**
 * 响应消息主体
 * @author XieKong
 * @date 2018/5/23 14:14
 */
@Data
public class RespMsg {

    /**
     * 响应状态
     */
    private boolean success;
    /**
     * 响应消息
     */
    private String message;
    /**
     * 响应结果总数
     */
    private Long total;
    /**
     * 响应结果
     */
    private Object data;

    public RespMsg() {
    }

    public RespMsg(boolean success) {
        this.success = success;
    }

    public RespMsg(Object data) {
        this.success = true;
        this.data = data;
    }

    public RespMsg(Long total, Object data) {
        this.success = true;
        this.total = total;
        this.data = data;
    }

    public RespMsg(Object data, Long total) {
        this.success = true;
        this.total = total;
        this.data = data;
    }

    public RespMsg(boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public RespMsg(boolean success, String message, Object data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    public RespMsg(boolean success, String message, Long total, Object data) {
        this.success = success;
        this.message = message;
        this.total = total;
        this.data = data;
    }
}
