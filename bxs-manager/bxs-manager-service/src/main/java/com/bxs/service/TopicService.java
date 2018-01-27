package com.bxs.service;
import java.util.List;
import com.bxs.common.vo.EasyTree;

public interface TopicService {

	List<EasyTree> getListByPid(String pid);
	
	/**
	 * 
	 * 是否含有子节点
	 * @author: wyc
	 * @createTime: 2018年1月27日 上午11:25:02
	 * @history:
	 * @param pid
	 * @return boolean
	 */
	boolean hasChild(String pid);

}
