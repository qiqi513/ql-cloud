package com.qiqi.zuul.filter;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.qiqi.common.constant.SecurityConstants;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.stereotype.Component;

/**
 * @author qiqi
 * @date 2018/10/12 10:23
 */
@Component
public class AccessFilter extends ZuulFilter {


    @Override
    public String filterType() {
        return FilterConstants.PRE_TYPE;
    }

    @Override
    public int filterOrder() {
        return 0;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() {
        RequestContext ctx = RequestContext.getCurrentContext();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
//            ctx.addZuulRequestHeader(SecurityConstants.USER_HEADER, authentication.getName());

//            if(authentication instanceof OAuth2Authentication){
//                OAuth2AuthenticationDetails details = (OAuth2AuthenticationDetails) authentication.getDetails() ;
//               				ctx.addZuulRequestHeader("Authorization", "bearer "+details.getTokenValue());
// }
        }
        return null;
    }
}
