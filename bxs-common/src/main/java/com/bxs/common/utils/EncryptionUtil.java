package com.bxs.common.utils;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * 
 * 加密工具类
 * @desc: bxs-common
 * @author: wyc
 * @createTime: 2018年1月30日 下午10:42:12
 * @history:
 * @version: v1.0
 */
public class EncryptionUtil {

	/**
	 * 
	 * 获取MD5加密字符串
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午10:41:55
	 * @history:
	 * @param src
	 * @return String
	 */
	public static String getMd5String(String src) {
		return DigestUtils.md5Hex(src);  
	}
	
	public static void main(String[]args){
		String src="123456";
		System.out.println(getMd5String(src));
	}
	
}
