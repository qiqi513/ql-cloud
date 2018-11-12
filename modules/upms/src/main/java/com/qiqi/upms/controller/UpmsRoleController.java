package com.qiqi.upms.controller;


import com.qiqi.common.controller.BaseController;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.upms.model.UpmsRole;
import com.qiqi.upms.service.UpmsRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
@Api(value = "角色API")
@RestController
@RequestMapping("/upmsRole")
public class UpmsRoleController extends BaseController<UpmsRoleService,UpmsRole> {


    @ApiOperation(value = "查询角色信息", notes = "条件查询角色,分页,")
    @GetMapping(value = "/listPage")
    public RespMsg listPage(@RequestParam Map<String, Object> params){
        return this.baseBiz.listPage(params);
    }
}

