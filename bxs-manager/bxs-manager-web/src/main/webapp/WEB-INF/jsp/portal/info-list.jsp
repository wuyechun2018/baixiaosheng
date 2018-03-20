<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="shortcut icon"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>马鞍山市交警支队</title>
<link href="${ctx}/resources/portal/css/css.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/nei.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.SuperSlide.2.1.1.js"></script>
</head>

<!--[if lt IE 10]>
    <script type="text/javascript"src="${ctx}/resources/portal/js/jquery.placeholder.min.js" charset="utf-8"></script>
    <script type="text/javascript">
			$(function(){
				$('input, textarea').placeholder();
			});
	</script>
<![endif]-->


<div class=" top_body">
	<div id="bg-body">
    	<ul>
			<%--默认 --%>
	    	 <c:if test="${empty backGroudImgList}">
	    	 		<li style="background:url(${ctx}/resources/portal/images/banner1.jpg) center center no-repeat;background-size:100% 100%;"></li>
					<li style="background:url(${ctx}/resources/portal/images/banner2.jpg) center center no-repeat;background-size:100% 100%;"></li>
					<li style="background:url(${ctx}/resources/portal/images/banner3.jpg) center center no-repeat;background-size:100% 100%;"></li>
			 </c:if>
			  <%--如果有值 --%>
			 <c:if test="${!empty backGroudImgList}">
			 		<c:forEach items="${backGroudImgList}" var="backGroudImg">
		    		 	<li style="background:url(${backGroudImg.configImageUrl}) center center no-repeat;background-size:100% 100%;"></li>
					 </c:forEach>
			 </c:if>
		</ul>
	</div>

    <script type="text/javascript">
			
		jQuery("#bg-body").slide({ mainCell:"ul", effect:"fold",  autoPlay:true, mouseOverStop:false });

	</script>
    <script type="text/javascript">
    var ctx = "${ctx}";    
    

    
   //根据栏目编码加载文章
    function loadArticleByTopic(topicCode,page,rows,isSytj){
    	var articleData=null;
    	$.ajax({
    		cache: true,
    		type: "POST",
    		url:'${ctx}/article/loadArticleByTopic',
    		data:{
    			articleType:'2',
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
   
   
   //根据栏目编码加载文章
    function loadRankInfo(statYear){
    	var articleData=null;
    	$.ajax({
    		cache: true,
    		type: "POST",
    		url:'${ctx}/infoRank/pagerList',
    		data:{
    			statYear:statYear,
    	    	page:1,
    	    	rows:100
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
   
   
   
    //加载信息排名
    function showRankInfo(rankData){
    	var infoTitleHTML="<dl class=\"xx_h\">\n" +
    		"                <dt class=\"xx_pm\">排名</dt>\n" + 
    		"                  <dt class=\"xx_bumen\">部门</dt>\n" + 
    		"                  <dt class=\"dt\">支队</dt>\n" + 
    		"                    <dt class=\"dt\">市局</dt>\n" + 
    		"                    <dt class=\"dt\">总队</dt>\n" + 
    		"                    <dt class=\"dt\">省厅</dt>\n" + 
    		"                    <dt class=\"dt\">部局</dt>\n" + 
    		"                </dl>\n" + 
    		"                <div class=\"clear_f\" id=\"rank-list\"></div>";

    	$('#rank-list').append(infoTitleHTML);
    	
    	for(var i=0;i<rankData.rows.length;i++){
    		 var rowData=rankData.rows[i];
    		 var xhClass="xx"+(i+1);
	    	 var infoHTML= "<dl class=\"xx_dd\">\n" +
	    		 "               <dt class=\"xx_pm\"><i class=\"red\">"+(i+1)+"</i></dt>\n" + 
	    		 "               <dt class=\"xx_bumen\">"+rowData.deptName+"<i class=\""+xhClass+"\"></i></dt>\n" + 
	    		 "               <dt class=\"dt\">"+rowData.zhidui+"</dt>\n" + 
	    		 "                 <dt class=\"dt\">"+rowData.shiju+"</dt>\n" + 
	    		 "                 <dt class=\"dt\">"+rowData.zongdui+"</dt>\n" + 
	    		 "                 <dt class=\"dt\">"+rowData.shengdui+"</dt>\n" + 
	    		 "                 <dt class=\"dt\">"+rowData.buju+"</dt>\n" + 
	    		 "             </dl>";
	   		 $('#rank-list').append(infoHTML);
      }
   }
   
   
   function showArticle(dispDivId,articleData){
    	for(var i=0;i<articleData.total;i++){
   		  var articleObj=articleData.rows[i];
		  var createDate=articleObj.createDate.substr(0,10);
		  var articleTitle=articleObj.articleTitle;
		  var articleUrl=ctx+"/portal/content?id="+articleObj.id;
		  var imageUrl=articleObj.contentImageUrl;
		  var articleTitlePart="";
		  if(articleTitle.length>=30){
			  articleTitlePart=articleTitle.substr(0,15);
		  }else{
			  articleTitlePart=articleTitle;
		  }
		  
		  var liHtml="<li>";
		  if((i+1)%3==0){
			  liHtml='<li style="margin-right:0px;">';
		  }
		  
		  var imageHtml=
			 liHtml +
      		'<a target="_blank" title="'+articleTitlePart+'" href="'+articleUrl+'">'+
			'<span class="qjhn-img"><img src="'+imageUrl+'" width="320" height="210"></span>'+
			'<span class="qjhn-ti">'+articleTitlePart+'</span></a>'+
		 '</li>';
		  
		 $('#'+dispDivId).append(imageHtml);
      }
    	
   }
    
$(document).ready(function() {
 //$('#bg-body').bcatBGSwitcher({
 //   urls: srcBgArray,
 //   alt: 'Full screen background image'
 // });
  
  var topicCode=$('#topicCode').val();
  //2018
  var today=new Date().getFullYear();
  var rankData=loadRankInfo(today);
  showRankInfo(rankData);
  
  
});
</script><!--end of bg-body script-->
<div class="container">
	<div class="header">
    	<div class="h_logo"><a href="#"><img src="${ctx}/resources/portal/images/logo.png" /></a></div>
    </div>
    
     <div class="navbox ">
    	<ul>
        	<li>
            	<dl>
            		<dt class="n_1"><a href="${ctx}/portal/index"><span>首页</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=ZHYW" target="_blank">综合要闻</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=LDDT" target="_blank">领导动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=TZ" target="_blank">通知公告</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=HYTZ" target="_blank">会议通知</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_2"><a href="#"><span>动态</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=GZDT" target="_blank">工作动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=XWGC" target="_blank">新闻观察</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=YJYP" target="_blank">预警研判</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=JWGC" target="_blank">警务观察</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_3"><a href="#"><span>阅览</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=ZDWJ" target="_blank">支队文件</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=ZDBB" target="_blank">值带班表</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=SJWJ" target="_blank">上级文件</a></dd>
                    <dd><a href="${ctx}/portal/sois/index" target="_blank">信息报送</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_4"><a href="#"><span>警务</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=JWSP" target="_blank">警务视频</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=DCYJ" target="_blank">调查研究</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=YQDT" target="_blank">舆情动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=GZJB" target="_blank">工作简报</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    
     <div class="nav-path">
        <div class="dqwz">当前网站位置：<a href="${ctx}/portal/index"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="#"  title="信息排名" class="CurrChnlCls">信息排名</a></div>
    </div>
	
     <div class="pmbox clearfix" id="rank-list">
			<%--
			<dl class="xx_h">
            		<dt class="xx_pm">排名</dt>
                	<dt class="xx_bumen">部门</dt>
                	<dt class="dt">支队</dt>
                    <dt class="dt">市局</dt>
                    <dt class="dt">总队</dt>
                    <dt class="dt">省厅</dt>
                    <dt class="dt">部局</dt>
                </dl>
                <div class="clear_f" ></div>
                <dl class="xx_dd">
                	<dt class="xx_pm"><i class="red">1</i></dt>
                	<dt class="xx_bumen">科技科<i class="xx1"></i></dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
                	<dt class="xx_pm"><i class="red">2</i></dt>
                	<dt class="xx_bumen">科技科<i class="xx2"></i></dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                
                <dl class="xx_dd">
                	<dt class="xx_pm"><i class="red">3</i></dt>
                	<dt class="xx_bumen">科技科<i class="xx3"></i></dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
               		<dt class="xx_pm"><i>4</i></dt>
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                 <dl class="xx_dd">
               		<dt class="xx_pm"><i>5</i></dt>
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                 <dl class="xx_dd">
               		<dt class="xx_pm"><i>6</i></dt>
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                 --%>
        </div>
    
    
</div>
</div>

<!--底部-->
<div class="footer mar10">
	<div class="container">
    	<div class="f_nav">
            <a href="javascript:void(0);" onclick="SetHome(this,'#');">加入收藏</a>
            <a href="javascript:void(0);" onclick="AddFavorite('我的网站',location.href)">设为首页</a>
            <a href="#">信息报送</a>
            <a href="#">旧版</a>
            <span>建议分辨率为1440*960</span>
            <span>浏览器IE8以上版本</span>
        </div>
        <div class="f_logo"></div>
        
        <div class="f_copyright">
        	联系电话：0555-2425010   邮编：243000     技术支持：山河网络
        </div>
    </div>
</div>


</body>
</html>
    