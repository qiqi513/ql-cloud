package com.qiqi.auth.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author qiqi
 * @date 2018/10/11 11:51
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "auth")
public class AuthServerProperties {


    private String clientId;
    private String clientSecret;
    private String scope;
    private String tokenEnhancer;
    private String signKey;
    private Long accessTokenValiditySeconds;
    private Long refreshTokenValiditySeconds;
}
