package com.qiqi.zuul.config;

import com.ctrip.framework.apollo.model.ConfigChangeEvent;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfigChangeListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.environment.EnvironmentChangeEvent;
import org.springframework.cloud.netflix.zuul.RoutesRefreshedEvent;
import org.springframework.cloud.netflix.zuul.filters.RouteLocator;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 根据配置中心实时刷新路由
 * @author qiqi
 * @date 2018/10/30 14:50
 */
@Component
public class ZuulPropertiesRefresher implements ApplicationContextAware {

    private ApplicationContext applicationContext;

    @Autowired
    private RouteLocator routeLocator;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }


    @ApolloConfigChangeListener
    public void onChange(ConfigChangeEvent changeEvent) {
        boolean zuulPropertiesChanged = false;
        for (String changedKey: changeEvent.changedKeys()) {
            if(changedKey.startsWith("zuul.")){
                zuulPropertiesChanged = true;
                break;
            }
        }

        if (zuulPropertiesChanged) {
            refreshZuulProperties(changeEvent);
        }
    }

    private void refreshZuulProperties(ConfigChangeEvent changeEvent) {
        this.applicationContext.publishEvent(new EnvironmentChangeEvent(changeEvent.changedKeys()));
        this.applicationContext.publishEvent(new RoutesRefreshedEvent(routeLocator));
    }
}
