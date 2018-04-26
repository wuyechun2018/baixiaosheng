<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/jquery-1.9.1.min.js"></script>
<style type="text/css">
.btn-red{
	background-color: #f44336; 
    border: none;
    color: white;
    padding: 8px 18px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
}


.btn-green{
	background-color: #4CAF50; 
    border: none;
    color: white;
    padding: 8px 18px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
     cursor: pointer;
}

</style>


<script type="text/javascript">
var ctx = "${ctx}";

//返回列表
function goback(){
	location.href=ctx+"/eui/article/list";
}

//审核
function checkFun(checkState){
	$.ajax({
        type: "POST",
        url:'${ctx}/article/saveCheckState',
        data: {
        	id:$('#id').val(),
        	checkState:checkState
        },
        success: function (data) {
        	location.href=ctx+"/eui/article/list";
        },
        error: function(data) {
            alert("error:"+data.responseText);
         }
  		});
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx}/resources/css/base.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/portal/css/nei.css" rel="stylesheet" >
<script type="text/javascript" src="${ctx}/resources/portal/js/common.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/lang/zh-cn/zh-cn.js"></script>

<title>文章审核</title>
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
		<input id="id" value="${articleInfoVo.id}" type="hidden"/>
		<%--<h3 class="sp_title" style="color:${articleInfoVo.titleColor}">${articleInfoVo.articleTitle}</h3> --%>
    	<h3 class="sp_title" >${articleInfoVo.articleTitle}</h3>
        <div class="sp_time">
		 <span>投稿部门：${articleInfoVo.publishDeptName}</span>
		 <span>发布时间：<fmt:formatDate value="${articleInfoVo.createDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
		 <span>【字体：<a href="javascript:doZoom(20)">大</a><a href="javascript:doZoom(16)">中</a><a href="javascript:doZoom(12)">小</a>】</span>
		</div>
        <div class="content" id="zoom">
			${articleInfoVo.articleContent}
		</div>
		<div class="content" style="text-align: center;">
			<img src="${articleInfoVo.articleImageUrl }" />
		</div>
        
        <div class="clearfix" style="margin:0 38px;">
    		<div class="chare">
				<div class="chare-left">
				信息来源：${articleInfoVo.newsfrom}&nbsp;&nbsp;&nbsp;&nbsp;作者：${articleInfoVo.author}&nbsp;&nbsp;&nbsp;&nbsp;责任编辑：${articleInfoVo.resEdtior}
				</div>

                <div class="chare-right">	
                    <span><a href="javascript:printme()" class="dy">打印</a></span>
                    <span><a href="javascript:window.close()" class="close">关闭页面</a></span>
                </div>
            </div>
       </div>
    </div>
</div>
	  <div style="width: 100%;text-align: center;padding-bottom: 50px;">
       		<span><button onclick="checkFun('1')"  class="btn-green">审核通过</button></span>
       		<span><button onclick="checkFun('2')" class="btn-red">不予通过</button></span>
       </div>
  
</body>
</html>