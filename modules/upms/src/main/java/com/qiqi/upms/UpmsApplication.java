package com.qiqi.upms;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author qiqi
 * @date 2018/9/21 15:09
 */
@EnableTransactionManagement
@SpringCloudApplication
@EnableApolloConfig
@ComponentScan(basePackages = {"com.qiqi.upms", "com.qiqi.common"})
public class UpmsApplication {
    public static void main(String[] args) {
        SpringApplication.run(UpmsApplication.class, args);
    }
}
