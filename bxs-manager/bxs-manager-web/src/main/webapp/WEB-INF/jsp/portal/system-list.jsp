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
  var tpzsData=loadArticleByTopic(topicCode,'1','12','');
  showArticle('TPZS',tpzsData);
  
  
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
        <div class="dqwz">当前网站位置：<a href="#"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="#"  title="文章栏目" class="CurrChnlCls">文章栏目</a></div>
    </div>
	
    
     <div class="neicontent">
    	<div class="nei_top">
        	<h1>应用系统列表</h1>
        </div>
        
        <div class="xitongbox ">
        	<ul class="clearfix">

				<li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li>
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                <li style="margin-right:0px;">
                	<a target="_blank" title="系统1" href="#"><img src="images/ic1.jpg">
					</a>
				</li>
                

				
			
			</ul>
        	
        
           <div class="page"><a class="first">＜上一页</a><a class="page-on">1</a><a href="#">2</a><a href="#">3</a><span>...</span><a href="#">28</a><a class="end" href="#">下一页 &gt;</a>
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
    