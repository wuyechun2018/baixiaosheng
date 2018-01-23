<#assign ctx=rc.contextPath />
<!DOCTYPE html>
<html>
<head>
<link href="${ctx}/resources/css/base.css" rel="stylesheet">
<meta charset="UTF-8">
<title>用户管理</title>
</head>
<body>
<a href="${ctx}/user/add" style="color:#8FBC8F">创建用户</a>
<br/>
<table class="gridtable">
<tr>
	<th>序号</th>
	<th>登录名</th>
	<th>登录时间</th>
	<th>操作</th>
</tr>
 <#list userList as user>
 <tr >
	 <td style="text-align:center;width:60px;">${user_index+1!}</td>
	 <td><a href="${ctx}/user/show/${user.id!}">${user.loginName!}<a/></td>
	 <td>${user.loginTime!}</td>
	 <td style="text-align:center"><a href="${ctx}/user/edit/${user.id!}">编辑<a/>|<a href="${ctx}/user/delete/${user.id!}">删除<a/></td>
 </tr>
</#list> 
<table>  
</body>
</html>