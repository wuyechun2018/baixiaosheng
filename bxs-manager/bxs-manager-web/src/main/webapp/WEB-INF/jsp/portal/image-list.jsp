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
<script type="text/javascript" src="${ctx}/resources/portal/js/jqpaginator.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.bcat.bgswitcher.js"></script>
</head>

<!--[if lt IE 9]>
  <script src="${ctx}/resources/portal/js/html5.min.js"></script>
  <script src="${ctx}/resources/portal/jsrespond.min.js"></script>
<![endif]-->
<!--[if lt IE 10]>
    <script type="text/javascript"src="${ctx}/resources/portal/js/placeholder.min.js" charset="utf-8"></script>
<![endif]-->



<div class=" top_body">
	<div id="bg-body"></div>
    <script type="text/javascript">
    var ctx = "${ctx}";    
    var srcBgArray = [ctx+"/resources/portal/images/banner1.jpg",ctx+"/resources/portal/images/banner2.jpg",ctx+"/resources/portal/images/banner3.jpg"];

    
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
   
   function showArticle(dispDivId,articleData){
	    $('#'+dispDivId).html('');
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
  $('#bg-body').bcatBGSwitcher({
    urls: srcBgArray,
    alt: 'Full screen background image'
  });
  
  var topicCode=$('#topicCode').val();
  var tpzsData=loadArticleByTopic(topicCode,'1','10000','');
  showArticle(topicCode,tpzsData);
  var sumcount=tpzsData.total;
  
  $("#lpage").jqPaginator({
	    totalCounts:sumcount,
	    pageSize:21,
	    visiblePages: 8,
	    currentPage: 1,
	    prev: '<a class="first" href="javascript:void(0);">&lt;上一页<\/a>',
	    next: '<a class="end" href="javascript:void(0);">下一页&gt;<\/a>',
	    page: '<a href="javascript:void(0);">{{page}}<\/a>',
	    onPageChange: function (n) {
	    	var tpzsData=loadArticleByTopic(topicCode,n,'20');
	    	showArticle(topicCode,tpzsData);
	    }
	});
  
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
        <div class="dqwz">当前网站位置：<a href="${ctx}/portal/index"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="#"  title="图片新闻" class="CurrChnlCls">文章栏目</a></div>
    </div>
	
    
    <div class="neicontent">
    	<div class="nei_top">
    		<input id="topicCode" value="${topic.topicCode}" type="hidden"/>
        	<h1>图片新闻</h1>
            <div class="n_search fr" id="secrchBox1">
            	<form action="#" method="post" autocomplete="off" onsubmit="return check('secrchBox1')">
            	<div class="n_in fl">
                	<select name="type">
                    	<option value="0">请选择栏目</option>
                        <option value="0">综合要闻</option>
                        <option value="0">通知公告</option>
                        <option value="0">新闻资讯</option>
                        <option value="0">后台获取栏目</option>
                      
                    </select>
                </div>
            	<div class="n_in fl"><input type="text" class="key" name="keys" id="keys" placeholder="请输入关键字" /></div>
                <div class="n_in fl"><input type="submit" class="btn-search" value="" /></div>
                </form>
            </div>
        </div>
        
        <div class="picbox">
        	<ul class="qjhn-tu" id="TPZS">
			
				  <%--
				<li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li style=" margin-right:0px;">
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li style=" margin-right:0px;">
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li style=" margin-right:0px;">
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li>
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
                <li style=" margin-right:0px;">
                	<a target="_blank" title="贺龙故居" href="#">
					<span class="qjhn-img"><img src="images/1.jpg" width="320" height="210"></span>
					<span class="qjhn-ti">贺龙故居</span></a>
				</li>
				 --%>
				
			
			</ul>
        	
        
           <div class="page pagination2" id="lpage">
			<a class="first">＜上一页</a><a class="page-on">1</a><a href="#">2</a><a href="#">3</a><span>...</span><a href="#">28</a><a class="end" href="#">下一页 &gt;</a>
			</div>
       </div>
        
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
    