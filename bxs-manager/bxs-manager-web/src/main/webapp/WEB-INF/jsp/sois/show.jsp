<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章预览</title>
<link rel="stylesheet" href="${ctx}/resources/sois/css/yulan.css" media="all" />
<script type="text/javascript" src="${ctx}/resources/js-lib/ckplayer/ckplayer.js"></script>
<script type="text/javascript">
var ctx = "${ctx}";

function doZoom(size){
	document.getElementById('zoom').style.fontSize=size+'px';
	document.getElementById('zoom').style.lineHeight="165%";
}

</script> 
</head>
<body >
	<div class="newsContent" id="newsContent">
	<div class="c_Box">
    	<h3 class="sp_title">${articleInfoVo.articleTitle}</h3>
        <div class="sp_time">
		 <span>投稿部门：${articleInfoVo.publishDeptName}</span>
		 <span>发布时间：<fmt:formatDate value="${articleInfoVo.createDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
		 <span>【字体：<a href="javascript:doZoom(20)">大</a><a href="javascript:doZoom(16)">中</a><a href="javascript:doZoom(12)">小</a>】</span>
		</div>
        <div class="content" id="zoom">
        	 <c:if test="${articleInfoVo.articleType!='3'&&articleInfoVo.articleType!='7'}">
        	 	${articleInfoVo.articleContent}
        	 </c:if>	
        	
        	 <c:if test="${articleInfoVo.articleType=='3'||articleInfoVo.articleType=='7'}">
	        	<div id="video" style="width: 600px; height: 400px; margin:0px auto;"></div>
				<script type="text/javascript">
	                var videoObject = {
	                    container: '#video',
	                    variable: 'player',
	                    flashplayer:true,
	                    //poster:'${ctx}/resources/js-lib/ckplayer/poster.jpg',
	            		video:'${articleInfoVo.contentImageUrl}'
	                };
	                var player = new ckplayer(videoObject);
	            </script>
            </c:if>
        	
		</div>
		<div class="content" style="text-align: center;">
			<img src="${articleInfoVo.articleImageUrl }" />
		</div>
        
    </div>
</div>
</body>
</html>