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
<%-- --%>
<link rel="stylesheet" href="${ctx}/resources/js-lib/layui/css/layui.css">
<link href="${ctx}/resources/portal/css/cssm.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/nei.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.highlight-3.4.0.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.bcat.bgswitcher.js"></script>

<style type="text/css">
.highlight{
background:#FF0;
color:#E00;
}

select{
	font-family:Arial;
	font-size:13.3333px;
}


</style>

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
    function loadArticleByTopic(topicCode,page,rows,isSytj,keys){
    	var articleData=null;
    	$.ajax({
    		cache: true,
    		type: "POST",
    		url:'${ctx}/article/loadArticle',
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
   
   function showArticle(dispDivId,articleData){
	    var ulId="";
	    var count=0;
	    var sumCount=Math.ceil(articleData.rows.length/6) ;
    	for(var i=0;i<articleData.rows.length;i++){
   		  var articleObj=articleData.rows[i];
		  var createDate=articleObj.createDate.substr(0,10);
		  var articleTitle=articleObj.articleTitle;
		  var articleUrl=ctx+"/portal/content?id="+articleObj.id;
		  var articleTitlePart="";
		  if(articleTitle.length>=30){
			  articleTitlePart=articleTitle.substr(0,30);
		  }else{
			  articleTitlePart=articleTitle;
		  }
	   	  if(i%6==0){
		   		    count++;
		   			ulId=dispDivId+"-"+count
		   			if(count==sumCount){
		   				$('#'+dispDivId).append('<ul  style="border-bottom: inherit;" id='+ulId+'><li><a target="_blank" href="'+articleUrl+'" title="'+articleTitle+'"><i></i>'+articleTitlePart+'</a><em></em><span>'+createDate+'</span></li>');	
		   			}else{
		   				$('#'+dispDivId).append('<ul  id='+ulId+'><li><a target="_blank" href="'+articleUrl+'" title="'+articleTitle+'"><i></i>'+articleTitlePart+'</a><em></em><span>'+createDate+'</span></li>');	
		   			}
	   
	   			
	   		}else if(i%6==5){
	   			$('#'+ulId).append('<li><a target="_blank" href="'+articleUrl+'" title="'+articleTitle+'"><i></i>'+articleTitlePart+'</a><em></em><span>'+createDate+'</span></li><ul/>');
	   			
	   			$('#'+dispDivId).append('<DIV style="BORDER-TOP: #e4e6eb 1px dashed; OVERFLOW: hidden; HEIGHT: 1px"></DIV>');
	   		}else{
	   			$('#'+ulId).append('<li><a target="_blank" href="'+articleUrl+'" title="'+articleTitle+'"><i></i>'+articleTitlePart+'</a><em></em><span>'+createDate+'</span></li>');
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
	highlightshow(keys);
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
function loadList(keys,page,limit){
	 $('#ATICLE_LIST').html('');
	 var topicCode=$('#topicCode').val();
	 var articleData=loadArticleByTopic(topicCode,page,limit,'',keys);
	 showArticle('ATICLE_LIST',articleData);
	 initpage(articleData.total);
}

//加载分页
function initpage(count){
	
}
    
$(document).ready(function() {
  $('#bg-body').bcatBGSwitcher({
    urls: srcBgArray,
    alt: 'Full screen background image'
  });
  var searchkey='${keys}';
  if(searchkey){
	$('keys').val(searchkey); 
	loadList(searchkey,'1','18');
	highlightshow(searchkey);
  }else{
	loadList('','1','18');
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
                	<dd><a href="${ctx}/portal/list?topicCode=ZHYW">综合要闻</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=LDDT">领导动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=TZ">通知公告</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=HYTZ">会议通知</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_2"><a href="#"><span>动态</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=GZDT">工作动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=XWGC">新闻观察</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=YJYP">预警研判</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=JWGC">警务观察</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_3"><a href="#"><span>阅览</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=ZDWJ">支队文件</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=ZDBB">值带班表</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=SJWJ">上级文件</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=XXBS">信息报送</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_4"><a href="#"><span>警务</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=JWSP">警务视频</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=DCYJ">调查研究</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=YQDT">舆情动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=GZJB">工作简报</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    
    <div class="nav-path">
        <div class="dqwz">当前网站位置：<a href="${ctx}/portal/index"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="${ctx}/portal/list?topicCode=${topic.topicCode}"  title="${topic.topicName}" class="CurrChnlCls"><span id="span_topicName">${topic.topicName}</span></a></div>
    </div>
<div class="neicontent">
    	<div class="nei_top">
    		<input id="topicCode" value="${topic.topicCode}" type="hidden"/>
        	<h1 id="h1_topicName">${topic.topicName}</h1>
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
        
        <div class="listbox" >
        	<div id="ATICLE_LIST" >
			<%-- 
			<ul>
			
				<li><a target="_blank" href="#" title="许达哲：抓紧抓实抓好安全生产工作"><i></i>许达哲：抓紧抓实抓好安全生产工作</a><em></em><span>2018-01-26</span></li>
			
				<li><a target="_blank" href="#" title="许达哲：为湖南人民多办好事实事"><i></i>许达哲：为湖南人民多办好事实事</a><em></em><span>2018-01-25</span></li>
			
				<li><a target="_blank" href="#" title="张剑飞：坚持以人民为中心 确保春运安全畅通有序"><i></i>张剑飞：坚持以人民为中心 确保春运安全畅通有序</a><em></em><span>2018-01-19</span></li>
			
				<li><a target="_blank" href="#" title="陈飞：强底板补短板 强化责任担当"><i></i>陈飞：强底板补短板 强化责任担当</a><span>2018-01-19</span></li>
			
				<li><a target="_blank" href="#" title="湖南省加速推进新型工业化工作会议召开 张剑飞出席"><i></i>湖南省加速推进新型工业化工作会议召开 张剑飞出席</a><span>2018-01-19</span></li>
			
				<li><a target="_blank" href="#" title="招商引资重头戏：一批民营500强企业将对接湖南"><i></i>招商引资重头戏：一批民营500强企业将对接湖南</a><span>2018-01-18</span></li>
				
			</ul>
		
			<ul>
			
				<li><a target="_blank" href="#" title="陈向群：推动财政政策聚力增效 促进经济高质量发展"><i></i>陈向群：推动财政政策聚力增效 促进经济高质量发展</a><span>2018-01-17</span></li>
			
				<li><a target="_blank" href="#" title="湖南省国企改革暨国资监管工作会议召开 张剑飞出席"><i></i>湖南省国企改革暨国资监管工作会议召开 张剑飞出席</a><span>2018-01-17</span></li>
			
				<li><a target="_blank" href="#" title="吴桂英任湖南省人民政府副省长"><i></i>吴桂英任湖南省人民政府副省长</a><span>2018-01-17</span></li>
			
				<li><a target="_blank" href="#" title="许达哲：落实各方责任 确保人民群众生命财产安全"><i></i>许达哲：落实各方责任 确保人民群众生命财产安全</a><span>2018-01-16</span></li>
			
				<li><a target="_blank" href="#" title="许达哲主持召开省安委会全会 张剑飞、陈飞、王群出席"><i></i>许达哲主持召开省安委会全会 张剑飞、陈飞、王群出席</a><span>2018-01-16</span></li>
			
				<li><a target="_blank" href="#" title="湖南省政府就《政府工作报告》 征求部分省人大代表意见"><i></i>湖南省政府就《政府工作报告》 征求部分省人大代表意见</a><span>2018-01-13</span></li>
				
			</ul>
		
			<ul style="border-bottom: inherit;">
			
				<li><a target="_blank" href="#" title="国务院安委会考核组来湘考核安全生产工作"><i></i>国务院安委会考核组来湘考核安全生产工作</a><span>2018-01-13</span></li>
			
				<li><a target="_blank" href="#" title="国务院安委会考核组来湘考核 许达哲与考核组进行座谈"><i></i>国务院安委会考核组来湘考核 许达哲与考核组进行座谈</a><span>2018-01-13</span></li>
			
				<li><a target="_blank" href="#" title="湖南省现场救护第一目击者行动动员大会举行 向力力出席"><i></i>湖南省现场救护第一目击者行动动员大会举行 向力力出席</a><span>2018-01-11</span></li>
			
				<li><a target="_blank" href="#" title="许达哲主持省政府常务会议 研究部署支持企业研发等工作"><i></i>许达哲主持省政府常务会议 研究部署支持企业研发等工作</a><span>2018-01-11</span></li>
			
				<li><a target="_blank" href="#" title="陈飞：做好“三个融合”开启改革发展新征程"><i></i>陈飞：做好“三个融合”开启改革发展新征程</a><span>2018-01-10</span></li>
			
				<li><a target="_blank" href="#" title="湖南传达学习中央政治局民主生活会精神"><i></i>湖南传达学习中央政治局民主生活会精神</a><span>2018-01-09</span></li>
				
			</ul>
			--%>
			</div>
<script type="text/javascript" src="${ctx}/resources/js-lib/layui/layui.js"></script>
		
		
<div class="page" id="lpage">
<a class="first">＜上一页</a><a class="page-on">1</a><a href="#">2</a><a href="#">3</a><span>...</span><a href="#">28</a><a class="end" href="#">下一页 &gt;</a>
</div>

<script type="text/javascript">
layui.use('laypage', function(){
	  var laypage = layui.laypage;
	  //执行一个laypage实例
	  laypage.render({
	    elem: 'lpage'
	    ,count: 79
	    ,limit:18
	    ,jump: function(obj, first){
	    	//首次不执行
	    	 if(first){
	    		 debugger;
	    		 $('#ATICLE_LIST').html('');
		    	 var topicCode=$('#topicCode').val();
		    	 //var articleData=loadArticleByTopic(topicCode,obj.curr,'18','',keys);
		    	 //showArticle('ATICLE_LIST',articleData);
		    	 
		    	 $.ajax({
			    		cache: true,
			    		type: "POST",
			    		url:'${ctx}/article/loadArticle',
			    		data:{
			    			topicCode:'XWGC'
			    			page:1,
			    			rows:'18'
			    		},
			    		async: false,
			    	    error: function(request) {
			    	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
			    	    },
			    	    success: function(data) {
			    	    	
			    	    }
    			})
		    	 
		    	 
		    	 
		    	 
		    	 
		    	 
	    	  }
	    	
	    }
	    
	  });
	});




</script>

				
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
