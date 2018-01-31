<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script type="text/javascript">
var ctx = "${ctx}";

//返回列表
function goback(){
	location.href=ctx+"/eui/article-video/list";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/css/base.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/portal/css/nei.css" rel="stylesheet" >
<script type="text/javascript" src="${ctx}/resources/portal/js/common.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/lang/zh-cn/zh-cn.js"></script>

<title>文章预览</title>
<body>
<table>
	<tr>
		<td>
			<a href="javascript:void(0)"  class="backLink" onclick="goback()">&lt;&lt;返回列表</a>
		</td>
	</tr>
</table>

<div class="newsContent" id="newsContent">
	<div class="c_Box">
    	<h3 class="sp_title">${articleInfoVo.articleTitle}</h3>
        <div class="sp_time">
		 <span>投稿部门：${articleInfoVo.publishDeptName}</span>
		 <span>发布时间：<fmt:formatDate value="${articleInfoVo.createDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
		 <span>【字体：<a href="javascript:doZoom(20)">大</a><a href="javascript:doZoom(16)">中</a><a href="javascript:doZoom(12)">小</a>】</span>
		</div>
        <div class="content" id="zoom" style="height:400px;text-align: center;padding: 0px 180px;">
			<div>${articleInfoVo.articleContent}</div>
		</div>
        
        <div class="clearfix" style="margin:0 38px;">
    		<div class="chare">
				<div class="chare-left">
				信息来源：马鞍山日报&nbsp;&nbsp;&nbsp;&nbsp;责任编辑：${articleInfoVo.publishUserName}
				</div>

                <div class="chare-right">	
                    <span><a href="javascript:printme()" class="dy">打印</a></span>
                    <span><a href="javascript:window.close()" class="close">关闭页面</a></span>
                </div>
            </div>
       </div>
    </div>
   
</div>
  
</body>
</html>