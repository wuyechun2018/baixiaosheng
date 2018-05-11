package com.bxs.service;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.bxs.jdbc.ArticleCountDao;
import com.bxs.jdbc.ArticleDao;
import com.bxs.jdbc.DeptDao;
import com.bxs.jdbc.InfoRankDao;
import com.bxs.jdbc.TopicDao;
import com.bxs.pojo.ArticleCount;
import com.bxs.pojo.Dept;
import com.bxs.pojo.InfoRank;
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
	
	private static final Logger logger =LoggerFactory.getLogger(DataInitJob.class);

	
	@Autowired
	private ArticleCountDao articleCountDao;
	
	@Autowired
	private TopicDao topicDao;
	
	@Autowired
	private InfoRankDao infoRankDao;
	
	@Autowired
	private DeptDao deptDao;
	
	@Autowired
	private ArticleDao articleDao;
	
	
	//@Value("${stat.article.topic}")
	//private String statArticleTopic;
	
	
	
	/**
	 * 
	 * 更新信息排名数据
	 * @author: wyc
	 * @createTime: 2018年3月16日 下午1:45:42
	 * @history: void
	 */
	@Scheduled(cron = "0 0/5 * * * ?")
	@Async
	public void updateRankInfo(){
		logger.info("-----更新信息排名数据开始,时间是:{}",new DateTime().toString("yyyy/MM/dd HH:mm:ss"));
		String statYear=new SimpleDateFormat("yyyy").format(new Date());
		// 获取部门数据
		List<Dept> deptList = deptDao.getListByPid("1");
		for (Dept dept : deptList) {
			InfoRank rank=infoRankDao.getInfoRankByStatYearAndDeptId(statYear, dept.getId());
			// 支队
			rank.setZhidui(articleDao.getCountByPublishDateAndTopic(statYear,"ZHYW,GZJB,GZDT",dept.getId()));
			//更新
			infoRankDao.update(rank);
		}
		logger.info("-----更新信息排名数据结束,时间是:{}",new DateTime().toString("yyyy/MM/dd HH:mm:ss"));
	}
	
	
	
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
		Long sCount=articleCountDao.getTotalCount();
		if(!totalList.isEmpty()){
			ArticleCount totalCount=totalList.get(0);
			totalCount.setArticleCount(sCount.intValue());
			totalCount.setUpdateDate(new Date());
			articleCountDao.update(totalCount);
			System.out.println("更新-----文章总数,数量："+sCount);
		}else{
			ArticleCount articleCount=new ArticleCount();
			articleCount.setArticleCount(sCount.intValue());
			articleCount.setTopicCode("TOTAL");
			articleCount.setUpdateDate(new Date());
			articleCountDao.save(articleCount);
			System.out.println("插入-----文章总数,数量："+sCount);
		}
		
	}

}
