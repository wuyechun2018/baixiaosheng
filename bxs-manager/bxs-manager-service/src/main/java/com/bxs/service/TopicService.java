package com.bxs.service;
import java.util.List;
import com.bxs.common.vo.EUITree;
import com.bxs.pojo.Topic;

public interface TopicService {

	List<EUITree> getListByPid(String pid);
	
	List<EUITree> getListByPidAndName(String pid, String topicName);
	
	
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

	/**
	 * 
	 * 根据专题Ids查询专题列表,Ids以逗号分隔,
	 * 如 5a04f14f-4d6f-435a-a6ac-393a2f6e8d11,17e4c20a-1e6d-43bd-bc4b-11fa36a81df7
	 * @author: wyc
	 * @createTime: 2018年3月14日 上午8:59:37
	 * @history:
	 * @param configValue
	 * @return List<Topic>
	 */
	List<Topic> getListByIds(String configValue);


	/**
	 * 
	 * 获取所有专题
	 * @author: wyc
	 * @createTime: 2018年4月27日 上午8:50:06
	 * @history:
	 * @return List<Topic>
	 */
	public List<Topic> getAllTopic();

	

}
