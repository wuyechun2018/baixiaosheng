<#assign ctx=rc.contextPath />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章管理</title>

<style type="text/css">
table.gridtable {
	width:98%;
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
	margin:10px 5px 10px 5px;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #87CEEB;
	font-size:22px;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #87CEEB;
	background-color: #ffffff;
	text-align:center;
	font-size:20px;
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
	<th>操作</th>
</tr>
 <#list articleList as article>
 <tr >
	 <td style="text-align:center;width:60px;">${article_index+1!}</td>
	 <td><a href="${ctx}/article/show/${article.id!}">${article.articleTitle!}<a/></td>
	 <td style="text-align:center;width:220px;">${article.createDate!}</td>
	 <td style="text-align:center;width:220px;">${article.updateDate!}</td>
	 <td style="text-align:center;width:100px;">${article.viewCount!}</td>
	 <td style="text-align:center"><a href="${ctx}/article/edit/${article.id!}">编辑<a/>|<a href="${ctx}/article/delete/${article.id!}">删除<a/></td>
 </tr>
</#list> 
<table>  
</body>
</html>