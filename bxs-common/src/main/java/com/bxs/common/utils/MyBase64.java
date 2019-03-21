package com.bxs.common.utils;

import java.io.IOException;

import org.apache.commons.codec.binary.Base64;

public class MyBase64 {

	/** 
     * 编码 
     * @param bstr 
     * @return String 
     */  
    public static String encode(byte[] bstr){  
    return new sun.misc.BASE64Encoder().encode(bstr);  
    }  
   
    /** 
     * 解码 
     * @param str 
     * @return string 
     */  
    public static byte[] decode(String str){  
    byte[] bt = null;  
    try {  
        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();  
        bt = decoder.decodeBuffer( str );  
    } catch (IOException e) {  
        e.printStackTrace();  
    }  
   
        return bt;  
    }  
   
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
        String aa = "更多更多";  
        aa = encode(aa.getBytes());  
        System.out.println("----aa:"+aa);  
        String str = aa;  
        String str2 = new String(decode(str));  
        System.out.println("-----str2:"+str2);  
    }  
}
