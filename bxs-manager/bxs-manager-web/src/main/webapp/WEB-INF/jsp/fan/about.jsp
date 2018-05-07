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
  <p>创办于1993年的《电脑爱好者》，是目前中国发行量最大的IT技术普及媒体。经过20年的发展，现已成为中国最具有价值的媒体传播平台之一。在新媒介不断革新的时代，《电脑爱好者》也先行一步，官方微博（新浪）真实粉丝已超22万，粉丝活跃率超过35%，单条微博平均转发量50人/次、微博有奖活动转发达1.5万次，总覆盖人数可达900万。2012年新浪期刊微博影响力分类TOP20—IT数码类分中，电脑爱好者官微位列三甲。腾讯微信平台粉丝数量超过26000人，并在持续增长中。</p>
<p>爱好者网站（www.cfan.com.cn），简称（cfan），定位于对读者进行全面的IT知识与信息普及，包括与读者交流计算机软件、硬件、数码产品的选购经验、应用指导等信息，以及IT业界新闻、产品动态等各个方面。爱好者网内容丰富、更新及时、时时保持与网友互动交流，现已拥有50万的注册用户，每日登录用户五万人以上，这其中还不包括以游客身份浏览的用户。爱好者网的知识库和用户库一直不断完善，也进一步加强了与网友的沟通。</p>
</div>

</div>


<!--/内容-->
	<div class="clear"></div>
	<jsp:include page="footer.jsp" flush="true">
		 <jsp:param value="${ctx}" name="ctxPath"/> 
	 </jsp:include>
</body>

</html>