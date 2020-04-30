package com.gx.util.vcode;

import java.util.Random;

public class GetVcode {
    /**
     * 生成随机6位数字
     * @return
     */
    public static String getVcode(){
        String str="0123456789";
        StringBuilder sb=new StringBuilder(6);
        for(int i=0;i<6;i++)
        {
            //随机选一个数字
            char ch=str.charAt(new Random().nextInt(str.length()));
            sb.append(ch);
        }
        return sb.toString();
    }
}
