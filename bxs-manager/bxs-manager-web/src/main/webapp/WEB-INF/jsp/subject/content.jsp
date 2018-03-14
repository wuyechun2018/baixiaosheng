<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/subject/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/subject/js/common.js"></script>
<title>栏目页</title>
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
            	  <li><a href="${ctx}/subject/index?code=${configInfoVo.configTypeCode}"  class="cur">首页</a></li>
            <c:forEach items="${topicList}" var="topic" begin="0" end="5">
            	  <li><a href="${ctx}/subject/list?code=${configInfoVo.configTypeCode}&topicCode=${topic.topicCode}" target="_blank">${topic.topicName}</a></li>
            </c:forEach>
            </ul>
        </div>
    </div>
    <div class="layout m-crumb">
        <a href="${ctx}/subject/index?code=${configInfoVo.configTypeCode}" >首页</a><span>&gt;</span><em>${articleInfoVo.topicName}</em>
    </div>
    <div class="container clearfix nei_bg" id="newsContent">
    	<div class="c_Box">
            <h3 class="sp_title">${articleInfoVo.articleTitle}</h3>
            <div class="sp_time">
             <span>投稿部门：${articleInfoVo.publishDeptName}</span>
             <span>发布时间：<fmt:formatDate value="${articleInfoVo.createDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
             <span>【字体：<a href="javascript:doZoom(20)">大</a><a href="javascript:doZoom(16)">中</a><a href="javascript:doZoom(12)">小</a>】</span>
            </div>
            <div class="content" id="zoom">
				${articleInfoVo.articleContent}
			</div>
			<div class="content" style="text-align: center;">
				<img src="${articleInfoVo.articleImageUrl }" />
			</div>
            
            <div class="clearfix" style="margin:0 38px;">
                <div class="chare">
                    <div class="chare-left">
                    信息来源：${articleInfoVo.newsfrom}&nbsp;&nbsp;&nbsp;&nbsp;责任编辑：${articleInfoVo.author}
                    </div>
    
                    <div class="chare-right">	
                        <span><a href="javascript:printme()" class="dy">打印</a></span>
                        
                        <span><a href="javascript:window.close()" class="close">关闭页面</a></span>
                    </div>
                </div>
           </div>
            
        </div>
       
    
       
        
    	
    </div>
    
    <div class="txlFoot">
        <div class="copyright">马鞍山公安局交警支队 联系电话：0555-2425010</div>
    </div>
</body>
</html>