<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/ckeditor-4.5.6/ckeditor.js"></script>
<script type="text/javascript">
var ctx = "${ctx}";

$(function(){
	CKEDITOR.replace('articleContent',{
		customConfig : '${ctx}/resources/js-lib/ckeditor-4.5.6/config.js?v='+ Math.random()
	});
})

</script>

<style type="text/css">
.a_title {
	width: 400px;
}

.a_content {
	width: 400px;
	height: 300px;
}
</style>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建文章</title>
</head>
<body>
	<form action="${ctx}/article/save" method="post">
		<table>
			<tr>
				<td>文章标题：</td>
				<td>
					<input type="hidden" name="id" value="${article.id}" />
				
					
					<input id="articleTitle" name="articleTitle" class="a_title" value="${article.articleTitle}" />
				</td>
			</tr>
			<tr>
				<td>文章内容：</td>
				<td><textarea id="articleContent" name="articleContent" 
						class="a_content">${article.articleContent}</textarea></td>
			</tr>

			<tr>
				<td><input type="submit" value="保存" /></td>
				<td>
					<a href="${ctx}/article/manager">取消</a>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">

</script>
</body>
</html>