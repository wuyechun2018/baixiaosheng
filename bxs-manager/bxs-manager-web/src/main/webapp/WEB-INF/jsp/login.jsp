<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/jquery-1.9.1.min.js"></script>

<title>登录</title>

<script type="text/javascript">
function login() {
	$("#fm1").submit();
}

///http://172.16.10.74:8080/uaac-server/login?service=http://172.16.10.40:9433/cas/index
//http://59.203.153.116:8088/uaac-server/login?p=&amp;loginType=&amp;service=http://59.203.153.116/cas/index
function loginByPwd(user,password) {
	$('<form id="loginForm" method="post" action="http://172.16.10.74:8080/uaac-server/login?service=http://172.16.10.40:9433/cas/index"><input type="text" id="username" name="username"/><input type="password" id="password" name="password"/></form>').appendTo("body");
	$('#username').val(user);
	$('#password').val(password);
	$("#loginForm").submit();
}


function dosumbit() {
	$("#loginForm").submit();
}


</script>


</head>

<button onclick="modelLogin()">模拟登录</button>
<button onclick="dosumbit()">登录</button>

<!-- 
<from id="loginForm" method="post"
	action="http://59.203.153.116:8088/uaac-server/login?p=&amp;loginType=&amp;service=http://59.203.153.116/cas/index">
<input type="text" id="username" name="username">
<input type="password" id="password" name="password">
</from>
 -->


<%--
<form id="fm1" name="pki" action="http://59.203.153.116:8088/uaac-server/login?p=&amp;loginType=&amp;service=http://59.203.153.116/cas/index" method="post">
							<div class="input-tips m-t-15">用户名</div>

								<div class="pki-user">
									<span class="span-text icon-uanme"></span>
									<div class="div-text" style="border-color: rgb(221, 221, 221);">
										<input type="text" id="username" name="username" onblur="checkUserNameIsNull();" placeholder="请输入用户名">
			                        	<input type="hidden" id="platform" name="platform" value="whsg">
									</div>
									<div class="clear"></div>

									<div class="error" id="username_tip" style="display: none;">
										<img src="images/whsg/20140523/error.png" alt="用户名不为空!"> <span class="error-text">用户名不为空!</span>
									</div>
									<div id="loginError" class="error" style="display: none;">
										
									</div>
									
								</div>

							<div class="clear"></div>
							<div class="input-tips">密码</div>

								<div class="pki-pwd">
									<span class="span-text icon-pwd"></span>
									<div class="div-text" style="border-color: rgb(221, 221, 221);">
										<input type="password" id="password" name="password" onkeydown="keydownLogin();"  placeholder="请输入密码">
									</div>
									<div class="clear"></div>

									<div class="error" id="pwd_tip" style="display: none;">
										<img src="images/whsg/20140523/error.png" alt="密码不为空!"> <span class="error-text">密码不为空!</span>
									</div>
								</div>

							<div class="clear"></div>
							<div class="pki-user-wrap">
								<div class="pki-code">
									<div class="error height26" id="check_tip" style="display: none">
										<img src="images/whsg/20140523/error.png" alt="验证码不为空!"> <span class="error-text">验证码不为空!</span>
									</div>
								</div>
							</div>

							<div class="clear"></div>
							<div class="pki-btn">
								<a class="btn-a" onclick="login();">登录</a>
							</div>
							
						</form>
 --%>

<body>




</body>
</html>