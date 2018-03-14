<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/subject/themes/${configInfoVo.linkTargetType }/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jqpaginator.min.js"></script>
<title>${configInfoVo.configTypeName}-${topic.topicName}</title>
<script type="text/javascript">
var ctx = "${ctx}";
$(function(){
	loadList();
})

//文章列表展示
function showArticle(articleData,nowpage){
	var configTypeCode=$('#configTypeCode').val();
	$('#ARTICLE_LIST').html('');
	for(var i=0;i<articleData.rows.length;i++){
 		  var articleObj=articleData.rows[i];
		  var createDate=articleObj.createDate.substr(0,10);
		  var articleTitle=articleObj.articleTitle;
		  var articleUrl=ctx+"/subject/content?id="+articleObj.id+"&code=${configInfoVo.configTypeCode}";
		  var articleTitlePart="";
		  if(articleTitle.length>=30){
			  articleTitlePart=articleTitle.substr(0,30);
		  }else{
			  articleTitlePart=articleTitle;
		  }
		 $('#ARTICLE_LIST').append('<li><span>[2018-1-24]</span><a href="'+articleUrl+'" target="_blank" title="'+articleTitle+'">'+articleTitlePart+'</a></li>');  
	}	  
}

//根据栏目编码加载文章
function loadArticleByTopic(topicCode,page,rows){
	var articleData=null;
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/loadArticle',
		data:{
			topicCode:topicCode,
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

//加载列表
function loadList(){
	 var topicCode=$('#topicCode').val();
	 var articleData=loadArticleByTopic(topicCode,'1','10000');
	 //showArticle(articleData,1);
	 var sumcount=articleData.total==0?18:articleData.total;
	 
	 $("#lpage").jqPaginator({
		    totalCounts:sumcount,
		    pageSize:10,
		    visiblePages: 8,
		    currentPage: 1,
		    prev: '<a class="first" href="javascript:void(0);">&lt;上一页<\/a>',
		    next: '<a class="end" href="javascript:void(0);">下一页&gt;<\/a>',
		    page: '<a href="javascript:void(0);">{{page}}<\/a>',
		    onPageChange: function (n) {
		    	var articleData=loadArticleByTopic(topicCode,n,'10');
		   		showArticle(articleData,n);
		    }
		});
	 
}

</script>
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
            	  <li><a href="${ctx}/subject/list?code=${configInfoVo.configTypeCode}&topicCode=${topic.topicCode}" >${topic.topicName}</a></li>
            </c:forEach>
            </ul>
        </div>
    </div>
    <div class="layout m-crumb">
    	<input id="topicCode" value="${topic.topicCode}" type="hidden"/>
    	<input id="configTypeCode" value="${configInfoVo.configTypeCode}" type="hidden"/>
    	
        <a href="${ctx}/subject/index?code=${configInfoVo.configTypeCode}" >首页</a><span>&gt;</span><em>${topic.topicName}</em>
    </div>
    <div class="container clearfix nei_bg">
    	<div class="Ctitle clearfix"><div class="cur">${topic.topicName}</div></div>
        <ul class="listc clearfix" id="ARTICLE_LIST">
        	<%--
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
    		 --%>
    	</ul>
    	
    	<%--
        <div class="page" id="lpage">
            <a class="first">＜上一页</a>
            <a class="page-on">1</a><a href="#">2</a>
            <a href="#">3</a>
            <a class="end" href="#">下一页 &gt;</a>
        </div>
         --%>
        
        <div class="page pagination2" id="lpage">
			<a class="first">＜上一页</a>
			<a class="page-on">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<span>...</span>
			<a href="#">28</a>
			<a class="end" href="#">下一页 &gt;</a>
		</div>
        
    	
    </div>
    
    <div class="txlFoot">
        <div class="copyright">马鞍山公安局交警支队 联系电话：0555-2425010</div>
    </div>
</body>
</html>