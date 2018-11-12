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
 * @since 2018-10-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class UpmsMenu implements Serializable {

    private static final long serialVersionUID = 1L;

        /**
     * 栏目ID

     */
        @TableId(value = "menu_id", type = IdType.AUTO)
         private Integer menuId;

        /**
     * 栏目名称
     */
         private String menuName;

        /**
     * 栏目类型
     */
         private String menuType;

        /**
     * 栏目标识
     */
         private String menuKey;

        /**
     * 跳转路径
     */
         private String menuPath;

        /**
     * 前端组件
     */
         private String component;

        /**
     * 栏目图标
     */
         private String menuIcon;

        /**
     * 栏目序号
     */
         private Integer orderId;

        /**
     * 上级栏目
     */
         private Integer parentId;

    /**
     * 描述
     */
         private String description;


}
