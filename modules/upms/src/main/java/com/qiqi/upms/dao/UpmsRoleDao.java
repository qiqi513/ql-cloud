package com.qiqi.upms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qiqi.common.model.bean.Query;
import com.qiqi.upms.model.UpmsRole;

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
public interface UpmsRoleDao extends BaseMapper<UpmsRole> {

    List<Map<String,Object>> listPage(Page page, Query query);
}
