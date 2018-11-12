package com.qiqi.upms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qiqi.common.model.bean.Query;
import com.qiqi.common.model.vo.UserVO;
import com.qiqi.upms.model.UpmsUser;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
public interface UpmsUserDao extends BaseMapper<UpmsUser> {

    List<Map<String,Object>> listPage(Page page, Query query);

    /**
     * 通过用户名查询用户信息
     * @param username  用户名
     * @return UserVO
     */
    UserVO selectUserVoByUsername(String username);
}
