package com.qiqi.auth.config.oauth2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.oauth2.provider.endpoint.TokenEndpoint;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 允许通过get方式获取token
 * @author qiqi
 * @date 2018/10/11 14:38
 */
@Configuration
public class AllowedMethodConfig {

    @Autowired
    private TokenEndpoint tokenEndpoint;

    @PostConstruct
    public void reconfigure() {
        Set<HttpMethod> allowedMethods =
                new HashSet<>(Arrays.asList(HttpMethod.GET, HttpMethod.POST));
        tokenEndpoint.setAllowedRequestMethods(allowedMethods);
    }
}
