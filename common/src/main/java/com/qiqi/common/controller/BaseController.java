package com.qiqi.common.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qiqi.common.model.bean.Query;
import com.qiqi.common.model.msg.RespMsg;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author qiqi
 * @date 2018/9/21 15:55
 */
public class BaseController<M extends IService,T> {


    @Autowired
    protected M baseBiz;


    @ApiOperation(value = "新增对象", notes = "")
    @PostMapping
    @ResponseBody
    public RespMsg save(@ApiParam(name="对象",value="传入json格式",required=true)   @RequestBody T t){
        return new RespMsg(baseBiz.save(t));
    }

    @ApiOperation(value = "保存或修改", notes = "通过传入的对象是否含有主键ID判断是保存或修改")
    @PostMapping(value = "/saveOrUpdate")
    @ResponseBody
    public RespMsg saveOrUpdate(@ApiParam(name="对象",value="传入json格式",required=true)  @RequestBody  T t){
        return new RespMsg(baseBiz.saveOrUpdate(t));
    }

    @ApiOperation(value = "修改", notes = "通过ID修改")
    @PutMapping
    @ResponseBody
    public RespMsg update(@ApiParam(name="对象",value="传入json格式",required=true) @RequestBody T t){
        return new RespMsg(baseBiz.updateById(t));
    }

    @ApiOperation(value = "删除", notes = "通过ID修改")
    @ApiImplicitParam(name = "id", value = "主键ID", required = true, dataType = "Integer")
    @DeleteMapping("/{id}")
    @ResponseBody
    public RespMsg remove(@PathVariable Integer id){
        return new RespMsg(baseBiz.removeById(id));
    }

    @ApiOperation(value = "查询所有", notes = "")
    @GetMapping(value = "/all")
    @ResponseBody
    public RespMsg all(){
        return new RespMsg(baseBiz.list(new QueryWrapper<T>()));
    }


    @GetMapping(value = "/page")
    @ResponseBody
    public RespMsg page(@RequestParam Map<String, Object> params){
        QueryWrapper<T> queryWrapper = new QueryWrapper<>();
        Query query = new Query(params);
        Page<T> page = new Page<>(query.getPage(),query.getLimit());
        for (Map.Entry<String, Object> entry : query.entrySet()) {
            queryWrapper.like(entry.getKey(), entry.getValue().toString());
        }
        baseBiz.page(page,queryWrapper);
        return new RespMsg(page.getRecords(),page.getTotal());
    }

}
