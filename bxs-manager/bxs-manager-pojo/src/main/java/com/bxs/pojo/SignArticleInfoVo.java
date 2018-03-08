package com.bxs.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * 签收信息 (包含文章相关信息)
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年2月23日 上午11:14:42
 * @history:
 * @version: v1.0
 */
public class SignArticleInfoVo implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//主键
	private String id;
	
	//文章主键
	private String articleId;
	
	//文章类型
	private String articleType;
	
	//签收部门Id
	private String signDeptId;
	
	//签收部门名称
	private String signDeptName;
	
	//签收用户Id
	private String signUserId;
	
	//签收用户姓名
	private String signUserName;
	
	//签收状态(0 未签收 1已签收)
	private String signState;
	
	//反馈内容
	private String signContent;
	
	// 签收时间
	private Date signDate;
	
	// 数据状态,详情参考 com.bxs.common.dict.DataState
	private String dataState;
	
	// 创建时间
	private Date createDate;
	
	// 更新时间
	private Date updateDate;
	
	//文章标题
	private String articleTitle;
	
	//专题名称
	private String topicName;
	
	//发布部门名称
	private String publishDeptName;
	
	//发布人姓名
	private String publishUserName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public String getSignDeptId() {
		return signDeptId;
	}

	public void setSignDeptId(String signDeptId) {
		this.signDeptId = signDeptId;
	}

	public String getSignDeptName() {
		return signDeptName;
	}

	public void setSignDeptName(String signDeptName) {
		this.signDeptName = signDeptName;
	}

	public String getSignState() {
		return signState;
	}

	public void setSignState(String signState) {
		this.signState = signState;
	}

	public String getSignContent() {
		return signContent;
	}

	public void setSignContent(String signContent) {
		this.signContent = signContent;
	}

	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getSignUserId() {
		return signUserId;
	}

	public void setSignUserId(String signUserId) {
		this.signUserId = signUserId;
	}

	public String getSignUserName() {
		return signUserName;
	}

	public void setSignUserName(String signUserName) {
		this.signUserName = signUserName;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
