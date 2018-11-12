package com.qiqi.common.config.web;

import com.qiqi.common.constant.SecurityConstants;
import com.qiqi.common.model.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.servlet.http.HttpServletRequest;

/**
 * @author qiqi
 * @date 2018/10/12 17:53
 */
@Slf4j
@Configuration
public class TokenArgumentResolver implements HandlerMethodArgumentResolver {
    /**
     * 1. 入参筛选
     * @param methodParameter 参数集合
     * @return 格式化后的参数
     */
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.getParameterType().equals(UserVO.class);
    }

    /**
     * @param methodParameter       入参集合
     * @param modelAndViewContainer model 和 view
     * @param nativeWebRequest      web相关
     * @param webDataBinderFactory  入参解析
     * @return 包装对象
     * @throws Exception exception
     */
    @Override
    public Object resolveArgument(MethodParameter methodParameter,
                                  ModelAndViewContainer modelAndViewContainer,
                                  NativeWebRequest nativeWebRequest,
                                  WebDataBinderFactory webDataBinderFactory) {
        HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
        String username = request.getHeader(SecurityConstants.USER_HEADER);
        if (StringUtils.isNotEmpty(username)) {
            log.warn("resolveArgument error username or role is empty");
            return null;
        } else {
            log.info("resolveArgument username :{}", username);
        }
        UserVO userVO = new UserVO();
        userVO.setUsername(username);
        return userVO;
    }
}
