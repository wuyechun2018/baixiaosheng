package com.bxs.common.utils;
import org.joda.time.DateTime;

public class DateUtil {
	
	public static void main(String[]args){
		for(int i=0;i<30;i++){
			DateTime now = new DateTime();
			DateTime tomorrow = now.plusDays(i);
			String dataStr=tomorrow.toString("yyyy-MM-dd");
			System.out.println(dataStr);
		}
	}

}
