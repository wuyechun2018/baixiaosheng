<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="${ctx}/resources/resources/portal/images/logo.ico" type="image/x-icon" rel="icon">                        
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>马鞍山市交警支队</title>
<link href="${ctx}/resources/portal/css/css.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/nei.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.bcat.bgswitcher.js"></script>
</head>
<div class=" top_body">
	<div id="bg-body"></div>
    <script type="text/javascript">
    var ctx = "${ctx}";    
    var srcBgArray = [ctx+"/resources/portal/images/banner1.jpg",ctx+"/resources/portal/images/banner2.jpg",ctx+"/resources/portal/images/banner3.jpg"];

$(document).ready(function() {
  $('#bg-body').bcatBGSwitcher({
    urls: srcBgArray,
    alt: 'Full screen background image'
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
                	<dd><a href="#">综合要闻</a></dd>
                    <dd><a href="#">领导动态</a></dd>
                    <dd><a href="#">通知公告</a></dd>
                    <dd><a href="#">会议通知</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_2"><a href="#"><span>动态</span></a></dt>
                	<dd><a href="#">工作动态</a></dd>
                    <dd><a href="#">新闻观察</a></dd>
                    <dd><a href="#">预警研判</a></dd>
                    <dd><a href="#">警务观察</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_3"><a href="#"><span>阅览</span></a></dt>
                	<dd><a href="#">支队文件</a></dd>
                    <dd><a href="#">值带班表</a></dd>
                    <dd><a href="#">上级文件</a></dd>
                    <dd><a href="#">信息报送</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_4"><a href="#"><span>警务</span></a></dt>
                	<dd><a href="#">警务视频</a></dd>
                    <dd><a href="#">调查研究</a></dd>
                    <dd><a href="#">舆情动态</a></dd>
                    <dd><a href="#">工作简报</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    
    <div class="nav-path">
        <div class="dqwz">当前网站位置：<a href="#"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="#"  title="文章栏目" class="CurrChnlCls">文章栏目</a></div>
    </div>
	
</div>
</div>

<div class="newsContent" id="newsContent">
	<div class="c_Box">
    	<h3 class="sp_title">${articleInfoVo.articleTitle}</h3>
        <div class="sp_time">
		 <span>投稿部门：${articleInfoVo.publishDeptName}</span>
		 <span>发布时间：<fmt:formatDate value="${articleInfoVo.createDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
		 <span>【字体：<a href="javascript:doZoom(20)">大</a><a href="javascript:doZoom(16)">中</a><a href="javascript:doZoom(12)">小</a>】</span>
		</div>
        <div class="content" id="zoom">
			${articleInfoVo.articleContent}
		</div>
		<div class="content" style="text-align: center;">
			<img src="${articleInfoVo.articleImageUrl }" />
		</div>
        
        <div class="clearfix" style="margin:0 38px;">
    		<div class="chare">
				<div class="chare-left">
				信息来源：马鞍山日报&nbsp;&nbsp;&nbsp;&nbsp;责任编辑：王磊
				</div>

                <div class="chare-right">	
                    <span><a href="javascript:printme()" class="dy">打印</a></span>
                    
                    <span><a href="javascript:window.close()" class="close">关闭页面</a></span>
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