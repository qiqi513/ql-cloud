package com.qiqi.common.model.bean;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.apache.commons.lang.StringUtils;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author qiqi
 * @date 2018/10/23 17:11
 */
public class MyPage<T> extends Page<T>  {

    private static final String PAGE = "page";
    private static final String LIMIT = "limit";


    public MyPage(Map<String, Object> params) {
        super(Long.parseLong(params.getOrDefault(PAGE, 1).toString())
                , Long.parseLong(params.getOrDefault(LIMIT, 10).toString()));
        params.remove(PAGE);
        params.remove(LIMIT);
    }


}
