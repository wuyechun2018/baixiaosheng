<#assign ctx=rc.contextPath />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章列表</title>

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
<table class="gridtable">
<tr>
	<th>序号</th>
	<th>标题</th>
	<th>更新时间</th>
	<th>浏览次数</th>
</tr>
 <#list articleList as article>
 <tr >
	 <td style="width:60px;text-align:center;">${article_index+1!}</td>
	 <td style="text-align:left;"><a href="${ctx}/article/show/${article.id!}">${article.articleTitle!}<a/></td>
	 <td style="width:220px;">${article.updateDate!}</td>
	 <td style="width:100px;">${article.viewCount!}</td>
 </tr>
</#list> 
<table>  
</body>
</html>