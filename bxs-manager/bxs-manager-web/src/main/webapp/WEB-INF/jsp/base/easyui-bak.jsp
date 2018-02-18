<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<LINK href="${ctx}/resources/images/favicon.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--
<link href="${ctx}/resources/js-lib/jquery-easyui-1.4.3/themes/metro/easyui.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/js-lib/jquery-easyui-1.4.3/themes/icon.css" rel="stylesheet" media="screen">
 --%>
<link href="${ctx}/resources/css/grid.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/css/base.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/mine-icons/css/icons.css" rel="stylesheet" media="screen">


</head>


<body>
<script type="text/javascript">
var ctx = "${ctx}";
var docWidth=0;
var docHeight=0;
if(document.documentElement.clientWidth == 0){
	if(document.body){
		docWidth=document.body.clientWidth;
	}
}else{
	docWidth=document.documentElement.clientWidth;
}

if(document.documentElement.clientWidth == 0){
	if(document.body){
		docHeight=document.body.clientHeight;
	}
}else{
	docHeight= document.documentElement.clientHeight;
}

var euiVersion="jquery-easyui-1.4.3";
var ua = window.navigator.userAgent;
if(ua.indexOf('MSIE 7') != -1 || ua.indexOf('MSIE 8') != -1){
	euiVersion="jquery-easyui-1.4.3";
}else{
	euiVersion="jquery-easyui-1.4.3";
}

document.write('<link href="${ctx}/resources/js-lib/'+euiVersion+'/themes/metro/easyui.css" rel="stylesheet" media="screen">');
document.write('<link href="${ctx}/resources/js-lib/'+euiVersion+'/themes/icon.css" rel="stylesheet" media="screen">');
document.write('<link href="${ctx}/resources/css/grid.css" rel="stylesheet" media="screen">');

document.write('<script type="text/javascript" src="${ctx}/resources/js-lib/'+euiVersion+'/jquery.min.js"><\/script>');
document.write('<script type="text/javascript" src="${ctx}/resources/js-lib/'+euiVersion+'/jquery.easyui.min.js"><\/script>');
document.write('<script type="text/javascript" src="${ctx}/resources/js-lib/'+euiVersion+'/locale/easyui-lang-zh_CN.js"><\/script>');


</script>

<%--
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
 --%>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery-easyui-1.4.3/jquery.easyui.iplugin.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/base.js"></script>

</body>
</html>