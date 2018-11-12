package com.qiqi.auth.util;

import com.qiqi.common.model.vo.UserVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * @author qiqi
 * @date 2018/10/11 14:24
 */
public class UserDetailsImpl implements UserDetails {

    private String username;
    private String password;
    private String status;


    public UserDetailsImpl(UserVO userVo) {
        this.username = userVo.getUsername();
        this.password = userVo.getPassword();
        this.status = userVo.getState();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return "0".equals(status) ? true :false;
    }



}
