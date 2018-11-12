package com.qiqi.upms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiqi.common.model.bean.MyPage;
import com.qiqi.common.model.bean.Query;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.common.util.FormatUtils;
import com.qiqi.upms.dao.UpmsUserRoleDao;
import com.qiqi.upms.model.UpmsUserRole;
import com.qiqi.upms.service.UpmsUserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
public class UpmsUserRoleServiceImpl extends ServiceImpl<UpmsUserRoleDao, UpmsUserRole> implements UpmsUserRoleService {

    @Override
    public RespMsg listPage(Map<String, Object> params) {
        MyPage page = new MyPage(params);
        List<Map<String,Object>> list = this.baseMapper.listPage(page,params);
        List<Map<String,Object>> result = new ArrayList<>(list.size());
        for(Map<String,Object> map : list){
            Map<String,Object> obj = FormatUtils.formatMap(map);
            if(obj.get("role_org") == null){
                obj.put("roleOrgName","通用角色");
            }
            result.add(obj);
        }

        return new RespMsg(result,page.getTotal());
    }
}
