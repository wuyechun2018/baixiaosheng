package com.bxs.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EasyTree;
import com.bxs.jdbc.TopicDao;
import com.bxs.pojo.Topic;
import com.bxs.service.TopicService;

@Service
public class TopicServiceImpl  implements TopicService{
	
	@Autowired
    private TopicDao topicDao;
	
	@Override
	public List<EasyTree> getListByPid(String pid) {
		List<EasyTree> list=new ArrayList<EasyTree>();
		List<Topic> topicList=topicDao.getListByPid(pid);
		for (Topic topic : topicList) {
			EasyTree easyTree=new EasyTree();
			easyTree.setId(topic.getId());
			easyTree.setText(topic.getTopicName());
			//节点状态，有两个值  'open' or 'closed', 默认为'open'. 当为‘closed’,说明此节点下有子节点否则此节点为叶子节点
			easyTree.setState(hasChild(topic.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("topicPid", topic.getPid());
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
}