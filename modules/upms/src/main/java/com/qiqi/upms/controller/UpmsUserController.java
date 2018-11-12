package com.qiqi.upms.controller;


import com.qiqi.common.controller.BaseController;
import com.qiqi.common.model.msg.RespMsg;
import com.qiqi.common.model.vo.UserVO;
import com.qiqi.common.config.web.IgnoreClientToken;
import com.qiqi.upms.model.UpmsUser;
import com.qiqi.upms.service.UpmsUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
@Api(tags = "用户API")
@RestController
@RequestMapping("/upmsUser")
public class UpmsUserController extends BaseController<UpmsUserService,UpmsUser> {

    @ApiOperation(value = "查询用户信息", notes = "条件查询用户,分页,")
    @GetMapping(value = "/listPage")
    public RespMsg listPage(@RequestParam Map<String, Object> params){
        return this.baseBiz.listPage(params);
    }



    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @return UseVo 对象
     */
    @IgnoreClientToken
    @GetMapping("/findUserByUsername/{username}")
    public UserVO findUserByUsername(@PathVariable String username) {
        return this.baseBiz.findUserByUsername(username);
    }
}

