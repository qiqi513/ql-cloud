package com.qiqi.common.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author qiqi
 * @date 2018/10/11 14:17
 */
@Data
public class UserVO implements Serializable {

    /**
     * 主键ID
     */
    private Integer userId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 密码
     */
    private String nickname;
    /**
     * 0-正常，1-暂用
     */
    private String state;
    /**
     * 描述
     */
    private String description;
    /**
     * 组织ID
     */
    private Integer orgId;
    /**
     * 组织名称
     */
    private String orgName;

}
