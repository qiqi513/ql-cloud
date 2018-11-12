package com.qiqi.auth.controller;

import com.qiqi.common.model.msg.RespMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.provider.token.ConsumerTokenServices;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author qiqi
 * @date 2018/10/12 13:17
 */
@RestController
@RequestMapping("/authentication")
public class AuthenticationController {


    @Autowired
    @Qualifier("consumerTokenServices")
    private ConsumerTokenServices consumerTokenServices;

    /**
     * 用户信息校验
     * @param authentication 信息
     * @return 用户信息
     */
    @RequestMapping("/user")
    public Object user(Authentication authentication) {
        return authentication.getPrincipal();
    }


    /**
     *  注销登录
     * @param accessToken   token
     * @return true/false
     */
    @PostMapping("/removeToken")
    public RespMsg removeToken(String accessToken) {
        return new RespMsg(consumerTokenServices.revokeToken(accessToken));
    }
}
