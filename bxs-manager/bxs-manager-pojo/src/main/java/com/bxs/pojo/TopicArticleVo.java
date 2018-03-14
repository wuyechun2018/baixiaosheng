package com.bxs.pojo;

import com.bxs.common.vo.EUIGrid;

public class TopicArticleVo {
	
	public TopicArticleVo(Topic topic, EUIGrid articleGrid) {
		super();
		this.topic = topic;
		this.articleGrid = articleGrid;
	}

	private Topic topic;
	
	private EUIGrid articleGrid;

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public EUIGrid getArticleGrid() {
		return articleGrid;
	}

	public void setArticleGrid(EUIGrid articleGrid) {
		this.articleGrid = articleGrid;
	}
	
	
	
}
