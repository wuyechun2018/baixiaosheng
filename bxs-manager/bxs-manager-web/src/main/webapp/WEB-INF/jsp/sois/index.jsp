<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息报送</title>
<LINK href="${ctx}/resources/images/msg24.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/images/msg24.ico" type="image/x-icon" rel="shortcut icon">
<link rel="stylesheet" href="${ctx}/resources/js-lib/layui/css/layui.css">
<link rel="stylesheet" href="${ctx}/resources/sois/css/index.css" media="all" />
<link rel="stylesheet" href="${ctx}/resources/sois/css/global.css" media="all" />

<script type="text/javascript">
var ctx = "${ctx}";
</script> 
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header header-demo">
			<div class="layui-main mag0">
				<a href="#" class="logo">
					<span style="padding-left: 15px;">会员系统</span>
				</a>
				<!-- 显示/隐藏菜单 -->
				<a href="javascript:;" class="seraph hideMenu icon-caidan"></a>
				<!-- 顶级菜单 -->
				<ul class="layui-nav mobileTopLevelMenus" mobile>
					<li class="layui-nav-item" data-menu="contentManagement">
						<a href="javascript:;"><i class="seraph icon-caidan"></i><cite>layuiCMS</cite></a>
						<dl class="layui-nav-child">
							<dd class="layui-this" data-menu="contentManagement"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a></dd>
							<dd data-menu="memberCenter"><a href="javascript:;"><i class="seraph icon-icon10" data-icon="icon-icon10"></i><cite>用户中心</cite></a></dd>
							<dd data-menu="systemeSttings"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统设置</cite></a></dd>
							<dd data-menu="seraphApi"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe705;">&#xe705;</i><cite>使用文档</cite></a></dd>
						</dl>
					</li>
				</ul>
				<%--
				<ul class="layui-nav topLevelMenus" pc>
					<li class="layui-nav-item layui-this" data-menu="contentManagement">
						<a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a>
					</li>
					<li class="layui-nav-item" data-menu="memberCenter" pc>
						<a href="javascript:;"><i class="seraph icon-icon10" data-icon="icon-icon10"></i><cite>用户中心</cite></a>
					</li>
					<li class="layui-nav-item" data-menu="systemeSttings" pc>
						<a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统设置</cite></a>
					</li>
					<li class="layui-nav-item" data-menu="seraphApi" pc>
						<a href="javascript:;"><i class="layui-icon" data-icon="&#xe705;">&#xe705;</i><cite>使用文档</cite></a>
					</li>
				</ul>
				 --%>
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
					<li class="layui-nav-item" pc>
						<a href="javascript:;" data-url="${ctx}/sois/showFeedbackList" target="_blank" class="clearCache"><i class="layui-icon" data-icon="&#xe611;">&#xe611;</i><cite>我的反馈</cite><span class="layui-badge-dot"></span></a>
					</li>
					<%--
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="seraph icon-lock"></i><cite>锁屏</cite></a>
					</li>
					 --%>
					<li class="layui-nav-item" id="userInfo">
						<a href="javascript:;"><img src="${ctx}/resources/sois/images/face.jpg" class="layui-nav-img userAvatar" width="35" height="35"><cite class="adminName">${SESSION_USER_INFO.userName}</cite></a>
						<dl class="layui-nav-child">
							<%--
							<dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="seraph icon-ziliao" data-icon="icon-ziliao"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" class="showNotice"><i class="layui-icon">&#xe645;</i><cite>系统公告</cite><span class="layui-badge-dot"></span></a></dd>
							<dd pc><a href="javascript:;" class="functionSetting"><i class="layui-icon">&#xe620;</i><cite>功能设定</cite><span class="layui-badge-dot"></span></a></dd>
							<dd pc><a href="javascript:;" class="changeSkin"><i class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
							 --%>
							 <dd><a href="javascript:;" data-url="${ctx}/sois/userInfo"><i class="seraph icon-ziliao" data-icon="icon-ziliao"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="${ctx}/sois/pwd"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a></dd>
							<dd><a href="${ctx}/sois/loginout" class="signOut"><i class="seraph icon-tuichu"></i><cite>退出</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			
			<div class="navBar layui-side-scroll" id="navBar">
				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item ">
						<a href="javascript:;" data-url="${ctx}/sois/add"><i class="layui-icon" data-icon=""></i><cite>后台首页</cite></a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>信息上报</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="${ctx}/sois/add"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p><span>2017 &copy;马鞍山公安局交警支队  技术支持：芜湖山河网络科技有限公司</span></p>
		</div>
	</div>

	<!-- 移动导航 -->
	<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>

	<script type="text/javascript" src="${ctx}/resources/js-lib/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js-lib/base.js"></script>
	<script type="text/javascript" src="${ctx}/resources/sois/index.js"></script>
</body>
</html>