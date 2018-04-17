<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="shortcut icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>马鞍山市交警支队</title>
<link href="${ctx}/resources/portal/css/css.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/index.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/floatwin.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.cookie-1.4.1.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/common.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/piaofu.js"></script>
</head>


<!--[if lt IE 10]>
     <script type="text/javascript"src="${ctx}/resources/portal/js/jquery.placeholder.min.js" charset="utf-8"></script>
    <script type="text/javascript">
			$(function(){
				$('input, textarea').placeholder();
			});
</script>
<![endif]-->

<body>
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


<!--<div id="bg-body"></div>-->

<script type="text/javascript">
var ctx = "${ctx}";    
<!--var srcBgArray = [ctx+"/resources/portal/images/banner1.jpg",ctx+"/resources/portal/images/banner2.jpg",ctx+"/resources/portal/images/banner3.jpg"];-->

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
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	linkData=data;
	    }
	})
	return linkData;
}

//站内搜索点击查询
function doSearch(){
	var keys=$('#keys').val();
	keys=encodeURIComponent(encodeURIComponent(keys));
	location.href="${ctx}/portal/searchList?keys="+keys;
	
}


//根据栏目编码加载文章
function loadArticleByTopic(topicCode,page,rows,isSytj){
	var articleData=null;
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/loadMiniArticleByTopic',
		data:{
			topicCode:topicCode,
			//首页推荐
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


//根据栏目编码加载文章-所有的文章信息
function loadArticleAllInfoByTopic(topicCode,page,rows,isSytj){
	var articleData=null;
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/loadSytjArticle',
		data:{
			topicCode:topicCode,
			//首页推荐
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
function loadImageArticleByTopic(topicCode,page,rows,isSytj){
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
	    		$('#'+articleId).append('<span style="color:green;font-weight:bold;">&nbsp;&nbsp;已签收</span>');
	    	}else{
	    		$('#'+articleId).append('<span style="color:red;font-weight:bold;">&nbsp;&nbsp;签收</span>');
	    	}
	    }
	})
}



//加载文章（参数1：要显示的DIV的ID,参数2：要显示的文章数据）
function showArticle(dispDivId,articleData){
	for(var i=0;i<articleData.rows.length;i++){
		  if(i<8){
			  var articleObj=articleData.rows[i];
			  var titleLength=15;
			  if(articleObj.articleType=='5'||articleObj.articleType=='6'){
				  titleLength=12;
			  }
			  var createDate=articleObj.createDate.substr(0,10);
			  var articleTitle=articleObj.articleTitle;
			  var articleUrl=ctx+"/portal/content?id="+articleObj.id;
			  var articleTitlePart="";
			  //通知
			  if(dispDivId=='TZ'){
				  if(articleTitle.length>=30){
					  articleTitlePart=articleTitle.substr(0,15);
				  }else{
					  articleTitlePart=articleTitle;
				  }
				  $('#'+dispDivId).append('<li title="'+articleTitle+'"><a target="_blank" href="'+articleUrl+'" >'+articleTitlePart+'</a><span>'+createDate+'</span></li>');
			  }else if(dispDivId=='TPZS'){
			  //图片展示
			      var imageUrl=articleObj.contentImageUrl;
				  $('#'+dispDivId).append('<li><a target="_blank" href="'+articleUrl+'"><img src="'+imageUrl+'" /></a></li>');
			  }else if(dispDivId=='HYTZ'){
			  //会议通知 
				  if(articleTitle.length>=titleLength){
					  articleTitlePart=articleTitle.substr(0,titleLength);
				  }else{
					  articleTitlePart=articleTitle;
				  }
			      var html='<li><span>></span><a title="'+articleTitle+'" href="'+articleUrl+'">'+articleTitlePart+'</a></li>';
				  $('#'+dispDivId).append(html);
			  }else if(dispDivId=='GG'){
			  //公告	  
				   //$('#'+dispDivId).append(articleObj.articleContent);
				  //$('#'+dispDivId).append('<a href="'+articleUrl+'">'+articleObj.articleTitle+'</a>');
				 
			      var html='<li><span>></span><a title="'+articleTitle+'" href="'+articleUrl+'">'+articleObj.articleTitle+'</a></li>';
				  $('#'+dispDivId).append(html);
					jQuery(".ggBox").slide({mainCell:"ul",autoPlay:true,effect:"topMarquee",vis:3,interTime:80});
			  } else if(dispDivId=='ZHYW'||dispDivId=='LDDT'){
			  //综合要闻&&领导动态	  
				  if(articleTitle.length>=titleLength){
					  articleTitlePart=articleTitle.substr(0,titleLength);
				  }else{
					  articleTitlePart=articleTitle;
				  }
				  $('#'+dispDivId).append('<li><span class="date">'+createDate+'</span><a id="'+articleObj.id+'" target="_blank" href="'+articleUrl+'" title="'+articleTitle+'" >'+articleTitlePart+'</a></li>');
			  }else{
				//上级文件
			  	  var cDate=articleObj.createDate.substr(5,5);
				  if(articleTitle.length>=titleLength){
					  articleTitlePart=articleTitle.substr(0,titleLength);
				  }else{
					  articleTitlePart=articleTitle;
				  }
				  $('#'+dispDivId).append('<li><span class="date">'+cDate+'</span><a id="'+articleObj.id+'" target="_blank" href="'+articleUrl+'" title="'+articleTitle+'" >'+articleTitlePart+'</a></li>');
			  }
			  
			  //处理是否签收状态
			  if(articleObj.articleType=='5'||articleObj.articleType=='6'){
				  handleSignedStatus(articleObj.id);
			  }
			  
		  }
	  }
}

//加载当天的信息
function loadDayInfo(){
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/portal/getDayInfo',
		data:{
			
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	for(var i=0;i<3;i++){
	    		$('#DAYINFO').append('<li>'+data.msg+'</li>');
	    	}
			jQuery(".index_day").slide({mainCell:".bd ul",autoPlay:true,effect:"leftMarquee",vis:2,interTime:50});
	    }
	})
}

//加载一周的信息
function loadWeekDayInfo(){
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/portal/getWeekDayInfo',
		data:{
			
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	for(var i=0;i<data.length;i++){
	    		$('#DAYINFO').append('<li>'+data[i]+'</li>');
	    	}
		  jQuery(".index_day").slide({mainCell:".bd ul",autoPlay:true,effect:"leftMarquee",vis:2,interTime:50});
	    }
	})
}



//生日祝福
function loadSrzf(){
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/portal/getBirthdayUserList',
		data:{
			
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	for(var i=0;i<data.length;i++){
	    		$('#SRZF').append('<li>'+data[i]+'生日快乐</li>');
	    	}
	    	jQuery(".birthday").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:1});
	    }
	})
}

//展示超链接
function showLink(dispDivId,linkData){
	for(var i=0;i<linkData.rows.length;i++){
		var linkObj=linkData.rows[i]
		$('#'+dispDivId).append('<a href="'+linkObj.linkUrl+'" target="_blank" title="'+linkObj.linkName+'">'+linkObj.linkName+'</a>');
	}
	$('#'+dispDivId).append('<div class="clear_f"></div>');
}

//展示专题导航
function loadZtdh(){
	var ztdhData=loadLinkByTypeCode('ZTDH',1,6);
	for(var i=0;i<ztdhData.rows.length;i++){
		var linkObj=ztdhData.rows[i]
		var linkUrl='';
		var linkImageUrl='';
		if(linkObj&&linkObj.linkUrl){
			if(linkObj.linkUrl.indexOf('http')>-1){
				linkUrl=linkObj.linkUrl;
			}else{
				//如果不是包含"http"的绝对路径，则添加当前项目路径
				linkUrl=ctx+linkObj.linkUrl;
			}
		}
		var linkName=''
		if(linkObj&&linkObj.linkName){
			linkName=linkObj.linkName;
		}
		if(linkObj&&linkObj.linkImageUrl){
			linkImageUrl=linkObj.linkImageUrl;
		}
		
		var targetType="_blank";
		if(linkObj&&linkObj.linkTargetType){
			targetType=linkObj.linkTargetType;
		}
		$('#ZTDH').append('<li><a target="'+targetType+'" href="'+linkUrl+'" title="'+linkName+'" ><img src="'+linkImageUrl+'" /></a></li>');
	}
	jQuery(".index_zhuanti").slide({mainCell:"ul",autoPlay:true,effect:"leftMarquee",vis:4,interTime:50});

}

//展示底部导航
function showDh(){
	//全国公安导航,全国交警导航,省公安导航,省交警导航,本市公安导航，本市交警导航,支队机构导航
	var linkTypeCodeArray = ['QGGADH','QGJJDH','SGADH','SJJDH','BSGADH','BSJJDH','ZDJGDH'];
	for(var i=0;i<linkTypeCodeArray.length;i++){
		var linkData=loadLinkByTypeCode(linkTypeCodeArray[i],1,30);
		showLink(linkTypeCodeArray[i],linkData);
	}
	jQuery(".index_daohang").slide();
}

//展示快速通道
function loadKstd(){
	var kstdData=loadLinkByTypeCode('KSTD',1,8);
	for(var i=0;i<kstdData.rows.length;i++){
		var linkObj=kstdData.rows[i]
		var linkUrl='';
		var linkImageUrl='';
		if(linkObj&&linkObj.linkUrl){
			if(linkObj.linkUrl.indexOf('http')>-1){
				linkUrl=linkObj.linkUrl;
			}else{
				//如果不是包含"http"的绝对路径，则添加当前项目路径
				linkUrl=ctx+linkObj.linkUrl;
			}
		}
		var linkName=''
		if(linkObj&&linkObj.linkName){
			linkName=linkObj.linkName;
		}
		if(linkObj&&linkObj.linkImageUrl){
			linkImageUrl=linkObj.linkImageUrl;
		}
		
		$('#KSTD').append('<li><a href="'+linkUrl+'" title="'+linkName+'" ><img src="'+linkImageUrl+'" /></a></li>');
		//$('#KSTD').append('<li><a href="'+linkObj.linkUrl+'" target="_blank" title="'+linkObj.linkName+'">'+linkObj.linkName+'</a></li>');
	}
}

//加载 快速入口(快速导航)
function loadKsdh(){
	var kstdData=loadLinkByTypeCode('KSDH',1,8);
	for(var i=0;i<kstdData.rows.length;i++){
		var linkObj=kstdData.rows[i]
		var linkUrl='';
		var linkImageUrl='';
		if(linkObj&&linkObj.linkUrl){
			if(linkObj.linkUrl.indexOf('http')>-1){
				linkUrl=linkObj.linkUrl;
			}else{
				//如果不是包含"http"的绝对路径，则添加当前项目路径
				linkUrl=ctx+linkObj.linkUrl;
			}
		}
		var linkName=''
		if(linkObj&&linkObj.linkName){
			linkName=linkObj.linkName;
		}
		if(linkObj&&linkObj.linkImageUrl){
			linkImageUrl=linkObj.linkImageUrl;
		}
		$('#KSDH').append('<li><a href="'+linkUrl+'" title="'+linkName+'" ><img src="'+linkImageUrl+'" /></a></li>');
	}
}

//展示直达
function loadZD(){
	var zdData=loadLinkByTypeCode('ZD',1,4);
	for(var i=0;i<zdData.rows.length;i++){
		var linkObj=zdData.rows[i]
		$('#ZD').append('<a href="'+linkObj.linkUrl+'">'+linkObj.linkName+'</a>&nbsp;');
	}
}

//信息排名
function loadXxpm(){
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/infoRank/pagerList',
		data:{
			statYear:new Date().getFullYear(),
			showState:'1',
	    	page:1,
	    	rows:6
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	var infoTitleHTML=
	    		"<dl class=\"xx_h\">\n" +
	    		"            \t<dt class=\"xx_bumen\">部门</dt>\n" + 
	    		"            \t<dt class=\"dt\">支队</dt>\n" + 
	    		"                <dt class=\"dt\">市局</dt>\n" + 
	    		"                <dt class=\"dt\">总队</dt>\n" + 
	    		"                <dt class=\"dt\">省厅</dt>\n" + 
	    		"                <dt class=\"dt\">部局</dt>\n" + 
	    		"            </dl>\n" + 
	    		"            <div class=\"clear_f\"></div>";

    		$('#XXPM').append(infoTitleHTML);
    		
    		for(var i=0;i<data.rows.length;i++){
       		 var rowData=data.rows[i];
       		 var infoHTML="<dl class=\"xx_dd\">\n" +
				    		"                  <dt class=\"xx_bumen\">"+rowData.deptName+"</dt>\n" + 
				    		"                  <dt class=\"dt\">"+rowData.zhidui+"</dt>\n" + 
				    		"                    <dt class=\"dt\">"+rowData.shiju+"</dt>\n" + 
				    		"                    <dt class=\"dt\">"+rowData.zongdui+"</dt>\n" + 
				    		"                    <dt class=\"dt\">"+rowData.shengdui+"</dt>\n" + 
				    		"                    <dt class=\"dt\">"+rowData.buju+"</dt>\n" + 
				    		" </dl>";
       		$('#XXPM').append(infoHTML);
    		}
	    }
	})
}


//展示首页推荐轮播图
function showSytjArticle(articleData){
	for(var i=0;i<articleData.rows.length;i++){
		var articleObj=articleData.rows[i];
		var articleTitle=articleObj.articleTitle;
		var articleImageUrl=articleObj.articleImageUrl;
		var articleUrl=ctx+"/portal/content?id="+articleObj.id;
		var articleTitlePart="";
		
		if(articleTitle.length>=15){
			  articleTitlePart=articleTitle.substr(0,15);
		  }else{
			  articleTitlePart=articleTitle;
		  }
		
		$('#SYTJ_IMAGE').append('<li><a href="'+articleUrl+'" ><img src="'+articleImageUrl+'"/></a></li>');
		$('#SYTJ_TITLE').append('<li><a href="'+articleUrl+'" title="'+articleTitle+'">'+articleTitlePart+'</a></li>');

	}
	
	jQuery(".imageNews").slide({ titCell:".num li", mainCell:".pic",effect:"fold", autoPlay:true,trigger:"click",
		//下面startFun代码用于控制文字上下切换
		startFun:function(i){
			 jQuery(".imageNews .txt li").eq(i).animate({"bottom":0}).siblings().animate({"bottom":-36});
		}
	});
}

//加载飘窗
function loadFloatWin(){
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/floatWin/pagerList',
		data:{
			showState:'1'
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	if(data.rows.length>0){
	    		var floatWinHTML=
		    		"<div class=\"automv\">\n" +
		    		"  <a href=\"javascript:void(0)\" id=\"close_float_ad\" >\n" + 
		    		"    <img src='${ctx}/resources/portal/images/close.gif' title='"+data.rows[0].winName+"'>\n" + 
		    		"  </a>\n" + 
		    		"  <a href='"+data.rows[0].linkUrl+"' target='"+data.rows[0].linkTargetType+"' ><img src='"+data.rows[0].linkImageUrl+"' class=\"fpimg\"></a>\n" + 
		    		"</div>";

		    	$('body').append(floatWinHTML);
		        $('.automv').autoMove({angle:-Math.PI/4, speed:100});
		    	$('#close_float_ad').bind('click',function(){
		    		$('.automv').hide();
		    	});
	    	}
	    }
	    });
}


$(document).ready(function() {
  //$('#bg-body').bcatBGSwitcher({
  //  urls: srcBgArray,
  //  alt: 'Full screen background image'
  // });
  
  //加载天气情况
  loadWeekDayInfo();
  //加载生日祝福
  loadSrzf();
  //综合要闻
  var zhywData=loadArticleByTopic("ZHYW",'1','10','');
  showArticle('ZHYW',zhywData);
  //领导动态
  var lddtData=loadArticleByTopic("LDDT",'1','10','');
  showArticle('LDDT',lddtData);
  //首页推荐（ZHYW 中有首推标志的）
  var sytjData=loadArticleAllInfoByTopic("ZHYW",'1','5','1');
  showSytjArticle(sytjData);
  //通知
  var tzData=loadArticleByTopic("TZ",'1','3','');
  showArticle('TZ',tzData);
  jQuery(".tzgg").slide({mainCell:".tzggCon ul",autoPage:true,effect:"top",autoPlay:true,vis:1});

  //公告
  var ggData=loadArticleByTopic("GG",'1','3','');
  showArticle('GG',ggData);
  //会议通知(加载3条)
  var hhtzData=loadArticleByTopic("HYTZ",'1','3','');
  showArticle('HYTZ',hhtzData);
  //上级文件(加载10条)
  var sjwjData=loadArticleByTopic("SJWJ",'1','10','');
  showArticle('SJWJ',sjwjData);
  //支队文件(加载10条)
  var zdwjData=loadArticleByTopic("ZDWJ",'1','10','');
  showArticle('ZDWJ',zdwjData);
  //工作动态（加载10条）
  var gzdtData=loadArticleByTopic("GZDT",'1','10','');
  showArticle('GZDT',gzdtData);
  //图片展示（加载6条）
  var tpzsData=loadImageArticleByTopic("TPZS",'1','6','');
  showArticle('TPZS',tpzsData);
  jQuery(".index_tupian").slide({mainCell:"ul",autoPlay:true,effect:"leftMarquee",vis:4,interTime:50});
  
  //警务视频
   var jwspData=loadArticleByTopic("JWSP",'1','10','');
   showArticle('JWSP',jwspData);
   //队伍建设
   var dwjsData=loadArticleByTopic("DWJS",'1','10','');
   showArticle('DWJS',dwjsData);
   //党风廉政
   var dflzData=loadArticleByTopic("DFLZ",'1','10','');
   showArticle('DFLZ',dflzData);
  //调查研究
  var dcyjData=loadArticleByTopic("DCYJ",'1','10','');
  showArticle('DCYJ',dcyjData);
  //会议纪要
  var hyjyData=loadArticleByTopic("HYJY",'1','10','');
  showArticle('HYJY',hyjyData);
  
  //工作简报
  var gzjbData=loadArticleByTopic("GZJB",'1','10','');
  showArticle('GZJB',gzjbData);
  
  //工作指令
  var gzzlData=loadArticleByTopic("GZZL",'1','10','');
  showArticle('GZZL',gzzlData);
  
  //舆情动态
  var yqdtData=loadArticleByTopic("YQDT",'1','10','');
  showArticle('YQDT',yqdtData);
  
  //预警研判
  var yjypData=loadArticleByTopic("YJYP",'1','10','');
  showArticle('YJYP',yjypData);
  
  //每日情况
  var mrqkData=loadArticleByTopic("MRQK",'1','10','');
  showArticle('MRQK',mrqkData);
  
  //警务观察
  var jwgcData=loadArticleByTopic("JWGC",'1','10','');
  showArticle('JWGC',jwgcData);
  
  //道路建设管理(加载10条)
  var dljsglData=loadArticleByTopic("DLJSGL",'1','10','');
  showArticle('DLJSGL',dljsglData);
  
  //警坛文苑(加载10条)
  var jtwyData=loadArticleByTopic("JTWY",'1','10','');
  showArticle('JTWY',jtwyData);
  
  //新闻资讯(加载10条)
  var xwzxData=loadArticleByTopic("XWZX",'1','10','');
  showArticle('XWZX',xwzxData);
  
  //加载底部导航
  showDh();
  
  //快速通道
  loadKstd();
  
  //快速入口,又叫快速导航
  loadKsdh();
  
  //专题导航
  loadZtdh();
  
  //信息排名
  loadXxpm();
  
  //直达
  loadZD();
  
  //加载飘窗
  loadFloatWin();
  
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
    <!--通知开始-->
    <div class="tongzhiBox">
    	<div class="tzgg"><b>通知：</b>
        	<div class="tzggCon" >
                <ul id="TZ">
                	<%--
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度1<span>[2017-12-12]</span></li>
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度2<span>[2017-12-12]</span></li>
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度3<span>[2017-12-12]</span></li>
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度4<span>[2017-12-12]</span></li>
                     --%>
                </ul>

      		</div>
       </div>
       <%--
       <script type="text/javascript">
		jQuery(".tzgg").slide({mainCell:".tzggCon ul",autoPage:true,effect:"top",autoPlay:true,vis:1});
		</script> 
		--%>
        <div class="index_day">
        	<div class="bd">
				<ul class="infoList" id="DAYINFO">
					<%--
                    <li>2017年5月12日  星期二  小雪</li>
                    <li>2017年5月12日  星期二  小雪</li>
                    <li>2017年5月12日  星期二  小雪</li>
					 --%>
				</ul>
			</div>
        </div>
        
        <script type="text/javascript">
		</script>
        
    </div>
    <!--通知结束-->
<div class="indexbody">  
    <div class="zt1 pad10">
    	 <%--默认 --%>
    	 <c:if test="${empty topicImageUrlF}">
    	 	<a href="#"><img src="${ctx}/resources/portal/images/zt1.jpg" /></a>
		 </c:if>
		  <%--如果有值 --%>
		 <c:if test="${!empty topicImageUrlF}">
		 	<a href="#"><img src="${topicImageUrlF.configImageUrl }" /></a>
		 </c:if>	
    </div>
    
    <div class="index1 mar10">
    	<div class="imageNews fl">
    		<%--首页推荐 --%>
        	<ul class="pic" id="SYTJ_IMAGE">
        			<%--
					<li><a href="#" ><img src="${ctx}/resources/portal/images/1.jpg"/></a></li>
					<li><a href="#" ><img src="${ctx}/resources/portal/images/banner1.jpg"/></a></li>
					 --%>
					
			</ul>
			<div class="txt-bg"></div>
			<div class="txt">
				<ul id="SYTJ_TITLE">
					<%--
					<li><a href="#">公安局交警支队送温暖活动</a></li>
					<li><a href="#">公安局交警支队送温暖活动2</a></li>
                    <li><a href="#">公安局交警支队送温暖活动3</a></li>
                    <li><a href="#">公安局交警支队送温暖活动4</a></li>
					 --%>
				</ul>
			</div>

			<ul class="num">
				<li><a>1</a><span></span></li>
				<li><a>2</a><span></span></li>
                <li><a>3</a><span></span></li>
                <li><a>4</a><span></span></li>
				
			</ul>
        </div>
    
    <div class="index1News fl ml10">
    	<div class="zhywNews">
        	<div class="hd">
				<ul><li id="lg1" class="on">综合要闻</li><li id="lg2">领导动态</li></ul>
			</div>
			<div class="bd">
				<ul id="ZHYW">
					<%--
					<li><span class="date">2011-11-11</span><a href="#" >中国打破了世界软件巨头规则</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >口语：会说中文就能说英语！</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >农场摘菜不如在线学外语好玩</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >数理化老师竟也看学习资料？</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >学英语送ipad2,45天突破听说</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >学外语，上北外！</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >那些无法理解的荒唐事</a></li>
                    <li><span class="date">2011-11-11</span><a href="#" >那些无法理解的荒唐事</a></li>
                     --%>
				</ul>
				<ul id="LDDT" style="display:none;">
					<%--
					<li><span class="date">2011-11-11</span><a href="#" >名师教作文：３妙招巧写高分</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >耶鲁小子：教你备考SAT</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >施强：高端专业语言教学</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >数理化老师竟也看学习资料？</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >【推荐】名校英语方法曝光！</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >2012高考“考点”大曝光!!</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >涨价仍爆棚假日旅游冰火两重天</a></li>
                    <li><span class="date">2011-11-11</span><a href="#" >涨价仍爆棚假日旅游冰火两重天</a></li>
                      --%>
				</ul>
				
			</div>
        </div>
        
        <script type="text/javascript">
        	$('#lg1').hover(function () {  
                $("#lg2").removeClass("on");//清空liCSS属性  
                $(this).addClass('on');//选中li添加属性
				$(this).parent().parent().css('background','url(${ctx}/resources/portal/images/1.png)');  
                $("#ZHYW").css("display", "block");  
                $("#LDDT").css("display", "none");  
               
            });  
            $('#lg2').hover(function () {  
                $("#lg1").removeClass("on");//清空liCSS属性  
                $(this).addClass('on');//选中li添加属性 
				$(this).parent().parent().css('background','url(${ctx}/resources/portal/images/2.png)');  
                $("#ZHYW").css("display", "none");  
                $("#LDDT").css("display", "block");  
                
            });  

        </script>
        
        
    </div>
    <!--通知模块开始-->
    <div class="zhongzhiBox fr">
    	<div class="h_titleBox">
    		<h1 >
    			公告
    			<a target="_blank" style="color:#f1efef" href="${ctx}/portal/list?topicCode=GG" class="imore">更多>></a>
    		</h1>
    	</div>
        <div class="ggBox">
       	 <%--
        	<marquee id="GG" direction="up" scrollamount="2" loop="-1" height="75px">
        		公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告
            公告公告公告公告公告公告公告
        	 
            </marquee>--%>
            <ul id="GG"></ul>
        </div>
        <div class="h_titleBox">
           <h1>
           		会议通知
           	 <a target="_blank" style="color:#f1efef" href="${ctx}/portal/list?topicCode=HYTZ" class="imore">更多>></a>
           </h1>
        </div>
        <div class="hyBox">
        	<ul id="HYTZ">
        	   <%--
            	<li><span>></span><a href="#">会议通知撒大苏打撒</a></li>
                <li><span>></span><a href="#">会议通知撒大苏打撒</a></li>
                <li><span>></span><a href="#">会议通知撒大苏打撒</a></li>
                 --%>
            </ul>
        </div>
        <div class="birthday">
			<div class="bd">
				<ul class="infoList" id="SRZF">
					<%--
					<li>王XX生日快乐</li>
                    <li>吴XX生日快乐</li>
                    <li>李XX生日快乐</li>
                    <li>胡XX生日快乐</li>
                     --%>
				</ul>
			</div>
        </div>
        
        <script type="text/javascript">
		
		</script>
        
        
    </div>
    <!--通知模块结束-->
    <div class="clear_f"></div>
    </div>
    
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>上级文件</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=SJWJ" class="fr more">更多>></a>
            </div>
            <ul id="SJWJ">
               <%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>支队文件</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=ZDWJ" class="fr more">更多>></a>
            </div>
            <ul id="ZDWJ">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>工作动态</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=GZDT" class="fr more">更多>></a>
            </div>
            <ul id="GZDT">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
              --%>
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <!--快速入口开始,又叫快速导航-->
    <div class="index3 mar10">
    	<div class="ksrk_i"></div>
        <div class="ksrk_more"><a href="${ctx}/portal/system-list" target="_blank">更多系统</a></div>
        <ul class="ksrkBox" id="KSDH">
        	<%--
        	<li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
             --%>
        </ul>
        <div class="clear_f"></div>
    </div>
    <!--快速入口结束-->
    <!--搜索开始-->
    <div class="index_searchBox mar10">
    	<div class="seachBox fl" id="secrchBox">
        	<div class="s_tit fl">站内搜索</div>
        	<form action="#" method="post" autocomplete="off" onsubmit="return check('secrchBox')">
            	<div class="s1 fl"><input type="text" name="keys" id="keys" class="index_s" placeholder="请输入关键字" /></div>
                <div class="s1 fl"><input type="button" class="index_submit" value="搜索"  onclick="doSearch()"/></div>
            </form>
        </div>
        
        <div class="s_link fl" id="ZD">
        	<%--
        	<a href="#">部局直达</a>
            <a href="#">总队直达</a>
            <a href="#">市局直达</a>
            <a href="#">省厅直达</a>
             --%>
        </div>
    </div>
    <!--搜索结束-->
    
    
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>警务视频</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=JWSP" class="fr more">更多>></a>
            </div>
            <ul id="JWSP">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                 --%>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>队伍建设</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=DWJS" class="fr more">更多>></a>
            </div>
            <ul id="DWJS">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                 --%>
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>党风廉政</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=DFLZ" class="fr more">更多>></a>
            </div>
            <ul id="DFLZ">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <div class="zt1 pad10">
    	 <%--默认 --%>
    	 <c:if test="${empty topicImageUrlS}">
    	 	<a href="#"><img src="${ctx}/resources/portal/images/zt2.jpg" /></a>
		 </c:if>
		  <%--如果有值 --%>
		 <c:if test="${!empty topicImageUrlS}">
		 	<a href="#"><img src="${topicImageUrlS.configImageUrl}" /></a>
		 </c:if>	
    </div>
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>会议纪要</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=HYJY" class="fr more">更多>></a>
            </div>
            <ul id="HYJY">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                 --%>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>调查研究</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=DCYJ" class="fr more">更多>></a>
            </div>
            <ul id="DCYJ">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                 --%>
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>工作简报</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=GZJB" class="fr more">更多>></a>
            </div>
            <ul id="GZJB"> 
               <%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <!--快速通道开始-->
    <div class="kstdBox mar10">
    	<ul id="KSTD">
    		<%--
        	<li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
             --%>
        </ul>
        <div class="clear_f"></div>
    </div>
    
    <!--快速通道结束-->
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>工作指令</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=GZZL" class="fr more">更多>></a>
            </div>
            <ul id="GZZL">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
            	 --%>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>舆情动态</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=YQDT" class="fr more">更多>></a>
            </div>
            <ul id="YQDT">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
            	 --%>
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>预警研判</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=YJYP" class="fr more">更多>></a>
            </div>
            <ul id="YJYP">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    <%--专题导航 --%>
    <div class="index_zhuanti mar10">
    	<ul class="picList" id="ZTDH">
    		<%--
        	<li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
        	--%>
        </ul>
    </div>
    
    <%--
    <script type="text/javascript">
		jQuery(".index_zhuanti").slide({mainCell:"ul",autoPlay:true,effect:"leftMarquee",vis:4,interTime:50});
	</script> 
	--%>
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>每日情况</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=MRQK" class="fr more">更多>></a>
            </div>
            <ul id="MRQK">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                 --%>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>警务观察</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=JWGC" class="fr more">更多>></a>
            </div>
            <ul id="JWGC">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                 --%>
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>道路建设管理</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=DLJSGL" class="fr more">更多>></a>
            </div>
            <ul id="DLJSGL">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>警坛文苑</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=JTWY" class="fr more">更多>></a>
            </div>
            <ul id="JTWY">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                 --%>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>新闻资讯</h1>
                <a target="_blank" href="${ctx}/portal/list?topicCode=XWZX" class="fr more">更多>></a>
            </div>
            <ul id="XWZX">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="xxpmBox fr">
        	<div class="xx_tit">
            	<h1>信息排名</h1>
                <a href="${ctx}/portal/info-list" target="_blank" class="fr more">更多排名>></a>
            </div>
            <div class="xx_bg" id="XXPM">
            	<%--
            	<dl class="xx_h">
                	<dt class="xx_bumen">部门</dt>
                	<dt class="dt">支队</dt>
                    <dt class="dt">市局</dt>
                    <dt class="dt">总队</dt>
                    <dt class="dt">省厅</dt>
                    <dt class="dt">部局</dt>
                </dl>
                <div class="clear_f"></div>
                <dl class="xx_dd">
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
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
        <div class="clear_f"></div>
    </div>
    
    <!--图片展示开始-->
    <div class="index_tupian mar10">
    	<div class="tp_title">
        	<h1>图片展示</h1>
            <a target="_blank" href="${ctx}/portal/image-list?topicCode=TPZS" class="more">查看更多>></a>
             <div class="clear_f"></div>
        </div>
        <div class="tp_bg">
            <ul id="TPZS">
            	<%--
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                 --%>
            </ul>
        </div>
         <div class="clear_f"></div>
    </div>
    <script type="text/javascript">
		
	</script>
    <!--图片展示结束-->
    
    <!--网站导航开始-->
    <div class="index_daohang">
      <div class="i_daohang_title bot10">
        <h1>公安网站导航</h1>
        
        <div class="hd">
          <ul>
              <li>全国公安导航</li>
              <li>全国交警导航</li>
              <li>省公安导航</li>
              <li>省交警导航</li>
              <li>本市公安导航</li>
              <li>本市交警导航</li>
              <li>支队机构导航</li>
          </ul>
		</div>
        
      </div>
      <div class="bd" id="DH">
        <div class="dh_db" id="QGGADH" >
        	<%--
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <div class="clear_f"></div>
             --%>
        </div>
         <div class="dh_db" id="QGJJDH">
         <%--
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
             --%>
        </div>
         <div class="dh_db" id="SGADH">
           <%--
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
             --%>
        </div>
         <div class="dh_db" id="SJJDH">
           <%--
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
             --%>
        </div>
         <div class="dh_db" id="BSGADH">
           <%--
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
             --%>
        </div>
         <div class="dh_db" id="BSJJDH">
           <%--
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
             --%>
        </div>
         <div class="dh_db" id="ZDJGDH">
           <%--
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
             --%>
        </div>
        
        
        
        
        
    </div>
        
      
      
        
    </div>
    
    <script type="text/javascript">jQuery(".index_daohang").slide();</script>
    <!--网站导航结束-->
    
    
  </div>
</div>
</div>
<div class="clear_f"></div>
<!--底部-->
<div class="footer mar10">
	<div class="container">
    	<div class="f_nav">
            <a href="javascript:void(0);" onclick="SetHome(this,'#');">加入收藏</a>
            <a href="javascript:void(0);" onclick="AddFavorite('我的网站',location.href)">设为首页</a>
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
<script type="text/JavaScript">
var isShow=$.cookie('isShow');
if(isShow=='1'){
	//doNothing
}else{
	$.ajax({
			cache: true,
			type: "POST",
			url:'${ctx}/article/loadArticle',
			data:{
				topicCode:'GG',
				popState:'1',
				page:1,
				rows:3
			},
			async: false,
		    error: function(request) {
		       
		    },
		    success: function(data) {
		    	for(var i=0;i<data.rows.length;i++){
		    		var dataObj=data.rows[i];
		    		var top=i*100;
		    		var left=i*20;
			    	window.open ('${ctx}/portal/popmsg?id='+dataObj.id,'公告'+i,'height=500,width=700,top='+top+',left='+left+',toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
		    	}
		    }
		})
	
	var now = new Date();
	//10秒 10*1000
	//暂时定制为15秒
	now.setTime(now.getTime()+5*60*1000);
	$.cookie('isShow', '1', { expires: now});
}
</script>

<!-- 飘窗元素 -->
<%--
<div class="automv">
	<a href="javascript:void(0)" id="close_float_ad" >
		<img src="${ctx}/resources/portal/images/close.gif">
	</a>
	<a href="#"><img src="${ctx}/resources/portal/images/pf1.jpg" class="fpimg"></a>
</div>
 --%>

</body>
</html>