package com.qiqi.common.model.bean;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 查询参数
 * @author qiqi
 * @date 2018/9/26 10:23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Query extends LinkedHashMap<String, Object> {

    private static final long serialVersionUID = 1L;
    /**
     * 当前页码
     */
    private int page = 1;
    /**
     * 每页条数
     */
    private int limit = 10;

    private static final String PAGE_TAG= "page";
    private static final String LIMIT_TAG = "limit";

    public Query(Map<String, Object> params){
        this.putAll(params);
        //分页参数
        if(params.get(PAGE_TAG)!=null) {
            this.page = Integer.parseInt(params.get(PAGE_TAG).toString());
        }
        if(params.get(LIMIT_TAG)!=null) {
            this.limit = Integer.parseInt(params.get(LIMIT_TAG).toString());
        }
        this.remove(PAGE_TAG);
        this.remove(LIMIT_TAG);
    }


}
