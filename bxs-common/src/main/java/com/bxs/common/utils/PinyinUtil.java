package com.bxs.common.utils;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
public class PinyinUtil {

	public static void main(String[] args) {
		System.out.println(toPinyin("李长是市长"));
		//支持多音字
		System.out.println(converterToSpell("李长是市长"));
		System.out.println(toPinyin("我在长安城里快乐的成长"));
		System.out.println(toPinyin(clearNotChinese("前置机表名称（xxb用户下）")));
		System.out.println(toFirstChar("我是中国人"));
		System.out.println(toPinyin("张海洋"));
		System.out.println(clearNotChinese("前置机表名称（xxb用户下）").replaceAll(" ", ""));
		
		System.out.println(RandomStringUtils.randomAlphanumeric(16));;
	}
	
	
	  public static String converterToSpell(String chines) {    
          StringBuffer pinyinName = new StringBuffer();    
          char[] nameChar = chines.toCharArray();    
          HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();    
          defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);    
          defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);    
          for (int i = 0; i < nameChar.length; i++) {    
              if (nameChar[i] > 128) {    
                  try {    
                      // 取得当前汉字的所有全拼    
                      String[] strs = PinyinHelper.toHanyuPinyinStringArray(    
                              nameChar[i], defaultFormat);    
                      if (strs != null) {    
                          for (int j = 0; j < strs.length; j++) {    
                              pinyinName.append(strs[j]);    
                              if (j != strs.length - 1) {    
                                  pinyinName.append(",");    
                              }    
                          }    
                      }    
                  } catch (BadHanyuPinyinOutputFormatCombination e) {    
                      e.printStackTrace();    
                  }    
              } else {    
                  pinyinName.append(nameChar[i]);    
              }    
              pinyinName.append(" ");    
          }    
          return parseTheChineseByObject(discountTheChinese(pinyinName.toString()));    
      }
	  
	  private static String parseTheChineseByObject(    
              List<Map<String, Integer>> list) {    
          Map<String, Integer> first = null; // 用于统计每一次,集合组合数据    
          // 遍历每一组集合    
          for (int i = 0; i < list.size(); i++) {    
              // 每一组集合与上一次组合的Map    
              Map<String, Integer> temp = new Hashtable<String, Integer>();    
              // 第一次循环，first为空    
              if (first != null) {    
                  // 取出上次组合与此次集合的字符，并保存    
                  for (String s : first.keySet()) {    
                      for (String s1 : list.get(i).keySet()) {    
                          String str = s + s1;    
                          temp.put(str, 1);    
                      }    
                  }    
                  // 清理上一次组合数据    
                  if (temp != null && temp.size() > 0) {    
                      first.clear();    
                  }    
              } else {    
                  for (String s : list.get(i).keySet()) {    
                      String str = s;    
                      temp.put(str, 1);    
                  }    
              }    
              // 保存组合数据以便下次循环使用    
              if (temp != null && temp.size() > 0) {    
                  first = temp;    
              }    
          }    
          String returnStr = "";    
          if (first != null) {    
              // 遍历取出组合字符串    
              for (String str : first.keySet()) {    
                  returnStr += (str + ",");    
              }    
          }    
          if (returnStr.length() > 0) {    
              returnStr = returnStr.substring(0, returnStr.length() - 1);    
          }    
          return returnStr;    
      }    
      
	  
	  private static List<Map<String, Integer>> discountTheChinese(String theStr) {    
          // 去除重复拼音后的拼音列表    
          List<Map<String, Integer>> mapList = new ArrayList<Map<String, Integer>>();    
          // 用于处理每个字的多音字，去掉重复    
          Map<String, Integer> onlyOne = null;    
          String[] firsts = theStr.split(" ");    
          // 读出每个汉字的拼音    
          for (String str : firsts) {    
              onlyOne = new Hashtable<String, Integer>();    
              String[] china = str.split(",");    
              // 多音字处理    
              for (String s : china) {    
                  Integer count = onlyOne.get(s);    
                  if (count == null) {    
                      onlyOne.put(s, new Integer(1));    
                  } else {    
                      onlyOne.remove(s);    
                      count++;    
                      onlyOne.put(s, count);    
                  }    
              }    
              mapList.add(onlyOne);    
          }    
          return mapList;    
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
