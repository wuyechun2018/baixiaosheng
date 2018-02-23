package com.bxs.service;
import java.util.List;
import com.bxs.common.vo.EUITree;
import com.bxs.pojo.Topic;

public interface TopicService {

	List<EUITree> getListByPid(String pid);
	
	
	List<EUITree> getSignListByPid(String pid);
	
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

	/**
	 * 
	 * 保存栏目
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:07:09
	 * @history:
	 * @param topic void
	 */
	void save(Topic topic);

	
	/**
	 *  
	 * 删除栏目
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:48:05
	 * @history:
	 * @param id void
	 */
	void delete(String id);

	/**
	 * 
	 * 根据栏目编码获取栏目信息
	 * @author: wyc
	 * @createTime: 2018年2月3日 下午10:48:05
	 * @history:
	 * @param topicCode
	 * @return Topic
	 */
	Topic getTopicByCode(String topicCode);

	

}
