package com.qiqi.common.aop;

import com.qiqi.common.model.msg.RespMsg;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * com.huaxin.platform.base
 * Controller的统一异常处理
 * @author qiqi
 * @date 2018/5/14
 */
@RestControllerAdvice
@Slf4j
public class CommonExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public RespMsg defaultErrorHandler(HttpServletRequest req, Exception e) {
        log.error("调用:{}异常:{}", req.getRequestURL(), e.getMessage());
        e.printStackTrace();
        return new RespMsg(false,e.getMessage());
    }
}
