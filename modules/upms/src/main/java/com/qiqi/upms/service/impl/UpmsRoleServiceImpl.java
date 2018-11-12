package com.qiqi.upms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiqi.common.model.bean.Query;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.common.util.FormatUtils;
import com.qiqi.upms.dao.UpmsRoleDao;
import com.qiqi.upms.model.UpmsRole;
import com.qiqi.upms.service.UpmsRoleService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
@Service
public class UpmsRoleServiceImpl extends ServiceImpl<UpmsRoleDao, UpmsRole> implements UpmsRoleService {

    @Override
    public RespMsg listPage(Map<String, Object> params) {
        Query query = new Query(params);
        Page page = new Page(query.getPage(),query.getLimit());
        List<Map<String,Object>> list = this.baseMapper.listPage(page,query);

        List<Map<String,Object>> result = new ArrayList<>();
        for (Map<String,Object> map : list){
            Map<String,Object> role = FormatUtils.formatMap(map);
            if(role.get("orgId") == null){
                role.put("orgName","通用角色");
            }
            result.add(role);
        }
        return new RespMsg(result,page.getTotal());
    }
}
