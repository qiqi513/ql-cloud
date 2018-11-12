package com.qiqi.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qiqi.upms.model.UpmsOrg;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
public interface UpmsOrgService extends IService<UpmsOrg> {

    /**
     * 查询组织信息 树状结构
     * @return
     */
    List<Map<String,Object>> getTree();

}
