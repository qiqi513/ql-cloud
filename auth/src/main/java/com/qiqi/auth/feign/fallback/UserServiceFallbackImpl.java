package com.qiqi.auth.feign.fallback;

import com.qiqi.auth.feign.UserService;
import com.qiqi.common.model.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author qiqi
 * @date 2018/10/11 14:20
 */
@Slf4j
@Service
public class UserServiceFallbackImpl implements UserService {

    @Override
    public UserVO findUserByUsername(String username) {
        log.error("调用{}异常:{}", "findUserByUsername", username);
        return null;
    }
}
