package com.qiqi.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qiqi.upms.model.UpmsMenu;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qiqi
 * @since 2018-10-19
 */
public interface UpmsMenuService extends IService<UpmsMenu> {

    /**
     * 查询树状菜单列表
     * @return
     */
    List<Map<String,Object>> listTree();

}
