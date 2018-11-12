package com.qiqi.common.config.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author qiqi
 * @date 2018/10/12 14:59
 */
@Configuration
@Primary
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private LogInterceptor logInterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(logInterceptor).addPathPatterns("/**").
                excludePathPatterns("/**.html","/swagger-resources/**","/webjars/**","/api/*/v2/api-docs");
    }


//    @Override
//    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
//        argumentResolvers.add(new TokenArgumentResolver());
//    }

}
