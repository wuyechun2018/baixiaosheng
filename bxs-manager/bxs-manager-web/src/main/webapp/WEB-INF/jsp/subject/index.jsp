<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/subject/themes/${configInfoVo.linkTargetType }/css/css.css" rel="stylesheet" />
<title>首页</title>
</head>
<body>
	<div class="header">
    	<div class="container">
        	<a href="javascript:void(0)">
        		<%--
        		<img src="${ctx}/resources/subject/images/logobj.jpg" />
        		 --%>
        		 <img src="${configInfoVo.configImageUrl}" />
        	</a>
        </div>
    </div>
    <div class="nav">
        <div class="menu">
            <ul>
            <li><a href="javascript:void(0)"  class="cur">首页</a></li>
            
            <c:forEach items="${topicList}" var="topic" begin="0" end="5">
            	  <li><a href="${ctx}/subject/list?code=${configInfoVo.configTypeCode}&topicCode=${topic.topicCode}" target="_blank">${topic.topicName}</a></li>
            </c:forEach>
            <%--
	            <li><a href="#" target="_blank">栏目1</a></li>
	            <li><a href="#" target="_blank">栏目2</a></li>
	            <li><a href="#" target="_blank">栏目3</a></li>
	            <li><a href="#" target="_blank">栏目4</a></li>
	            <li><a href="#" target="_blank">栏目5</a></li>
	            <li><a href="#" target="_blank">栏目6</a></li>
             --%>
            </ul>
        </div>
    </div>
    
    <div class="container clearfix index_bg">
    
    	 <c:forEach items="${articleList}" var="topicArticleVo" begin="0" end="3" varStatus="status">
            <div class="box fl">
        		<span class="more"><a href="${ctx}/subject/list?code=${configInfoVo.configTypeCode}&topicCode=${topicArticleVo.topic.topicCode}">更多</a></span>
           		 <h2>${topicArticleVo.topic.topicName}</h2>
           		  <c:if test="${status.count%2==1}">
	             	<ul class="list clearfix">
	             </c:if>
	             <c:if test="${status.count%2==0}">
	             	<ul class="list clearfix">
	             </c:if>
	             	<c:forEach items="${topicArticleVo.articleGrid.rows}" var="articleInfoVo" begin="0" end="7"  varStatus="status">
	                	<c:choose> 
						     <c:when test="${fn:length(articleInfoVo.articleTitle) > 20}"> 
						    	<li><span><fmt:formatDate value="${articleInfoVo.createDate}"  pattern="MM-dd"/></span><a target="_blank" href="${ctx}/subject/content?id=${articleInfoVo.id}&code=${configInfoVo.configTypeCode}" title="${articleInfoVo.articleTitle}"><c:out value="${fn:substring(articleInfoVo.articleTitle, 0, 20)}..." /> </a></li> 
						     </c:when> 
						     <c:otherwise> 
						     	<li><span><fmt:formatDate value="${articleInfoVo.createDate}"  pattern="MM-dd"/></span><a target="_blank" href="${ctx}/subject/content?id=${articleInfoVo.id}&code=${configInfoVo.configTypeCode}" title="${articleInfoVo.articleTitle}">${articleInfoVo.articleTitle} </a></li> 
						     </c:otherwise>
					    </c:choose>
	                </c:forEach>
	            </ul>
        	</div>
         </c:forEach>
    	
    	<%--
    	<div class="box fl">
        	<span class="more"><a href="#">更多</a></span>
            <h2>栏目1</h2>
            <ul class="list clearfix">
            	<li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
            </ul>
        </div>
        <div class="box fl" style="margin-right:0;">
        	<span class="more"><a href="#">更多</a></span>
            <h2>栏目2</h2>
            <ul class="list clearfix">
            	<li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
            </ul>
        </div>
        <div class="box fl">
        	<span class="more"><a href="#">更多</a></span>
            <h2>栏目3</h2>
            <ul class="list clearfix">
            	<li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
            </ul>
        </div>
        <div class="box fl" style="margin-right:0;">
        	<span class="more"><a href="#">更多</a></span>
            <h2>栏目4</h2>
            <ul class="list clearfix">
            	<li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
                <li><span>03-18</span><a target="_blank" href="#" title="新闻标题">新闻标题</a></li> 
            </ul>
        </div>
         --%>
    </div>
    
    <div class="txlFoot">
        <div class="copyright">马鞍山公安局交警支队 联系电话：0555-2425010</div>
    </div>
</body>
</html>