package com.qiqi.common.util;

import com.qiqi.common.constant.SymbolConst;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author qiqi
 * @date 2018/10/9 9:46
 */
public class FormatUtils {

    private FormatUtils() {
    }
    public static List<Map<String, Object>> formatList(List<Map<String, Object>> list) {
        List<Map<String, Object>>  array = new ArrayList<>();
        for(Map<String,Object> map:list){
            array.add(formatMap(map));
        }
        return  array;
    }


    public static Map<String, Object> formatMap(Map<String,Object> map){
        Map<String, Object> object = new HashMap<>(map.size());
        for(Map.Entry<String,Object> entry:map.entrySet()){
            StringBuffer key = new StringBuffer();
            if(entry.getKey().contains(SymbolConst.UNDERLINE)){
                String[] keys = entry.getKey().toLowerCase().split(SymbolConst.UNDERLINE);
                for(int i =0 ; i < keys.length ; i++){
                    char[] methodName = keys[i].toCharArray();
                    if(i!=0){
                        methodName[0] = toUpperCase(methodName[0]);
                    }
                    key.append(String.valueOf(methodName));
                }
            }else{
                key = new StringBuffer(entry.getKey());
            }

            object.put(key.toString(),entry.getValue());
        }
        return object;
    }


    /**
     * 字符转成大写
     */

    private static int minChar = 97;
    private static int maxChar = 122;
    private static  char toUpperCase(char chars) {
        if (minChar <= chars && chars <= maxChar) {
            chars ^= 32;
        }
        return chars;
    }

}
