<#assign ctx=rc.contextPath />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章管理</title>
<link href="${ctx}/resources/css/base.css" rel="stylesheet">
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