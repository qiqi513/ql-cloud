package com.qiqi.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiqi.common.util.TreeUtils;
import com.qiqi.upms.dao.UpmsMenuDao;
import com.qiqi.upms.model.UpmsMenu;
import com.qiqi.upms.service.UpmsMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author qiqi
 * @since 2018-10-19
 */
@Service
@Transactional(rollbackFor = {Exception.class})
public class UpmsMenuServiceImpl extends ServiceImpl<UpmsMenuDao, UpmsMenu> implements UpmsMenuService {

    @Override
    public List<Map<String, Object>> listTree() {
        List<Map<String, Object>> list = this.baseMapper.getTree();
        return TreeUtils.bulid(list,-1);
    }
}
