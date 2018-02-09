<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" href="${ctx}/resources/js-lib/layui/css/layui.css">

<style type="text/css">
.childrenBody{ padding:10px;}
.pwdTips {
    min-height: auto;
    margin: 40px 0 15px 110px;
}

.layui-red {
    color: #f00 !important;
    font-weight: bold;
}

</style>

<script type="text/javascript">
var ctx = "${ctx}";
</script>
</head>
<body>
<script type="text/javascript" src="${ctx}/resources/js-lib/base.js"></script>
<body class="childrenBody">
<form class="layui-form layui-row changePwd">
	<div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
		<div class="layui-input-block layui-red pwdTips"></div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">登录名</label>
			<div class="layui-input-block">
				<input type="text" value="${userinfo.loginName}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" value="${userinfo.userName}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">部门</label>
			<div class="layui-input-block">
				<input type="text" value="${userinfo.deptName}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">职位</label>
			<div class="layui-input-block">
				<input type="text" value="${userinfo.postName}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="changePwd">立即修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="${ctx}/resources/js-lib/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/resources/user.js"></script>
</body>
</html>