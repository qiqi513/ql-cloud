package com.qiqi.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.upms.model.UpmsRole;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
public interface UpmsRoleService extends IService<UpmsRole> {

    /**
     * 条件查询角色,分页
     * @param params  查询参数
     * @return
     */
    RespMsg listPage(Map<String, Object> params);
}
