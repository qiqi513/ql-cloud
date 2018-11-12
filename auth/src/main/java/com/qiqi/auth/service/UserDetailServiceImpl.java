package com.qiqi.auth.service;

import com.qiqi.auth.feign.UserService;
import com.qiqi.auth.util.UserDetailsImpl;
import com.qiqi.common.model.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author qiqi
 * @date 2018/10/11 14:22
 */

@Service("userDetailService")
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserVO userVo = userService.findUserByUsername(username);
        return new UserDetailsImpl(userVo);
    }
}
