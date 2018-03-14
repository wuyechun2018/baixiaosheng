<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/subject/css/css.css" rel="stylesheet" />
<title>栏目页</title>
</head>
<body>
	<div class="header">
    	<div class="container">
        	<a href="javascript:void(0)"><img src="${ctx}/resources/subject/images/logobj.jpg" /></a>
        </div>
    </div>
    <div class="nav">
        <div class="menu">
            <ul>
            	  <li><a href="${ctx}/subject/index?code=${configInfoVo.configTypeCode}"  class="cur">首页</a></li>
            <c:forEach items="${topicList}" var="topic" begin="0" end="5">
            	  <li><a href="${ctx}/subject/list?code=${configInfoVo.configTypeCode}&topicCode=${topic.topicCode}" target="_blank">${topic.topicName}</a></li>
            </c:forEach>
            </ul>
        </div>
    </div>
    <div class="layout m-crumb">
        <a href="${ctx}/subject/index?code=${configInfoVo.configTypeCode}" >首页</a><span>&gt;</span><em>${topic.topicName}</em>
    </div>
    <div class="container clearfix nei_bg">
    	<div class="Ctitle clearfix"><div class="cur">${topic.topicName}</div></div>
        <ul class="listc clearfix">
        	<li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
             <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
            <li><span>[2018-1-24]</span><a href="#" target="_blank" title="新闻标题">新闻标题</a></li>
               
               
            

    </ul>
    
        <div class="page">
            <a class="first">＜上一页</a>
            <a class="page-on">1</a><a href="#">2</a>
            <a href="#">3</a>
            <a class="end" href="#">下一页 &gt;</a>
           
        </div>
        
    	
    </div>
    
    <div class="txlFoot">
        <div class="copyright">马鞍山公安局交警支队 联系电话：0555-2425010</div>
    </div>
</body>
</html>