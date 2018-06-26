package com.bxs.common.utils;



import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpUtil {
	
	
	public static void main(String[]args){
		String sxid="";
		String version="";
		String name="";
		String rollbackUrl = "http://172.16.12.46:8801/fwsx-schedule/data/rollbackErrorData.do";  
        Map<String, Object> params = new HashMap<>();  
        params.put("sxid", sxid);  
        params.put("version", version);  
        try {
        	String startLog="开始调度："+"----------"+sxid+"-"+name+"-"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        	System.out.println(startLog);
        	HttpUtil.writeText("F://handle.txt",startLog,true);
			String result=HttpUtil.sendPost(rollbackUrl, params);
			String endLog="调度结束："+"----------"+sxid+"-"+""+name+"-"+result+"-"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());;
			System.out.println(endLog);
			HttpUtil.writeText("F://handle.txt",endLog,true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 
	 * 写入txt文件
	 * @author: wyc
	 * @createTime: 2018年6月26日 下午8:43:22
	 * @history:
	 * @param filePath
	 * @param writeText
	 * @param isNewLine void
	 */
	public static void writeText(String filePath,String writeText,Boolean isNewLine){
		BufferedWriter fw = null;
		File file = new File(filePath);
		try {
			//指定编码格式，以免读取时中文字符异常
			//BufferedWriter->OutputStreamWriter->FileOutputStream->File
			fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, true), "UTF-8")); 
			if(isNewLine){
				fw.newLine();
			}
			fw.append(writeText);
			fw.flush();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	/**
	 * 
	 * 使用HttpClient发送Post请求
	 * @author: wyc
	 * @createTime: 2018年6月26日 下午8:43:36
	 * @history:
	 * @param url
	 * @param params
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException String
	 */
	public static String sendPost(String url, Map<String, Object> params) throws ClientProtocolException, IOException {  
		String CHARSET = "UTF-8"; 
		 RequestConfig config = RequestConfig.custom().setConnectTimeout(5000).setSocketTimeout(3000).build();  
		 CloseableHttpClient httpclient = HttpClientBuilder.create().setDefaultRequestConfig(config).build();  
		
        List<NameValuePair> pairs = null;  
        if (params != null && !params.isEmpty()) {  
            pairs = new ArrayList<NameValuePair>(params.size());  
            for (String key : params.keySet()) {  
                pairs.add(new BasicNameValuePair(key, params.get(key).toString()));  
        }  
        }  
        HttpPost httpPost = new HttpPost(url);  
        if (pairs != null && pairs.size() > 0) {  
            httpPost.setEntity(new UrlEncodedFormEntity(pairs, CHARSET));  
        }  
        CloseableHttpResponse response = httpclient.execute(httpPost);  
        int statusCode = response.getStatusLine().getStatusCode();  
        if (statusCode != 200) {  
            httpPost.abort();  
            throw new RuntimeException("HttpClient,error status code :" + statusCode);  
        }  
        HttpEntity entity = response.getEntity();  
        String result = null;  
        if (entity != null) {  
            result = EntityUtils.toString(entity, "utf-8");  
            EntityUtils.consume(entity);  
            response.close();  
            return result;  
        }else{  
             return null;  
        }  
}  

}
