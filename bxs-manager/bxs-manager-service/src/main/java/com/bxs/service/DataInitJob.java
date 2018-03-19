package com.bxs.service;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.bxs.jdbc.ArticleCountDao;
import com.bxs.jdbc.TopicDao;
import com.bxs.pojo.ArticleCount;
import com.bxs.pojo.Topic;

/**
 * 
 * 定时任务
 * @desc: bxs-manager-service
 * @author: wyc
 * @createTime: 2018年3月16日 下午2:56:04
 * @history:
 * @version: v1.0
 */
@Component
public class DataInitJob {
	
	@Autowired
	private ArticleCountDao articleCountDao;
	
	@Autowired
	private TopicDao topicDao;
	
	
	/**
	 * 
	 * 初始化文章数量-30分钟执行一次
	 * @author: wyc
	 * @createTime: 2018年3月16日 下午1:45:42
	 * @history: void
	 */
	@Scheduled(cron = "0 0/30 * * * ?")
	@Async
	public void initArticleCount(){
		//获取
		List<Topic> topicList=topicDao.getListByPid("1");
		for (Topic topic : topicList) {
			List<ArticleCount> countList=articleCountDao.getListByTopicCode(topic.getTopicCode());
			Long acount=articleCountDao.getArticleTotalCount(topic.getTopicCode());
			if(countList.isEmpty()){
				//插入
				System.out.println("插入-----"+topic.getTopicCode()+",数量："+acount);
				ArticleCount articleCount=new ArticleCount();
				articleCount.setArticleCount(acount.intValue());
				articleCount.setTopicCode(topic.getTopicCode());
				articleCount.setUpdateDate(new Date());
				
				articleCountDao.save(articleCount);
			}else{
				//更新
				System.out.println("更新-----"+topic.getTopicCode()+",数量："+acount);
				ArticleCount articleCount=countList.get(0);
				articleCount.setArticleCount(acount.intValue());
				articleCount.setUpdateDate(new Date());
				
				articleCountDao.update(articleCount);
			}
		}
		
		//更新总数
		List<ArticleCount> totalList=articleCountDao.getListByTopicCode("TOTAL");
		ArticleCount totalCount=totalList.get(0);
		Long sCount=articleCountDao.getTotalCount();
		totalCount.setArticleCount(sCount.intValue());
		totalCount.setUpdateDate(new Date());
		articleCountDao.update(totalCount);
		System.out.println("更新-----文章总数,数量："+sCount);
		
	}

}
