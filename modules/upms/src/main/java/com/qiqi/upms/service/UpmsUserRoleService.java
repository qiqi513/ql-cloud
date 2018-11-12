package com.qiqi.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.upms.model.UpmsUserRole;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qiqi
 * @since 2018-10-19
 */
public interface UpmsUserRoleService extends IService<UpmsUserRole> {

    /**
     * 条件查询用户,分页
     * @param params  查询参数
     * @return
     */
    RespMsg listPage(Map<String, Object> params);
}
