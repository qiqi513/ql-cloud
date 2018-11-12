package com.qiqi.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiqi.common.util.TreeUtils;
import com.qiqi.upms.dao.UpmsOrgDao;
import com.qiqi.upms.model.UpmsOrg;
import com.qiqi.upms.service.UpmsOrgService;
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
 * @since 2018-10-08
 */
@Transactional(rollbackFor = {Exception.class})
@Service
public class UpmsOrgServiceImpl extends ServiceImpl<UpmsOrgDao, UpmsOrg> implements UpmsOrgService {

    @Override
    public List<Map<String, Object>> getTree() {
        List<Map<String, Object>> list = this.baseMapper.getTree();
        return TreeUtils.bulid(list,-1);
    }
}
