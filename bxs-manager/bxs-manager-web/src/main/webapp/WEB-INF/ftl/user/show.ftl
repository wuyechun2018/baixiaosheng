<#assign ctx=rc.contextPath />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户详情</title>

<style type="text/css">

</style>

</head>
<body>

<table>
<tr>
<th>登录名：</th>
<td>${user.loginName!}</td>
</tr>
<tr>
<th>最后登录时间：</th>
<td>${user.loginTime!}</td>
</tr>

</table>
 
<br />
<br />
<br />
<br />
<br />
  <div style="text-align: center;font-size:26px;"><a  href="${ctx}/user/manager">返回列表</a></div>
</body>
</html>

