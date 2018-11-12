package com.qiqi.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.common.model.vo.UserVO;
import com.qiqi.upms.model.UpmsUser;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
public interface UpmsUserService extends IService<UpmsUser> {

    /**
     * 条件查询用户,分页
     * @param params  查询参数
     * @return
     */
    RespMsg listPage(Map<String, Object> params);

    /**
     * 通过用户名查询用户信息
     * @param username 用户名
     * @return UseVo 对象
     */
    UserVO findUserByUsername(String username);
}
