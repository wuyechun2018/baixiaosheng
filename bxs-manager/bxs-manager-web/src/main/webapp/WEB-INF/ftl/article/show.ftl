<#assign ctx=rc.contextPath />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>详情</title>

<style type="text/css">
.h-title {
    margin-top: 30px;
    padding: 0 20px;
    text-align: center;
    font-size: 32px;
    color: #404040;
    font-weight: 600;
}

.h-info {
    margin-top: 10px;
    text-align: center;
    font-size: 22px;
    color: #B3B3B3;
}

.h-time {
    margin-right: 20px;
}

.c-content{
	margin-top:20px;
	margin-left:10px;

}

</style>

</head>
<body>
 <div class="h-title">${article.articleTitle!}</div>
 
 <div class="h-info">
	<span class="h-time"> ${article.createDate!}</span> 
 </div>
 
<div class="c-content"> ${article.articleContent!}</div>
 
<br />
<br />
<br />
<br />
<br />
  <div style="text-align: center;font-size:26px;"><a  href="${ctx}/article/list">返回列表</a></div>
</body>
</html>

