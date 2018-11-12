package com.qiqi.upms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qiqi.upms.model.UpmsMenu;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qiqi
 * @since 2018-10-19
 */
public interface UpmsMenuDao extends BaseMapper<UpmsMenu> {

    /**
     *
     * @return
     */
    List<Map<String,Object>> getTree();

}
