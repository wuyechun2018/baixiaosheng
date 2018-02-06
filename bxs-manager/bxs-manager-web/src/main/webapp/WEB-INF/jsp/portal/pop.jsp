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
<script type="text/javascript">

function loadArticleByTopic(topicCode,page,rows,isSytj){
	var articleData=null;
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/loadArticleByTopic',
		data:{
			topicCode:topicCode,
			frontSliderState:isSytj,
			page:page,
			rows:rows
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	articleData=data;
	    }
	})
	return articleData;
}

$(function(){
	 var ggData=loadArticleByTopic("GG",'1','1','');
	 if(ggData!=null&&ggData.rows.length>0){
		 var articleObj=ggData.rows[0];
		 $('#articleTitle').html(articleObj.articleTitle);
		 $('#articleConent').html(articleObj.articleContent);
		 var articleDesc='拟稿单位：'+articleObj.publishDeptName+' &nbsp;&nbsp;&nbsp;&nbsp;发布时间：'+articleObj.createDate.substr(0,10);
		 $('#articleDesc').html(articleDesc);
	 }
	
})
</script>




</head>
<body>
<div class="tcTitle">
	<h1 id="articleTitle"></h1>
</div>
<div class="cc_con">
	<span id="articleDesc"></span>
</div>
<div class="tcCon" id="articleConent">

</div>
</body>
</html>