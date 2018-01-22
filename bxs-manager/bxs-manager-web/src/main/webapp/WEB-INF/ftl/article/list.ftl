<#assign ctx=rc.contextPath />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>列表</title>

<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #87CEEB;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #87CEEB;
	background-color: #ffffff;
}
</style>

</head>
<body>
<a href="${ctx}/article/add" style="color:#8FBC8F">创建文章</a>
<br/>
<table class="gridtable">
<tr>
	<th>序号</th>
	<th>标题</th>
	<th>创建时间</th>
	<th>更新时间</th>
	<th>浏览次数</th>
</tr>
 <#list articleList as article>
 <tr >
	 <td>${article_index+1!}</td>
	 <td><a href="${ctx}/article/show/${article.id!}">${article.articleTitle!}<a/></td>
	 <td>${article.createDate!}</td>
	 <td>${article.updateDate!}</td>
	 <td style="text-align:center">${article.viewCount!}</td>
 </tr>
</#list> 
<table>  
</body>
</html>