package com.qiqi.upms.controller;


import com.qiqi.common.controller.BaseController;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.upms.model.UpmsUserRole;
import com.qiqi.upms.service.UpmsUserRoleService;
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
 * @since 2018-10-19
 */
@Api(tags = "用户角色API")
@RestController
@RequestMapping("/upmsUserRole")
public class UpmsUserRoleController extends BaseController<UpmsUserRoleService,UpmsUserRole> {



    @ApiOperation(value = "查询用户信息", notes = "条件查询用户,分页,")
    @GetMapping(value = "/listPage")
    public RespMsg listPage(@RequestParam Map<String, Object> params){
        return this.baseBiz.listPage(params);
    }

}

