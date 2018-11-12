package com.qiqi.auth.feign;

import com.qiqi.auth.feign.fallback.UserServiceFallbackImpl;
import com.qiqi.common.model.vo.UserVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author qiqi
 * @date 2018/10/11 14:14
 */
@FeignClient(name = "cloud-upms", fallback = UserServiceFallbackImpl.class)
public interface UserService {

    /**
     * 通过用户名查询用户、角色信息
     *
     * @param username 用户名
     * @return UserVo
     */
    @GetMapping("/upmsUser/findUserByUsername/{username}")
    UserVO findUserByUsername(@PathVariable("username") String username);
}
