package com.qiqi.upms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qiqi.common.model.bean.Query;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.common.model.vo.UserVO;
import com.qiqi.common.util.FormatUtils;
import com.qiqi.upms.dao.UpmsUserDao;
import com.qiqi.upms.model.UpmsUser;
import com.qiqi.upms.service.UpmsUserService;
import org.springframework.stereotype.Service;

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
public class UpmsUserServiceImpl extends ServiceImpl<UpmsUserDao, UpmsUser> implements UpmsUserService {

    @Override
    public RespMsg listPage(Map<String, Object> params) {
        Query query = new Query(params);
        Page page = new Page(query.getPage(),query.getLimit());
        List<Map<String,Object>> list = this.baseMapper.listPage(page,query);
        return new RespMsg(FormatUtils.formatList(list),page.getTotal());
    }

    @Override
    public UserVO findUserByUsername(String username) {
        return this.baseMapper.selectUserVoByUsername(username);
    }
}
