package com.qiqi.common.config.web;

import com.qiqi.common.constant.SecurityConstants;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author qiqi
 * @date 2018/10/12 16:28
 */
@Slf4j
@Component
public class LogInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        String token = request.getHeader(SecurityConstants.TOKEN_HEADER);
        IgnoreClientToken annotation = handlerMethod.getBeanType().getAnnotation(IgnoreClientToken.class);
        if (annotation == null) {
            annotation = handlerMethod.getMethodAnnotation(IgnoreClientToken.class);
        }
        if(annotation != null) {
            return super.preHandle(request, response, handler);
        }

        if(StringUtils.isNotEmpty(token)){
            return super.preHandle(request, response, handler);
        }
        log.info("授权失败，禁止访问 {}", request.getRequestURI());
        throw new Exception("授权失败，禁止访问!");
    }
}
