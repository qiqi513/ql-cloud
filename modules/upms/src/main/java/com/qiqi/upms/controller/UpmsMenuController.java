package com.qiqi.upms.controller;


import com.qiqi.common.controller.BaseController;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.upms.model.UpmsMenu;
import com.qiqi.upms.service.UpmsMenuService;
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
 * @since 2018-10-19
 */
@Api(tags = "栏目API")
@RestController
@RequestMapping("/upmsMenu")
public class UpmsMenuController extends BaseController<UpmsMenuService,UpmsMenu> {

    @ApiOperation(value = "查询树状菜单列表", notes = "")
    @GetMapping(value = "/listTree")
    public RespMsg listTree() {
        return new RespMsg(this.baseBiz.listTree());
    }
}

