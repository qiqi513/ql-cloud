package com.qiqi.common.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author qiqi
 * @date 2018/10/9 9:35
 */
public class TreeUtils {

    private TreeUtils() {
    }

    /**
     *  递归实现树状结构
     * @param treeNodes  传入的树节点列表
     * @param root   根节点ID
     * @return
     */
    public static List<Map<String,Object>> bulid(List<Map<String,Object>> treeNodes, Object root){
        List<Map<String,Object>> trees = new ArrayList<>();
        for(Map<String,Object> map: treeNodes){
            Map<String,Object> node = FormatUtils.formatMap(map);
            if(root.equals(node.get("parentId"))){

                List<Map<String,Object>> children = bulid(treeNodes,node.get("id"));
                if(children.size() > 0){
                    node.put("children",children);
                }
                trees.add(node);
            }

        }
        return trees;
    }

}
