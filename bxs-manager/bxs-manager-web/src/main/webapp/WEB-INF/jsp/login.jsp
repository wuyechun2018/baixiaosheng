<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/login-v2/login.css" rel="stylesheet" >
<link href="${ctx}/resources/login-v2/reset.css" rel="stylesheet" >
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/jquery-1.9.1.min.js"></script>
<title>登录</title>
<script type="text/javascript">

function loginSubmit(){
	 $("#loginForm").submit();
}


</script>
</head>
<body onkeydown="javascript:if(event.keyCode==13)loginSubmit();">
	<input id="idInput" type="hidden" value="company" />
	<div class="container clearfix">
		<!-----------------页面左侧文字------------------>
		<div class="secL">
			<%--
			<h2>后台登录</h2>
			<p>
				文章发布、审核<br> 
			</p>
			 --%>
		</div>
		<!-----------------页面右侧表单------------------>
		<div class="secR">
			<!-----页面右侧透明背景----->
			<div class="box-bg"></div>
			<!--------表单内容------------>
			<form action="${ctx}/user/doLogin" method="post" name="frmLogin" id="loginForm">
				<div class="form">
					<h1>登录平台</h1>
					<%----%>
					<p>
						${SYSTEM_ERROR_MSG}
					</p> 
					<div class="item clearfix">
						<label for="userNameIpt"></label> 
						<input type="text" tabindex="1" id="username" name="username"
							notnull="true" info="用户名" placeholder="zhangsan"/>
					</div>
					<div class="item itempass clearfix">
						<label for="password"></label> 
						<input type="password" tabindex="2" id="password" name="password" notnull="true" info="密码"
							autocomplete="off" placeholder="请输入密码" />
					</div>
					<div class="item itemRadio clearfix">
					<!--[if !IE]><!--> <input  type="checkbox" style="float: left;width:13px;height: 25px" id="radioPass"  onclick="checkbox();">&nbsp;记住密码</input> <!--<![endif]-->
						<!--[if IE]> 
											<input  type="checkbox" style="float: left;width:13px;height: 13px" id="radioPass"  onclick="checkbox();">&nbsp;记住密码</input>
						<![endif]--> 
						<a href="javascript:void(0)" style="float: right;">忘记密码?</a>
					</div>

					<div class="item">
					   <button  type="button" tabindex="5" id="btnSubmit" onclick="loginSubmit();" >登&nbsp;&nbsp;录</button>
					</div>
				</div>
			</form>
		</div>
		<div style="position: relative; top:250px;left:150px;text-align: center;float:left;padding-left: 200px;">
		 
		</div>
	</div>

</body>
</html>