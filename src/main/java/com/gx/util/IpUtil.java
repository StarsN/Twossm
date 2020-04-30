package com.gx.util;

import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;

public class IpUtil {
	public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
       if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
              //多次反向代理后会有多个ip值，第一个ip才是真实ip
             int index = ip.indexOf(",");
            if(index != -1){
                 return ip.substring(0,index);
             }else{
                 return ip;
             }
         }
         ip = request.getHeader("X-Real-IP");
         if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
             return ip;
         }
         return request.getRemoteAddr();
         
      }
	/**
	 * 判断目标ip是否属于某个ip子网
	 * @param subIp		带有子网掩码的ip
	 * @param ip		目标ip
	 * @return			成功true，失败false
	 */
	public static boolean isSubnet(String subIp, String ip) {
		String[] subs = subIp.split("/");
		int[] subnetMask = getSubnetMask(Integer.parseInt(subs[1]));
		int[] ipArray = getIpv4Array(subs[0]);
		String subnet = getSubnet(subnetMask,ipArray);
		int[] ipArray2 = getIpv4Array(ip);
		String subnet2 = getSubnet(subnetMask, ipArray2);
		if (subnet.equals(subnet2))
			return true;
		return false;
	}
 
	/**
	 * 获取子网掩码数组
	 * @param num	子网掩码长（暨带子网掩码的ip/后面的数字）
	 * @return		长度为4的int数组
	 */
	private static int[] getSubnetMask(int num) {
		int[] masks = new int[4];
		int index = num / 8;
		int remainder = num % 8;
		String remainderToBinary = "";
		for (int i = 0; i < index; i++)
			masks[i] = 255;
		for (int i = 0; i < 8; i++) {
			int j = 0;
			if (i < remainder)
				j = 1;
			remainderToBinary = remainderToBinary + j;
		}
		int sublast = Integer.valueOf(remainderToBinary, 2);
		masks[index] = sublast;
		if (index < masks.length - 1) {
			for (int i = index + 1; i < masks.length; i++)
				masks[i] = 0;
		}
		return masks;
	}
	
	/**
	 * 分解ip地址
	 * @param ip	ip地址
	 * @return		长度为4的int数组
	 */
	private static int[] getIpv4Array(String ip) {
		int[] ipArray = new int[4];
		String[] ips = ip.split("\\.");
		for (int i = 0; i < ips.length; i++) 
			ipArray[i] = Integer.parseInt(ips[i]);
		return ipArray;
	}
	
	/**
	 * 通过子网掩码数组和，ip地址数组获取主机地址
	 * @param masks		子网掩码数组
	 * @param ipArray	ip数组
	 * @return		主机地址
	 */
	private static String getSubnet(int[] masks, int[] ipArray) {
		String subnet = "";
		if (masks.length != ipArray.length) {
			try {
				throw new Exception("子网掩码长度和ip地址长度不一样");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		for (int i = 0; i < ipArray.length; i++) {
			int and = masks[i] & ipArray[i];
			subnet = subnet + and;
			if (i < ipArray.length -1) 
				subnet = subnet + ".";
		}
		return subnet;
	}
}