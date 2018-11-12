package com.qiqi.upms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qiqi.common.model.bean.MyPage;
import com.qiqi.upms.model.UpmsUserRole;
import org.apache.ibatis.annotations.Param;

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
public interface UpmsUserRoleDao extends BaseMapper<UpmsUserRole> {

    /**
     *  条件查询用户,分页
     * @param page  分页参数
     * @param params  查询参数
     * @return
     */
    List<Map<String,Object>> listPage(MyPage page,@Param("params") Map<String, Object> params);
}
