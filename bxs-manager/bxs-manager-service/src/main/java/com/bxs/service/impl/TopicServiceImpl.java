package com.bxs.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUITree;
import com.bxs.jdbc.TopicDao;
import com.bxs.pojo.Topic;
import com.bxs.service.TopicService;

@Service
public class TopicServiceImpl  implements TopicService{
	
	@Autowired
    private TopicDao topicDao;
	
	@Override
	@Cacheable(value="myCacheTopic", key="'Topic'+#pid")
	public List<EUITree> getListByPid(String pid) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<Topic> topicList=topicDao.getListByPid(pid);
		for (Topic topic : topicList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(topic.getId());
			easyTree.setText(topic.getTopicName());
			easyTree.setState(hasChild(topic.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("pid", topic.getPid());
			attr.put("topicCode", topic.getTopicCode());
			//可否签收
			attr.put("topicType", topic.getTopicType());
			attr.put("topicDesc", topic.getTopicDesc());
			//是否在用
			attr.put("dataState", topic.getDataState());
			//排序
			attr.put("displayOrder", topic.getDisplayOrder()+"");
			
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}
	
	
	@Override
	public List<EUITree> getListByPidAndName(String pid, String topicName) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<Topic> topicList=topicDao.getListByPidAndTopicName(pid,topicName);
		for (Topic topic : topicList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(topic.getId());
			easyTree.setText(topic.getTopicName());
			easyTree.setState(hasChild(topic.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("pid", topic.getPid());
			attr.put("topicCode", topic.getTopicCode());
			//可否签收
			attr.put("topicType", topic.getTopicType());
			attr.put("topicDesc", topic.getTopicDesc());
			//是否在用
			attr.put("dataState", topic.getDataState());
			//排序
			attr.put("displayOrder", topic.getDisplayOrder()+"");
			
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}
	
	
	@Override
	public List<EUITree> getSignListByPid(String pid) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<Topic> topicList=topicDao.getSignListByPid(pid);
		for (Topic topic : topicList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(topic.getId());
			easyTree.setText(topic.getTopicName());
			easyTree.setState(hasChild(topic.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("pid", topic.getPid());
			attr.put("topicCode", topic.getTopicCode());
			//可否签收
			attr.put("topicType", topic.getTopicType());
			attr.put("topicDesc", topic.getTopicDesc());
			//是否在用
			attr.put("dataState", topic.getDataState());
			//排序
			attr.put("displayOrder", topic.getDisplayOrder()+"");
			
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}

	@Override
	public boolean hasChild(String pid) {
		List<Topic> list=topicDao.getListByPid(pid);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	@Override
	@CacheEvict(value="myCacheTopic", allEntries=true)
	public void save(Topic topic) {
		// 更新操作
		if (StringUtils.isNotBlank(topic.getId())) {
			topicDao.update(topic);
		} else {
		// 保存操作
			topicDao.save(topic);
		}
	}

	@Override
	@CacheEvict(value="myCacheTopic", allEntries=true)
	public void delete(String id) {
		topicDao.delete(id);
	}

	@Override
	public Topic getTopicByCode(String topicCode) {
		return topicDao.getTopicByCode(topicCode);
	}

	/**
	 * 
	 * 根据专题Ids查询专题列表,Ids以逗号分隔,
	 * 如 5a04f14f-4d6f-435a-a6ac-393a2f6e8d11,17e4c20a-1e6d-43bd-bc4b-11fa36a81df7
	 * @author: wyc
	 * @createTime: 2018年3月14日 上午8:59:37
	 * @history:
	 * @param Ids
	 * @return List<Topic>
	 */
	@Override
	public List<Topic> getListByIds(String Ids) {
		return topicDao.getListByIds(Ids);
	}


	@Override
	public List<Topic> getAllTopic() {
		return topicDao.getAllTopic();
	}


	@Override
	public Topic getTopicById(String id) {
		return topicDao.getTopicById(id);
	}



	
}