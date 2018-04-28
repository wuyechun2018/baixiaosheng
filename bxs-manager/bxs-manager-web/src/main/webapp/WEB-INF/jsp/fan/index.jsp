<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="http://www.cfan.com.cn/cfan.ico" />
<link rel="icon" href="http://www.cfan.com.cn/cfan.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--手机版设置-->
<meta http-equiv="X-UA-Compatible" content="IE=11">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--/手机版设置-->
<title>思淘客</title>
<link href="${ctx}/resources/fan/css/index.css" rel="stylesheet" />
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
</style>

<script type="text/javascript">
function ChangeMyDivShow(imgObj){
    var divObj = document.getElementById(imgObj);
    //判断divObj的display的值
    if(divObj.style.display=="none"){
        divObj.style.display = "block";
    }else{
        divObj.style.display = "none";
    }
}

$(function(){
	
	var showHTML='';
	
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/pagerListNoCache',
		data:{
			page:1,
			rows:5
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	var liHTML=
	    		"<li>\n" +
	    		"          <div class=\"left-post\">\n" + 
	    		"            <div class=\"new-item\">产品</div>\n" + 
	    		"            <a href=\"http://www.cfan.com.cn/2018/0411/130595.shtml\"\n" + 
	    		"              target=\"_blank\" title=\"看完秒懂！这就是Android手机越用越卡的原因！\">\n" + 
	    		"              <div class=\"left-post-pic\"\n" + 
	    		"                style=\"background: url(http://upload.cfan.com.cn/2018/0411/1523409817511.jpg) no-repeat center; background-size: cover;\"></div>\n" + 
	    		"            </a>\n" + 
	    		"            <div class=\"left-post-info\" style=\"position: relative;\">\n" + 
	    		"              <a href=\"http://www.cfan.com.cn/2018/0411/130595.shtml\" target=\"_blank\" title=\"看完秒懂！\">\n" + 
	    		"                <h1 class=\"left-post-title\">\n" + 
	    		"                  看完秒懂！这就是Android手机越用越卡的原因！\n" + 
	    		"                </h1>\n" + 
	    		"                <div class=\"left-post-txt\">\n" + 
	    		"                  智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因\n" + 
	    		"                </div>\n" + 
	    		"              </a>\n" + 
	    		"              <div class=\"left-post-note\" style=\"margin-left: 0;\">\n" + 
	    		"                <div class=\"author\">作者:智趣狗</div>\n" + 
	    		"              </div>\n" + 
	    		"              <div class=\"bshare-custom\" style=\"float: right;height=25px;\">\n" + 
	    		"                <img style=\"padding-bottom: 6px;\" src=\"http://img.cfan.com.cn/templates/default/css/images171225/weixin.png\" onclick=\"ChangeMyDivShow('testid130595')\">\n" + 
	    		"                <wb:share-button\n" + 
	    		"                  addition=\"simple\"\n" + 
	    		"                  type=\"icon\"\n" + 
	    		"                  url=\"http://www.cfan.com.cn/2018/0411/130595.shtml\" title=\"看完秒懂！这就是Android手机越用越卡的原因！，智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因，只是当时是以苹果降速门为切入点，并没有说透。今天，就让咱们聚焦Android手机领域，从硬件、系统和软件三个方面分析安卓手机为啥容易出现“越用越慢”的尴尬问题吧。\"\n" + 
	    		"                  pic=\"http://upload.cfan.com.cn/2018/0411/thumb_200_145_1523409817511.jpg\">\n" + 
	    		"                  <iframe src=\"http://widget.weibo.com/staticjs/weibosharev2.html?url=http%3A%2F%2Fwww.cfan.com.cn%2F2018%2F0411%2F130595.shtml&amp;type=icon&amp;language=zh_cn&amp;title=看完秒懂！这就是Android手机越用越卡的原因！，智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因，只是当时是以苹果降速门为切入点，并没有说透。今天，就让咱们聚焦Android手机领域，从硬件、系统和软件三个方面分析安卓手机为啥容易出现“越用越慢”的尴尬问题吧。&amp;pic=http://upload.cfan.com.cn/2018/0411/thumb_200_145_1523409817511.jpg&amp;searchPic=true&amp;style=simple\"\n" + 
	    		"                    width=\"18\" height=\"25\" frameborder=\"0\" scrolling=\"no\"\n" + 
	    		"                    marginheight=\"0\">\n" + 
	    		"                  </iframe>\n" + 
	    		"                </wb:share-button>\n" + 
	    		"              </div>\n" + 
	    		"              <div class=\"testclass\" id=\"testid130595\" style=\"display: none;\">\n" + 
	    		"                <img src=\"http://upload.cfan.com.cn/qrcode/2018/0411/39373/lbazhl3mcijt-7.png\" width=\"150px\" height=\"150px/\">\n" + 
	    		"              </div>\n" + 
	    		"\n" + 
	    		"            </div>\n" + 
	    		"          </div>\n" + 
	    		"</li>";
	    		
	    		//$('#dataUL').append(liHTML);
	    		
	    }
	})
	
})




</script>


</head>
<body>
	<!--头部-->
	<header class="header"> 
		<a href="http://www.cfan.com.cn">
			<div class="logo"></div>
		</a> 
		<nav class="navlist">
			<ul>
				 <li class="on"><a href="${ctx}/portal/list?topicCode=''">首页</a></li>
			 	  <c:forEach items="${topicList}" var="topic" begin="0" end="4">
		           	  <li><a href="${ctx}/portal/list?topicCode=${topic.topicCode}" target="_blank">${topic.topicName}</a></li>
		          </c:forEach>
			</ul>
		</nav>

		<div class="head-right">
			<div class="search"></div>
		</div>
	</header>
	
	<div class="clear"></div>

	<main class="main-left">
		<div class="ui-video-list">
			<ul id="dataUL">
				<li>
					<div class="left-post">
						<div class="new-item">产品</div>
						<a href="http://www.cfan.com.cn/2018/0411/130595.shtml"
							target="_blank" title="看完秒懂！这就是Android手机越用越卡的原因！">
							<div class="left-post-pic"
								style="background: url(http://upload.cfan.com.cn/2018/0411/1523409817511.jpg) no-repeat center; background-size: cover;"></div>
						</a>
						<div class="left-post-info" style="position: relative;">
							<a href="http://www.cfan.com.cn/2018/0411/130595.shtml" target="_blank" title="看完秒懂！">
								<h1 class="left-post-title">
									看完秒懂！这就是Android手机越用越卡的原因！
								</h1>
								<div class="left-post-txt">
									智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因
								</div>
							</a>
							<div class="left-post-note" style="margin-left: 0;">
								<div class="author">作者:智趣狗</div>
							</div>
							<div class="bshare-custom" style="float: right;height=25px;">
								<img style="padding-bottom: 6px;" src="http://img.cfan.com.cn/templates/default/css/images171225/weixin.png" onclick="ChangeMyDivShow('testid130595')">
								<wb:share-button 
									addition="simple" 
									type="icon" 
									url="http://www.cfan.com.cn/2018/0411/130595.shtml" title="看完秒懂！这就是Android手机越用越卡的原因！，智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因，只是当时是以苹果降速门为切入点，并没有说透。今天，就让咱们聚焦Android手机领域，从硬件、系统和软件三个方面分析安卓手机为啥容易出现“越用越慢”的尴尬问题吧。" 
									pic="http://upload.cfan.com.cn/2018/0411/thumb_200_145_1523409817511.jpg">
									<iframe src="http://widget.weibo.com/staticjs/weibosharev2.html?url=http%3A%2F%2Fwww.cfan.com.cn%2F2018%2F0411%2F130595.shtml&amp;type=icon&amp;language=zh_cn&amp;title=看完秒懂！这就是Android手机越用越卡的原因！，智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因，只是当时是以苹果降速门为切入点，并没有说透。今天，就让咱们聚焦Android手机领域，从硬件、系统和软件三个方面分析安卓手机为啥容易出现“越用越慢”的尴尬问题吧。&amp;pic=http://upload.cfan.com.cn/2018/0411/thumb_200_145_1523409817511.jpg&amp;searchPic=true&amp;style=simple"
										width="18" height="25" frameborder="0" scrolling="no"
										marginheight="0">
									</iframe>
								</wb:share-button>
							</div>
	
							<div class="testclass" id="testid130595" style="display: none;">
								<img src="http://upload.cfan.com.cn/qrcode/2018/0411/39373/lbazhl3mcijt-7.png" width="150px" height="150px/">
							</div>
	
						</div>
					</div>
				</li>
				
				<li>
					<div class="left-post">
						<div class="new-item">产品</div>
						<a href="http://www.cfan.com.cn/2018/0411/130595.shtml"
							target="_blank" title="看完秒懂！这就是Android手机越用越卡的原因！">
							<div class="left-post-pic"
								style="background: url(http://upload.cfan.com.cn/2018/0411/1523409817511.jpg) no-repeat center; background-size: cover;"></div>
						</a>
						<div class="left-post-info" style="position: relative;">
							<a href="http://www.cfan.com.cn/2018/0411/130595.shtml" target="_blank" title="看完秒懂！">
								<h1 class="left-post-title">
									看完秒懂！这就是Android手机越用越卡的原因！
								</h1>
								<div class="left-post-txt">
									智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因
								</div>
							</a>
							<div class="left-post-note" style="margin-left: 0;">
								<div class="author">作者:智趣狗</div>
							</div>
							<div class="bshare-custom" style="float: right;height=25px;">
								<img style="padding-bottom: 6px;" src="http://img.cfan.com.cn/templates/default/css/images171225/weixin.png" onclick="ChangeMyDivShow('testid130595')">
								<wb:share-button 
									addition="simple" 
									type="icon" 
									url="http://www.cfan.com.cn/2018/0411/130595.shtml" title="看完秒懂！这就是Android手机越用越卡的原因！，智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因，只是当时是以苹果降速门为切入点，并没有说透。今天，就让咱们聚焦Android手机领域，从硬件、系统和软件三个方面分析安卓手机为啥容易出现“越用越慢”的尴尬问题吧。" 
									pic="http://upload.cfan.com.cn/2018/0411/thumb_200_145_1523409817511.jpg">
									<iframe src="http://widget.weibo.com/staticjs/weibosharev2.html?url=http%3A%2F%2Fwww.cfan.com.cn%2F2018%2F0411%2F130595.shtml&amp;type=icon&amp;language=zh_cn&amp;title=看完秒懂！这就是Android手机越用越卡的原因！，智趣狗在今年1月曾简单介绍过手机为啥越用越卡的原因，只是当时是以苹果降速门为切入点，并没有说透。今天，就让咱们聚焦Android手机领域，从硬件、系统和软件三个方面分析安卓手机为啥容易出现“越用越慢”的尴尬问题吧。&amp;pic=http://upload.cfan.com.cn/2018/0411/thumb_200_145_1523409817511.jpg&amp;searchPic=true&amp;style=simple"
										width="18" height="25" frameborder="0" scrolling="no"
										marginheight="0">
									</iframe>
								</wb:share-button>
							</div>
	
							<div class="testclass" id="testid130595" style="display: none;">
								<img src="http://upload.cfan.com.cn/qrcode/2018/0411/39373/lbazhl3mcijt-7.png" width="150px" height="150px/">
							</div>
	
						</div>
					</div>
				</li>
			</ul>
		</div>
	</main>


	<main class="main-right">
		<div class="title">热门文章</div>
		<div class="right-post">
			<a href="http://www.cfan.com.cn/2018/0327/130473.shtml" title="129元到底值不值？联想Watch 9智能手表评测" target="_blank">
				<div class="right-item">产品</div>
				<div class="right-post-pic" style="background: url(http://upload.cfan.com.cn/2018/0327/1522111502825.jpg) no-repeat center; background-size: cover;"></div>
				<h1 class="right-post-title">129元到底值不值？联想Watch 9智能手表评测</h1>
				<div class="right-post-date">2018-03-27 08:48</div>
			</a>
		</div>
	</main>

	<footer class="footerbox">
	<div class="footer-logo"></div>
	<div class="footer-link">
		<ul>
			<li><a href="http://www.cfan.com.cn/about/about.shtml"
				target="_blank">· 关于我们</a></li>
			<li><a href="http://www.cfan.com.cn/about/legal.shtml"
				target="_blank">· 法律声明</a></li>
			<li><a href="http://www.cfan.com.cn/about/contact.shtml"
				target="_blank">· 联系我们</a></li>
		</ul>
	</div>
	<div class="footer-txt">
		<a href="http://img.cfan.com.cn/templates/default/img/xukezheng.jpg"
			target="_blank">互联网出版许可证</a> （总）网出证（京）字第047号<br>
		增值电信业务经营许可证编号：合字B2-2xxx1x0001<br> 海淀分局xx编号：1101082203 <br>
		法律顾问：xx律师 网站:<a href="http://www.xxxx.cn" target="_blank">www.zt148.cn</a>
		电话:13366185341 <br> Copyright(C) cfan.com.cn,All rights reserved
		&nbsp;&nbsp;<br>
	</div>
	<div class="footer-img">
		<%--
			<img src="http://img.xxx.com.cn/templates/default/css/images171225/cfanimg.jpg">
		 --%>
	</div>


	</footer>




</body>
</html>