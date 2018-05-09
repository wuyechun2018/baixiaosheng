<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="shortcut icon" href="http://www.cfan.com.cn/cfan.ico" />
<link rel="icon" href="http://www.cfan.com.cn/cfan.ico"
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--手机版设置-->
<meta http-equiv="X-UA-Compatible" content="IE=11">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--/手机版设置-->
<title>思淘客-关于我们</title>
<link href="${ctx}/resources/fan/css/index.css" rel="stylesheet" />
<script type="text/javascript"
	src="${ctx}/resources/fan/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
.testclass {
	width: 150px;
	height: 150px;
	border: 1px solid #666;
	padding: 5px;
	position: absolute;
	bottom: 0;
	right: 60px;
	background: #fff; "
	z-index: 9999;
}

.ui-more {
	line-height: 30px;
	display: block;
	text-align: center;
	padding: 10px 0 10px 0;
	padding-left: -90px;
	position: relative;
}

.ui-more:after {
	content: "";
	position: absolute;
	z-index: 1;
	bottom: 0;
	left: 0;
	width: 171px;
	padding-left: 5px;
}
</style>
<script type="text/javascript">
            var ctx = "${ctx}";

</script>
</head>

<body>
	<!--头部-->
	<header class="header"> <a href="http://www.cfan.com.cn">
		<div class="logo"></div>
	</a> <nav class="navlist">
	<ul>
		<li><a href="${ctx}/fan/index">首页</a></li>
		<c:forEach items="${topicList}" var="topic" begin="0" end="4">
			<c:if test="${article.topicId==topic.id}">
				<li class="on"><a
					href="${ctx}/fan/list/{topic.topicCode}"
					target="_blank">${topic.topicName}</a></li>
			</c:if>
			<c:if test="${article.topicId!=topic.id}">
				<li><a href="${ctx}/fan/list/${topic.topicCode}"
					target="_blank">${topic.topicName}</a></li>
			</c:if>
		</c:forEach>
	</ul>
	</nav>
	<div class="head-right">
		<div class="search"></div>
	</div>
	</header>
	<div class="clear"></div>
	<!--内容-->

<div class="about">
<div class="about01">关于我们</div>
<div class="abouttext">
  <p></p>
<p>思淘客网站（www.sitaoke.vip），简称（sitaoke），定位于</p>
</div>

</div>


<!--/内容-->
	<div class="clear"></div>
	<jsp:include page="footer.jsp" flush="true">
		 <jsp:param value="${ctx}" name="ctxPath"/> 
	 </jsp:include>
</body>

</html>