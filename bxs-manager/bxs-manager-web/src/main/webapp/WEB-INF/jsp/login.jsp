<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/login/login.css" rel="stylesheet" >
<link href="${ctx}/resources/login/style.css" rel="stylesheet" >
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/jquery-1.9.1.min.js"></script>
<title>登录</title>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container">
		<div class="codrops-top" style="height: 24px;">
                <a href="">
                    <strong>« Previous Demo: </strong>Responsive Content Navigator
                </a>
                <span class="right">
                    <a href="">
                        <strong>Back to the Codrops Article</strong>
                    </a>
                </span>
                <div class="clr"></div>
         </div>
         
         <header>
              
         </header>
	
	
		<div id="wrapper">
			<div id="login" class="animate form">
				<form action="${ctx}/user/login" method="post" >
					<h1>系统登录</h1>
					<p> <label for="username" class="uname" data-icon="u"> 
						登录名</label> 
						<input id="username" name="username" required="required" type="text" placeholder="myusername or mymail@mail.com">
					</p>
					<p>
						<label for="password" class="youpasswd" data-icon="p"> 密码</label> 
						<input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO">
					</p>
					<p class="keeplogin">
						<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping">
						<label for="loginkeeping">记住我</label>
					</p>
					<p class="login button">
						<input type="submit" value="Login">
					</p>
					<p class="change_link"> 
						还没有账号 ? 
						<a href="javascript:void(0)" class="to_register">去注册</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>