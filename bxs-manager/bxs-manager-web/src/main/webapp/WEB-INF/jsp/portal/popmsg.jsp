<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>马鞍山市交警支队</title>
<link href="${ctx}/resources/portal/css/tcgg.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="tcTitle">
	<h1 id="articleTitle">${articleInfoVo.articleTitle}</h1>
</div>
<div class="cc_con">
	<span id="articleDesc">拟稿单位：${articleInfoVo.publishDeptName}&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<fmt:formatDate value="${articleInfoVo.createDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
</div>
<div class="tcCon" id="articleConent">
	${articleInfoVo.articleContent}
</div>
</body>
</html>