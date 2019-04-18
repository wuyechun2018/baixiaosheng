<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="${ctx}/resources/images/favicon.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/login-v2/login-yun.css" rel="stylesheet" >
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
			<%----%>
			<h1 class="loginTitle">融合数据&nbsp;&nbsp;提升绩效</h1>
			<ul>
				<li class="loginTitleLi">物流  采购  分销 库存  人力资源 </li>
				<li class="loginTitleLi">成本控制 优化流程 </li>
				<li class="loginTitleLi">便利性   实时性  准确性</li>
			</ul>
			 
		</div>
		<!-----------------页面右侧表单------------------>
		<div class="secR">
			<!-----页面右侧透明背景----->
			<div class="box-bg-yun"></div>
			<!--------表单内容------------>
			<form action="${ctx}/erpUser/doLogin" method="post" name="frmLogin" id="loginForm">
				<div class="form">
					<h1 class="yun-login-h1">密码登录</h1>
					<%----%>
					<p style="color:red">
						${SYSTEM_ERROR_MSG}
					</p> 
					<div class="item clearfix">
						<label for="userNameIpt"></label> 
						<input type="text" tabindex="1" id="username" name="username" class="yun-login-form-input"
							notnull="true" info="用户名" placeholder="zhangsan"/>
					</div>
					<div class="item itempass clearfix">
						<label for="password"></label> 
						<input type="password" tabindex="2" id="password" name="password" notnull="true" info="密码" class="yun-login-form-input"
							autocomplete="off" placeholder="请输入密码" />
					</div>
					<div class="item itemRadio clearfix">
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