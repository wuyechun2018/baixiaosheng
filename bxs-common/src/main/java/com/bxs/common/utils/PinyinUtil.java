package com.bxs.common.utils;
import org.apache.commons.lang3.RandomStringUtils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
public class PinyinUtil {

	public static void main(String[] args) {
		System.out.println(toPinyin(clearNotChinese("前置机表名称（xxb用户下）")));
		System.out.println(toFirstChar("我是中国人"));
		System.out.println(toPinyin("张海洋"));
		System.out.println(clearNotChinese("前置机表名称（xxb用户下）").replaceAll(" ", ""));
		
		System.out.println(RandomStringUtils.randomAlphanumeric(16));;
	}

	/**
	 * 
	 * 中文转拼音
	 * 
	 * @author: wyc
	 * @createTime: 2017年10月13日 下午3:02:03
	 * @history:
	 * @param chinese
	 * @return String
	 */
	public static String toPinyin(String chinese) {
		chinese=clearNotChinese(chinese);
		String pinyinStr = "";
		char[] newChar = chinese.toCharArray();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (int i = 0; i < newChar.length; i++) {
			if (newChar[i] > 128) {
				try {
					pinyinStr += PinyinHelper.toHanyuPinyinStringArray(newChar[i], defaultFormat)[0];
				} catch (BadHanyuPinyinOutputFormatCombination e) {
					e.printStackTrace();
				}
			} else {
				pinyinStr += newChar[i];
			}
		}
		return pinyinStr;
	}

	/**
	 * 
	 * 获取第一个字母
	 * 
	 * @author: wyc
	 * @createTime: 2017年10月13日 下午3:04:07
	 * @history:
	 * @param chinese
	 * @return String
	 */
	public static String toFirstChar(String chinese) {
		chinese=clearNotChinese(chinese);
		String pinyinStr = "";
		char[] newChar = chinese.toCharArray();
		HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
		defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		for (int i = 0; i < newChar.length; i++) {
			if (newChar[i] > 128) {
				try {
					pinyinStr += PinyinHelper.toHanyuPinyinStringArray(newChar[i], defaultFormat)[0].charAt(0);
				} catch (BadHanyuPinyinOutputFormatCombination e) {
					e.printStackTrace();
				}
			} else {
				pinyinStr += newChar[i];
			}
		}
		return pinyinStr;
	}

	/**
	 * 
	 * 过滤非汉字
	 * @author: wyc
	 * @createTime: 2017年10月13日 下午3:37:53
	 * @history:
	 * @param buff
	 * @return String
	 */
	private static String clearNotChinese(String buff) {
		// 去掉所有中英文符号
		String tmpString = buff.replaceAll("(?i)[^a-zA-Z0-9\u4E00-\u9FA5]", "");
		char[] carr = tmpString.toCharArray();
		// 过滤掉非汉字内容
		for (int i = 0; i < tmpString.length(); i++) {
			if (carr[i] < 0xFF) {
				carr[i] = ' ';
			}
		}
		return String.copyValueOf(carr).trim().replaceAll(" ", "");
	}

}
