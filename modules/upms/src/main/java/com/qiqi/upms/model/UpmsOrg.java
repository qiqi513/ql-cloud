package com.qiqi.upms.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author qiqi
 * @since 2018-10-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UpmsOrg implements Serializable {

    private static final long serialVersionUID = 1L;

        /**
     * 组织ID
     */
         @TableId(value = "org_id", type = IdType.AUTO)
    private Integer orgId;

        /**
     * 组织名称
     */
         private String orgName;

        /**
     * 描述
     */
         private String description;

        /**
     * 排序
     */
         private Integer orderId;

        /**
     * 父级ID

     */
         private Integer parentId;


}
