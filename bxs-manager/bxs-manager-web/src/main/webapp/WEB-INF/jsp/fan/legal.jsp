<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="shortcut icon" href="${ctx}/resources/fan/images/sitaoke.ico" />
<link rel="icon" href="${ctx}/resources/fan/images/sitaoke.ico"
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--手机版设置-->
<meta http-equiv="X-UA-Compatible" content="IE=11">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--/手机版设置-->
<title>思淘客-联系我们</title>
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
	<div class="about02">法律声明</div>
	<div class="abouttext">
	   <p>欢迎您加入参加思淘客论坛的交流和讨论，本论坛为非政府性质的公共论坛，旨在为广大思淘客信息交流展示的网络平台，为维护网上公共秩序和社会稳定，请您先阅读并自觉遵守以下条款： </p>
	   <p>一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息： </p>
	   <p>（一）煽动抗拒、破坏宪法和法律、行政法规实施的；</p>
	   <p>（二）煽动颠覆国家政权，推翻社会主义制度，煽动分裂国家、破坏国家统一的；</p>
	   <p>（三）煽动民族仇恨、民族歧视，破坏民族团结的；</p>
	   <p>（四）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；</p>
	   <p>（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序及有可能引发不良后果和社会不安定因素的；</p>
	   <p>（六）损害国家机关信誉的；</p>
	   <p>（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；</p>
	   <p>（八）其他违反宪法和法律行政法规的；</p>
	   <p>（九）有损南陵对外形象和恶意攻击、抵毁县委县政府及相关职能部门和蓄意引发上述内容的；</p>
	   <p>（十）有损本站形象，恶意攻击、抵毁本站及对网站管理人员的。</p>
	   <p>二、互相尊重，对自己的言论和行为负责。 </p>
	   <p style="text-align:right;">《思淘客》工作室<br />
	  	<br />
	  	2018年5月8日</p>
	</div>
</div>


<!--/内容-->
	<div class="clear"></div>
	<jsp:include page="footer.jsp" flush="true">
		 <jsp:param value="${ctx}" name="ctxPath"/> 
	 </jsp:include>
</body>

</html>