package com.qiqi.upms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qiqi.upms.model.UpmsOrg;

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
public interface UpmsOrgDao extends BaseMapper<UpmsOrg> {

    /**
     *  查询所有组织信息
     * @return
     */
    List<Map<String,Object>> getTree();

}
