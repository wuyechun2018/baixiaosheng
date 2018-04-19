package com.bxs.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ArticleInfoVo implements java.io.Serializable {

	/**
	 * TODO
	*/
	private static final long serialVersionUID = 4861820347185036214L;
	// 主键
	private String id;
	//文章类型(1:普通 2:图片 3：视频)
	private String articleType;
	// 栏目Id
	private String topicId;
	// 文章标题
	private String articleTitle;
	// 文章配图地址
	private String articleImageUrl;
	// 文章内容
	private String articleContent;
	// 发布部门ID
	private String publishDeptId;
	// 发布用户ID
	private String publishUserId;
	// 文章审核状态(0:未审核 1:审核通过)
	private String checkState;
	// 推荐值（值越大，越先显示）
	private int topCount;
	// 浏览次数
	private int viewCount;
	// 排序
	private int displayOrder;
	// 数据状态,详情参考 com.bxs.common.dict.DataState
	private String dataState;
	// 创建时间
	private Date createDate;
	// 更新时间
	private Date updateDate;
	// 栏目名称
	private String topicName;
	//栏目编码
	private String topicCode;
	// 发布文章部门名称
	private String publishDeptName;
	// 发布文章用户姓名
	private String publishUserName;
	//首页推荐（0：不推荐   1：推荐）
	private String frontSliderState;
	//文章插图Url，针对图片文章，提取文章中的图片URL
	private String contentImageUrl;
	
	//信息来源
	private String newsfrom;
	//作者
	private String author;
	//发布时间
	private Date publishDate;
	
	//置顶状态
	private String topState;
	//是否弹窗
	private String popState;
	
	//发布媒体
	private String publishMedia;

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

	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleImageUrl() {
		return articleImageUrl;
	}

	public void setArticleImageUrl(String articleImageUrl) {
		this.articleImageUrl = articleImageUrl;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public String getPublishDeptId() {
		return publishDeptId;
	}

	public void setPublishDeptId(String publishDeptId) {
		this.publishDeptId = publishDeptId;
	}

	public String getPublishUserId() {
		return publishUserId;
	}

	public void setPublishUserId(String publishUserId) {
		this.publishUserId = publishUserId;
	}

	public String getCheckState() {
		return checkState;
	}

	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}

	public int getTopCount() {
		return topCount;
	}

	public void setTopCount(int topCount) {
		this.topCount = topCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")  
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")  
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public String getPublishDeptName() {
		return publishDeptName;
	}

	public void setPublishDeptName(String publishDeptName) {
		this.publishDeptName = publishDeptName;
	}

	public String getPublishUserName() {
		return publishUserName;
	}

	public void setPublishUserName(String publishUserName) {
		this.publishUserName = publishUserName;
	}

	public String getTopicCode() {
		return topicCode;
	}

	public void setTopicCode(String topicCode) {
		this.topicCode = topicCode;
	}

	public String getFrontSliderState() {
		return frontSliderState;
	}

	public void setFrontSliderState(String frontSliderState) {
		this.frontSliderState = frontSliderState;
	}

	public String getContentImageUrl() {
		return contentImageUrl;
	}

	public void setContentImageUrl(String contentImageUrl) {
		this.contentImageUrl = contentImageUrl;
	}

	public String getNewsfrom() {
		return newsfrom;
	}

	public void setNewsfrom(String newsfrom) {
		this.newsfrom = newsfrom;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getTopState() {
		return topState;
	}

	public void setTopState(String topState) {
		this.topState = topState;
	}

	public String getPopState() {
		return popState;
	}

	public void setPopState(String popState) {
		this.popState = popState;
	}

	public String getPublishMedia() {
		return publishMedia;
	}

	public void setPublishMedia(String publishMedia) {
		this.publishMedia = publishMedia;
	}
	
	
}
