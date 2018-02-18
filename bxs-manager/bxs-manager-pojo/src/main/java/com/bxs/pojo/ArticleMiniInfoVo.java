package com.bxs.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * 
 * 用于首页展示的文章信息，去除首页不展示的字段，提升首页加载速度
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年2月18日 下午8:52:17
 * @history:
 * @version: v1.0
 */
public class ArticleMiniInfoVo {
	// 主键
	private String id;
	// 文章类型(1:普通 2:图片 3：视频)
	private String articleType;
	// 文章标题
	private String articleTitle;
	// 栏目名称
	private String topicName;
	// 栏目编码
	private String topicCode;
	// 文章审核状态(0:未审核 1:审核通过)
	private String checkState;
	// 首页推荐（0：不推荐 1：推荐）
	private String frontSliderState;
	// 创建时间
	private Date createDate;
	// 发布时间
	private Date publishDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public String getTopicCode() {
		return topicCode;
	}

	public void setTopicCode(String topicCode) {
		this.topicCode = topicCode;
	}

	public String getCheckState() {
		return checkState;
	}

	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}

	public String getFrontSliderState() {
		return frontSliderState;
	}

	public void setFrontSliderState(String frontSliderState) {
		this.frontSliderState = frontSliderState;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	
}
