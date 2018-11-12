package com.qiqi.auth.config.oauth2;

import com.qiqi.auth.properties.AuthServerProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * 授权服务器配置
 * @author qiqi
 * @date 2018/10/11 11:45
 */

@Configuration
@Order(Integer.MIN_VALUE)
@EnableAuthorizationServer
public class AuthorizationConfig extends AuthorizationServerConfigurerAdapter {

    @Autowired
    private AuthServerProperties authServerProperties;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserDetailsService userDetailsService;
    /**
     * 配置OAuth2的客户端相关信息
     * @param clients  用来定义一个基于内存的或者JDBC的客户端信息服务
     * @throws Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        String finalSecret = "{bcrypt}" + new BCryptPasswordEncoder().encode(authServerProperties.getClientSecret());
        // 配置两个客户端,一个用于PC认证 一个用于app认证

        clients.inMemory()
                .withClient(authServerProperties.getClientId())    // （必须）客户端id。
                .secret(finalSecret)             // 客户端的私密信息。 必须加密
                .authorizedGrantTypes("password", "refresh_token","authorization_code")  // 授权给客户端使用的权限类型  刷新token 密码模式 授权码模式
                .scopes(authServerProperties.getScope())  // 客户端的作用域
                .authorities("client");


    }


    /**
     * token 存储位置
     */
    @Bean
    public TokenStore tokenStore() {
        return new InMemoryTokenStore();
//        return new RedisTokenStore(redisConnectionFactory);
    }


    /**
     * 配置AuthorizationServerEndpointsConfigurer众多相关类，
     * 包括配置身份认证器，配置认证方式，TokenStore，TokenGranter，OAuth2RequestFactory
     * authenticationManager：密码授予被注入一个authenticationManager开启。
     * @param endpoints
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        //token增强配置
        TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(
                Arrays.asList(tokenEnhancer(), jwtAccessTokenConverter()));

        endpoints
                .tokenStore(tokenStore())
                .tokenEnhancer(tokenEnhancerChain)
                .authenticationManager(authenticationManager)
                .reuseRefreshTokens(false)
                .userDetailsService(userDetailsService);

    }


    /**
     *  给token 添加自定义信息
     * @return TokenEnhancer
     */
    @Bean
    public TokenEnhancer tokenEnhancer() {
        return (accessToken, authentication) -> {
            final Map<String, Object> additionalInfo = new HashMap<>(1);
            additionalInfo.put("success", true);
            ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
            return accessToken;
        };
    }



    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter() {
        JwtAccessToken jwtAccessToken = new JwtAccessToken();
        jwtAccessToken.setSigningKey(authServerProperties.getSignKey());
        return jwtAccessToken;
    }


    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
        security
                .allowFormAuthenticationForClients()        //    //允许表单认证
                .tokenKeyAccess("isAuthenticated()")
                .checkTokenAccess("permitAll()");
    }

}
