<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="${ctx}/resources/fan/images/sitaoke.ico" />
<link rel="icon" href="${ctx}/resources/fan/images/sitaoke.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--手机版设置-->
<meta http-equiv="X-UA-Compatible" content="IE=11">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--/手机版设置-->
<title>思淘客-Sitaoke.vip</title>
<link href="${ctx}/resources/fan/css/index.css" rel="stylesheet" />
<link href="${ctx}/resources/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="${ctx}/resources/fan/js/jquery-1.9.1.min.js"></script>



<style type="text/css">
.testclass{
   width:150px;
   height:150px;
   border: 1px solid #666; 
   padding: 5px; 
   position: absolute; 
   bottom: 0; right: 60px; 
   background:#fff;"
   z-index:9999;
}
.ui-more {
	line-height: 30px;
	display: block;
	text-align: center;
	padding: 10px 0 10px 0;
	padding-left: -90px;
	position: relative;
}
.ui-more:after{
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
var pageCount=1;
var ctx = "${ctx}";

function ChangeMyDivShow(imgObj){
    var divObj = document.getElementById(imgObj);
    //判断divObj的display的值
    if(divObj.style.display=="none"){
        divObj.style.display = "block";
    }else{
        divObj.style.display = "none";
    }
}


//右边，热门文章栏
function loadRightArticle(){
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/topPagerList',
		data:{
			page:1,
			rows:6
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	for(var i=0;i<data.rows.length;i++){
	    		var articleObj=data.rows[i];
	    		var articleTitle=articleObj.articleTitle;
	    		//栏目名称
	    		var topicName=articleObj.topicName;
	    		//作者
	    		var author=articleObj.author;
	    		//信息来源
	    		var newsfrom=articleObj.newsfrom;
	    		var articleImageUrl=articleObj.articleImageUrl;
	    		if(articleImageUrl==null||articleImageUrl==''){
	    			articleImageUrl=ctx+'/resources/fan/images/default.gif';
	    		}
	    		var articleUrl=ctx+"/fan/content/"+articleObj.id;
	    		//文章内容
	    		var aboutContent=articleObj.aboutContent==null?'':articleObj.aboutContent;
	    		var liHTML="<div class=\"right-post\" id=\"rightPost\">\n" +
	    			"        <a href=\""+articleUrl+"\" title=\""+articleTitle+"\" target=\"_blank\">\n" + 
	    			"          <div class=\"right-item\">"+topicName+"</div>\n" + 
	    			"          <div class=\"right-post-pic\" style=\"background: url("+articleImageUrl+") no-repeat center; background-size: cover;\"></div>\n" + 
	    			"          <h1 class=\"right-post-title\">"+articleTitle+"</h1>\n" + 
	    			"          <div class=\"right-post-date\">"+articleObj.createDate+"</div>\n" + 
	    			"        </a>\n" + 
	    			"      </div>";


		    	$('#postArticle').append(liHTML);
	    	}
	    		
	    }
	})
}

//加载文章
function loadArticle(page){
	//$('#dataUL').html();
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/pagerListOrderByCreateDate',
		data:{
			page:page,
			rows:5
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	for(var i=0;i<data.rows.length;i++){
	    		var articleObj=data.rows[i];
	    		var articleTitle=articleObj.articleTitle;
	    		//栏目名称
	    		var topicName=articleObj.topicName;
	    		//作者
	    		var author=articleObj.author;
	    		//信息来源
	    		var newsfrom=articleObj.newsfrom;
	    		var articleImageUrl=articleObj.articleImageUrl;
	    		if(articleImageUrl==null||articleImageUrl==''){
	    			articleImageUrl=ctx+'/resources/fan/images/default.gif';
	    		}
	    		var articleUrl=ctx+"/fan/content/"+articleObj.id;
	    		//文章内容
	    		var aboutContent=articleObj.aboutContent==null?'':articleObj.aboutContent;
	    		var liHTML="<li>\n" +
	    		"          <div class='left-post'>\n" + 
	    		"            <div class='new-item'>"+topicName+"</div>\n" + 
	    		"            <a href='"+articleUrl+"'\n" + 
	    		"              target='_blank' title='"+articleTitle+"'>\n" + 
	    		"              <div class='left-post-pic'\n" + 
	    		"                style='background: url("+articleImageUrl+") no-repeat center; background-size: cover;'></div>\n" + 
	    		"            </a>\n" + 
	    		"            <div class='left-post-info' style='position: relative;'>\n" + 
	    		"              <a href='"+articleUrl+"' target='_blank' title='"+articleTitle+"'>\n" + 
	    		"                <h1 class='left-post-title'>\n" + 
	    						articleTitle+
	    		"                </h1>\n" + 
	    		"                <div class='left-post-txt'>\n" + 
	    						aboutContent+
	    		"                </div>\n" + 
	    		"              </a>\n" + 
	    		"              <div class='left-post-note' style='margin-left: 0;'>\n" + 
	    		"                <div class='author'><span class='i-info'>作者:</span>"+author+"</div>\n" + 
	    		"              </div>\n" + 
	    		"              <div class='left-post-note' style='margin-left: 20;'>\n" + 
	    		"                <div class='author'><span class='i-info'>数据来源:</span>"+newsfrom+"</div>\n" + 
	    		"              </div>\n" + 
	    		"            </div>\n" + 
	    		"          </div>\n" + 
	    		"        </li>";
		    	$('#dataUL').append(liHTML);
	    	}
	    		
	    }
	})
}

//查看更多
function seeMore(){
	pageCount++;
	loadArticle(pageCount);
}

//根据类型编码查询链接
function loadLinkByTypeCode(linkTypeCode,page,rows){
	var linkData=null;
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/link/loadLinkByTypeCode',
		data:{
			linkTypeCode:linkTypeCode,
			page:page,
			rows:rows
		},
		async: false,
	    error: function(request) {
	        alert('系统正在升级，请联系管理员或稍后再试！');
	    },
	    success: function(data) {
	    	linkData=data;
	    }
	})
	return linkData;
}

//加载左边焦点图
function  loadFocImageLeft(){
	var focLeftData=loadLinkByTypeCode('FAN_FOC_LINK_LEFT',1,1);
	//只有一个大图
	if(focLeftData.rows.length>0){
		var linkObj=focLeftData.rows[0];
		var linkName=linkObj.linkName;
		var linkUrl=linkObj.linkUrl;
		var focImageLeftHTML=
			
			" <a href=\""+linkUrl+"\" title=\""+linkName+"\">\n" +
			"  <div class=\"focusimg_left\" style=\"background:url("+linkObj.linkImageUrl+"); background-size:cover;background-position:center;\">\n" + 
			"   <div class=\"title\">\n" + 
			"    <span>"+linkName+"</span>\n" + 
			"   </div>\n" + 
			"  </div>\n" + 
			"</a>";
		$('#foc_image_left').append(focImageLeftHTML);	
	}
}

//上线通知
function onlineNote(){
	alert('该功能正在开发中，敬请期待！');
}

//加载右边焦点图(右边四小图)
function loadFocImageRight(){
	//获取超链接数据
	var focRightData=loadLinkByTypeCode('FAN_FOC_LINK_RIGHT',1,4);
	var focImageRightHTML="";
	for(var i=0;i<focRightData.rows.length;i++){
		var linkObj=focRightData.rows[i]
		var linkName=linkObj.linkName;
		var linkUrl=linkObj.linkUrl;
		if(linkUrl=='#'){
			focImageRightHTML+=
				"  <a href=\"javascript:void(0)\" onclick=\"onlineNote()\" title=\""+linkName+"\" target=\"_blank\">\n" +
				"   <div class=\"right_list\" style=\"background:url("+linkObj.linkImageUrl+");background-size:cover;background-position:center;\">\n" + 
				"    <div class=\"title\">\n" + 
				"     <span>"+linkName+"</span>\n" + 
				"    </div>\n" + 
				"   </div>\n" + 
				"</a>";
		}else{
			focImageRightHTML+=
				"  <a href=\""+linkUrl+"\" title=\""+linkName+"\" target=\"_blank\">\n" +
				"   <div class=\"right_list\" style=\"background:url("+linkObj.linkImageUrl+");background-size:cover;background-position:center;\">\n" + 
				"    <div class=\"title\">\n" + 
				"     <span>"+linkName+"</span>\n" + 
				"    </div>\n" + 
				"   </div>\n" + 
				"</a>";
		}
		
	}
	$('#foc_image_right').append(focImageRightHTML);	
}

//页面加载
$(function(){
	//左边焦点大图
	loadFocImageLeft();
	//右边焦点四小图
	loadFocImageRight();
	//加载文章
	loadArticle(pageCount);
	//加载右边热点文章
	loadRightArticle();
})




</script>


</head>
<body>
	<!--头部-->
	<header class="header">
		<div class="header-info">
			<span class="logo-span">STK</span>
			<c:if test="${! empty userInfoVo}">
				<i class="fa fa-user-o" aria-hidden="true"></i>
				<a>${userInfoVo.loginName}</a>
			</c:if> 
			<!-- 
			<i class="fa fa-address-book-o" aria-hidden="true"></i>
			<a href="${ctx}/fan/register">注册</a>
			<i class="fa fa-commenting-o" aria-hidden="true"></i>
			<a href="${ctx}/fan/login">登录</a>  -->
			<i class="fa fa-commenting-o" aria-hidden="true"></i>
			<a href="${ctx}/stk/login">登录</a>
			<i class="fa fa-sign-out" aria-hidden="true"></i>
			<a href="${ctx}/stk/loginout">退出</a>
		</div>
		<a href="${ctx}/fan/index">
			<div class="logo"></div>
		</a> 
		<nav class="navlist">
			<ul>
				 <li class="on"><a href="${ctx}/fan/index">最新资讯</a></li>
			 	  <c:forEach items="${topicList}" var="topic" begin="0" end="4">
		           	  <li><a href="${ctx}/fan/list/${topic.topicCode}" >${topic.topicName}</a></li>
		          </c:forEach>
			</ul>
		</nav>

		<div class="head-right">
			<div class="search"></div>
		</div>
	</header>
	<!--头部-->
	
	<div class="clear"></div>
	
	<%-- --%>
	<section class="focusimg">
		<!--左侧大图-->
			<div id="foc_image_left"></div>
		<!--/左侧大图-->
		<!--右侧四图-->
			<div class="focusimg_right" id="foc_image_right"></div>
		<!--/右侧四图-->
		<div class="clear"></div>
	</section>
	
	
	

	<main class="main-left">
		<div class="ui-video-list">
			<ul id="dataUL">
				
			</ul>
			<a class="ui-more" onclick="seeMore()">查看更多</a>
		</div>
	</main>


	<main class="main-right">
		<div class="title">热门文章</div>
		<div id="postArticle">
			<%--
			<div class="right-post" id="rightPost">
				<a href="http://www.cfan.com.cn/2018/0327/130473.shtml" title="129元到底值不值？联想Watch 9智能手表评测" target="_blank">
					<div class="right-item">产品</div>
					<div class="right-post-pic" style="background: url(http://upload.cfan.com.cn/2018/0327/1522111502825.jpg) no-repeat center; background-size: cover;"></div>
					<h1 class="right-post-title">129元到底值不值？联想Watch 9智能手表评测</h1>
					<div class="right-post-date">2018-03-27 08:48</div>
				</a>
			</div>
			 --%>
		</div>
	</main>
	
	<div class="clear"></div>

	
	 
	 <jsp:include page="footer.jsp" flush="true">
		 <jsp:param value="${ctx}" name="ctxPath"/> 
	 </jsp:include>



</body>
</html>