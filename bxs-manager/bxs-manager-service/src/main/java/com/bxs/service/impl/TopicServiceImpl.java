package com.bxs.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
	public boolean hasChild(String pid) {
		List<Topic> list=topicDao.getListByPid(pid);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	@Override
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
	public void delete(String id) {
		topicDao.delete(id);
	}

	@Override
	public Topic getTopicByCode(String topicCode) {
		return topicDao.getTopicByCode(topicCode);
	}
}