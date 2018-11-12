package com.qiqi.upms.controller;


import com.qiqi.common.controller.BaseController;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.upms.model.UpmsOrg;
import com.qiqi.upms.service.UpmsOrgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
@RestController
@RequestMapping("/upmsOrg")
@Api("组织管理API")
public class UpmsOrgController extends BaseController<UpmsOrgService,UpmsOrg> {

    @ApiOperation(value = "查询树状组织列表", notes = "")
//    @ApiImplicitParams({
//            @ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "Long"),
//            @ApiImplicitParam(name = "user", value = "用户详细实体user", required = true, dataType = "User")
//    })
    @GetMapping(value = "/getTree")
    public RespMsg getTree(){

        return new RespMsg(this.baseBiz.getTree());
    }

}

