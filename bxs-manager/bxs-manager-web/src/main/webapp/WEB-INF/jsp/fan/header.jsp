<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bxs.pojo.Topic" %>	
<!--头部-->
 <%
 List<Topic> topicList=( List<Topic>)request.getAttribute("topicList");
 %>

<header class="header"> 
		<a href="http://www.cfan.com.cn">
			<div class="logo"></div>
		</a> 
		<nav class="navlist">
			<ul>
				 <li class="on"><a href="${ctx}/portal/list?topicCode=''">首页</a></li>
			 	  <c:forEach items="${topicList}" var="topic" begin="0" end="4">
		           	  <li><a href="${ctx}/portal/list?topicCode=${topic.topicCode}" target="_blank">${topic.topicName}</a></li>
		          </c:forEach>
			</ul>
		</nav>

		<div class="head-right">
			<div class="search"></div>
		</div>
</header>