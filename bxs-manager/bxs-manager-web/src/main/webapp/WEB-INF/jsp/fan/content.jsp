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
<title>思淘客</title>
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
	<!--文章内容-->
	<div class="article">
		<h1>${article.articleTitle}</h1>
		<!-- 文章相关信息 -->
		<div class="notes">
			<span> 
			<a href="http://www.cfan.com.cn/2018/0428/130718.shtml" title="" target="_blank"></a>
				</span> <span>${article.publishDate}</span> 
			<span> 
				<a href="http://www.cfan.com.cn/technic/" target="_blank">应用</a>
			</span>
		</div>
		<!-- @end文章相关信息 -->
		<div class="maincontent">${article.articleContent}</div>
		<p></p>
		<!--上一篇下一篇-->
		<%--
		<div class="near">
			<div class="pre">
				上一篇： <a href="http://www.cfan.com.cn/2018/0427/130713.shtml"
					target="_blank">为了下班速度跑 右键必须加上关机项</a>
			</div>
			<div class="next">
				下一篇： <a href="http://www.cfan.com.cn/2018/0428/130720.shtml"
					target="_blank">加速上网？ 适合自己的DNS服务选对了吗？</a>
			</div>
		</div> --%>
		<!--/上一篇下一篇-->
		
		<div class="near">
			<div style="text-align: center;font-size: 16px;"><a  style="color:#ff004e;" href="${ctx}/fan/index" target="_blank">回到首页</a>
			</div>
		</div>
		
		<div class="clear"></div>
	</div>
	<!--/文章内容-->
	<div class="clear"></div>
	<jsp:include page="footer.jsp" flush="true">
		 <jsp:param value="${ctx}" name="ctxPath"/> 
	 </jsp:include>
</body>

</html>