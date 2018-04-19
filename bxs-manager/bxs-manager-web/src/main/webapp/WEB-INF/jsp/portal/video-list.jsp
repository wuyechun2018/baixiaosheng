<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="shortcut icon"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${topic.topicName}-马鞍山市交警支队</title>
<link href="${ctx}/resources/portal/css/css.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/nei-v2.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/shipin.css" rel="stylesheet" />


<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jqpaginator.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.highlight-3.4.0.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.SuperSlide.2.1.1.js"></script>

<!--[if lt IE 10]>
    <script type="text/javascript"src="${ctx}/resources/portal/js/jquery.placeholder.min.js" charset="utf-8"></script>
    <script type="text/javascript">
			$(function(){
				$('input, textarea').placeholder();
			});
	</script>
<![endif]-->

<style type="text/css">

.cdateSpan{
	float: right;
    color: #999;
    font-size: 14px;
}

.pagination2 {
    height: 30px;
}

.highlight{
background:#FF0;
color:#E00;
}


.pagination2 a:HOVER {
    text-decoration: none;
}

.pagination2 .active {
    background: #1061bc;
    color: #fff;
}



</style>

</head>

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
    function loadArticleByTopic(topicCode,page,rows,isSytj,keys){
    	var articleData=null;
    	$.ajax({
    		cache: true,
    		type: "POST",
    		//url:'${ctx}/article/loadArticleForOpt',
    		url:'${ctx}/article/loadArticleByTopicForVideo',
    		data:{
    			articleTitle:keys,
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
   
   //自定义高亮
   function myHighlight(srcStr,keyword){
	   var htmlReg = new RegExp(keyword, "ig");
	   var tarStr=srcStr.replace(htmlReg,"<span style='color:#E00;font-size:14px;'>"+keyword+"</span>")
  	   return tarStr;
   }
   
 //处理是否签收状态
   function handleSignedStatus(articleId){
   	$.ajax({
   		cache: true,
   		type: "POST",
   		url:'${ctx}/portal/isAllSigned',
   		data:{
   			articleId:articleId
   		},
   		async: false,
   	    error: function(request) {
   	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
   	    },
   	    success: function(data) {
   	    	if(data.success){
   	    		$('#'+articleId).append('<span style="color:green;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;已签收</span>');
   	    	}else{
   	    		$('#'+articleId).append('<span style="color:red;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;签收</span>');
   	    	}
   	    }
   	})
   }
   
   function showArticle(dispDivId,articleData,nowpage){
	   $('#'+dispDivId).html('');
	    var ulId="";
	    var count=0;
	    var sumCount=Math.ceil(articleData.rows.length/6) ;
    	for(var i=0;i<articleData.rows.length;i++){
   		  var articleObj=articleData.rows[i];
		  var createDate=articleObj.createDate.substr(0,10);
		  var articleTitle=articleObj.articleTitle;
		  var publishMedia=articleObj.publishMedia;
		  if(publishMedia==null||publishMedia==''){
			  publishMedia='无数据';
		  }
		  var articleUrl=ctx+"/portal/content?id="+articleObj.id;
		  var articleTitlePart="";
		  if(articleTitle.length>=30){
			  articleTitlePart=articleTitle.substr(0,30);
		  }else{
			  articleTitlePart=articleTitle;
		  }
		 
		  if(i%4==0){
			  ulId=dispDivId+"-"+count;
			  $('#'+dispDivId).append('<ul id="'+ulId+'">');
		  }
		  
		  var liHTML=  "<li>\n" +
			  "                  <div class=\"sp_img\"><a href=\""+articleUrl+"\" target=\"_blank\"><img src=\""+articleObj.articleImageUrl+"\" /></a></div>\n" + 
			  "                    <div class=\"sp_txt\">\n" + 
			  "                      <p class=\"sp1_title\"><a href=\""+articleUrl+"\" target=\"_blank\">"+articleTitlePart+"</a></p>\n" + 
			  "                        <p>发布媒体："+publishMedia+"</p>\n" + 
			  "                        <p>上传时间："+createDate+"</p>\n" + 
			  "                    </div>\n" + 
			  "                </li>";

		 
		  $('#'+ulId).append(liHTML);
		  
		  if((i+1)%4==0){
			  $('#'+dispDivId).append('</ul>');
			  count++;
		  }
		   
      }
    	
   }
   

//高亮显示   
function highlightshow(keys){
     if(keys.length > 0) { 
         //$('#ATICLE_LIST').removeHighlight();
         $('#ATICLE_LIST').unhighlight();
         $('#ATICLE_LIST').highlight(keys);
         //$(".highlight").css({ backgroundColor: "#FFFF88" });
     }
}   
   
   
//查询   
function doSearch(){
	var text=$("#topicTypeCombobox").find("option:selected").text();
	var value=$("#topicTypeCombobox").val();
	var keys=$("#keys").val();
	$('#topicCode').val(value);
	$('#span_topicName').html(text);
	$('#h1_topicName').html(text);
	loadList(keys);
	//highlightshow(keys);
} 

//加载查询框的下拉列表
function loadTopic(){
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/topic/getListByPid?pid=1',
		data:{
			
		},
		async: false,
	    error: function(request) {
	        
	    },
	    success: function(data) {
	      $('#topicTypeCombobox').append('<option value="1">请选择栏目</option>');
    	  for(var i=0;i<data.length;i++){
	    	  var topicObj=data[i];
	    	  $('#topicTypeCombobox').append('<option value="'+topicObj.attributes.topicCode+'">'+topicObj.text+'</option>');
	      }
	    }
	}) 
}

 
//加载列表
function loadList(keys){
	 var topicCode=$('#topicCode').val();
	 var articleData=loadArticleByTopic(topicCode,'1','10000','',keys);
	 //showArticle('ATICLE_LIST',articleData,1);
	 var sumcount=articleData.rows.length;
	 if(sumcount==0){
		 sumcount=12;
	 }
	 if(sumcount<12){
		 sumcount=12;
	 }
	 
	 $("#lpage").jqPaginator({
		    totalCounts:sumcount,
		    pageSize:12,
		    visiblePages: Math.ceil(sumcount/12),
		    currentPage: 1,
		    prev: '<a class="first" href="javascript:void(0);">&lt;上一页<\/a>',
		    next: '<a class="end" href="javascript:void(0);">下一页&gt;<\/a>',
		    page: '<a href="javascript:void(0);">{{page}}<\/a>',
		    onPageChange: function (n) {
		    	var articleData=loadArticleByTopic(topicCode,n,'12','',keys);
		   		showArticle('ATICLE_LIST',articleData,n);
		   		//高亮
		   		//highlightshow(keys);
		    }
		});
	 
}
    
$(document).ready(function() {
  
  var searchkey='${keys}';
  if(searchkey){
	$('keys').val(searchkey); 
	loadList(searchkey);
	highlightshow(searchkey);
  }else{
	loadList('');
  }
  loadTopic();
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
    	<c:if test="${empty keys}">
        <div class="dqwz">当前网站位置：<a href="${ctx}/portal/index"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="${ctx}/portal/list?topicCode=${topic.topicCode}"  title="${topic.topicName}" class="CurrChnlCls"><span id="span_topicName">${topic.topicName}</span></a></div>
    	</c:if>
    	
    	<c:if test="${!empty keys}">
        <div class="dqwz">当前网站位置：<a href="${ctx}/portal/index"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<span id="span_topicName">搜索-<span style="color:red;">${keys}</span></span></div>
    	</c:if>
    </div>
<div class="neicontent">
    	<div class="nei_top">
    		<c:if test="${empty keys}">
       		 	<input id="topicCode" value="${topic.topicCode}" type="hidden"/>
        		<h1 id="h1_topicName">${topic.topicName}</h1>
    	</c:if>
    	
    	<c:if test="${!empty keys}">
      			<input id="topicCode" value="${topic.topicCode}" type="hidden"/>
        		<h1 id="h1_topicName">搜索列表</h1>
    	</c:if>
    	
    		
            <div class="n_search fr" id="secrchBox1">
            	<form action="#" method="post" autocomplete="off" onsubmit="return check('secrchBox1')">
            	<div class="n_in fl">
                	<select name="type" id="topicTypeCombobox">
                		<%--
                    	<option value="0">请选择栏目</option>
                        <option value="0">综合要闻</option>
                        <option value="0">通知公告</option>
                        <option value="0">新闻资讯</option>
                        <option value="0">后台获取栏目</option>
                       --%>
                    </select>
                </div>
            	<div class="n_in fl"><input type="text" class="key" name="keys" id="keys" placeholder="请输入关键字" /></div>
                <div class="n_in fl"><input type="button" class="btn-search" onclick="doSearch()" /></div>
                </form>
            </div>
        </div>
        
        <%--
        <div class="listbox" >
        	<div id="ATICLE_LIST" >
			</div>
			<div class="page pagination2" id="lpage">
			<a class="first">＜上一页</a><a class="page-on">1</a><a href="#">2</a><a href="#">3</a><span>...</span><a href="#">28</a><a class="end" href="#">下一页 &gt;</a>
			</div>
		</div>
		 --%>
		 
		 <!-- 视频列表 -->
        <div class="shipinbox" >
        <!-- 
			<ul>
            	<li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>

			</ul>
            <ul>
            	<li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>

			</ul>
            <ul>
            	<li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
                <li>
                	<div class="sp_img"><a href="#" target="_blank"><img src="images/1.jpg" /></a></div>
                    <div class="sp_txt">
                    	<p class="sp1_title"><a href="#" target="_blank">马鞍山交警支队视频标题</a></p>
                        <p>发布媒体：中央电视台</p>
                        <p>上传时间：2018-4-17</p>
                    </div>
                </li>
				</ul>
            </div> -->
            
            <div id="ATICLE_LIST"></div>
            
            
              <div class="page pagination2" id="lpage">
			<a class="first">＜上一页</a><a class="page-on">1</a><a href="#">2</a><a href="#">3</a><span>...</span><a href="#">28</a><a class="end" href="#">下一页 &gt;</a>
			</div>
        
</div>
    
    
</div>
</div>

<%--
<style>
.page span{
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	float: left;
	color: #00679d;
	font-size: 16px;
}
</style>
 --%>
<!--底部-->
<div class="footer mar10">
	<div class="container">
    	<div class="f_nav">
            <a href="javascript:void(0);" onclick="SetHome(this,'#');">加入收藏</a>
            <a href="javascript:void(0);" onclick="AddFavorite('我的网站',location.href)">设为首页</a>
            <a href="${ctx}/sois/index">信息报送</a>
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
