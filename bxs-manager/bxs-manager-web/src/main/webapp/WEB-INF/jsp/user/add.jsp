<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 


<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var ctx = "${ctx}";
</script>

<style type="text/css">
.a_title {
	width: 400px;
}

.a_content {
	width: 400px;
	height: 300px;
}

.center_div{
	text-align: center;
}


.center_div table{
	position: absolute;
	left:2%;
	top:5%;
	
}

</style>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建用户</title>
</head>
<body>
	<div class="center_div" >
		<form action="${ctx}/user/save" method="post">
		<table>
			<tr>
				<td>登录名：</td>
				<td><input id="loginName" name="loginName" class="a_title" /></td>
			</tr>
			<tr>
				<td>登录密码：</td>
				<td><input id="loginPassword" name="loginPassword"  type="password" class="a_title" /></td>
			</tr>

			<tr>
				<td><input type="submit" value="保存" /></td>
				<td>
					<a href="${ctx}/user/manager">取消</a>
				</td>
			</tr>
		</table>
	</form>
	
	
	</div>
	
</body>
</html>