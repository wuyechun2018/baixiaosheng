<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>

<%--
<link rel="stylesheet" href="https://think.ctolog.com/static/plugs/bootstrap/css/bootstrap.min.css?ver=180209"/>
<link rel="stylesheet" href="https://think.ctolog.com/static/plugs/layui/css/layui.css?ver=180209"/>
<link rel="stylesheet" href="https://think.ctolog.com/static/theme/default/css/console.css?ver=180209">
<link rel="stylesheet" href="https://think.ctolog.com/static/theme/default/css/animate.css?ver=180209">
<link rel="stylesheet" href="https://think.ctolog.com/static/theme/default/css/login.css">
 --%>
<LINK href="${ctx}/resources/images/msg24.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/images/msg24.ico" type="image/x-icon" rel="shortcut icon">
<link rel="stylesheet" href="${ctx}/resources/sois/ncss/bootstrap.min.css"/>
<link rel="stylesheet" href="${ctx}/resources/sois/ncss/layui.css"/>
<link rel="stylesheet" href="${ctx}/resources/sois/ncss/console.css">
<link rel="stylesheet" href="${ctx}/resources/sois/ncss/animate.css">
<link rel="stylesheet" href="${ctx}/resources/sois/ncss/login.css">


<script type="text/javascript">
var ctx = "${ctx}";
</script> 
</head>
<body>
        
<div class="login-container full-height">

    <!-- 动态云层动画 开始 -->
    <div class="clouds-container">
        <div class="clouds clouds-footer"></div>
        <div class="clouds"></div>
        <div class="clouds clouds-fast"></div>
    </div>
    <!-- 动态云层动画 结束 -->

    <!-- 顶部导航条 开始 -->
    <div class="header">
        <span class="title notselect">
        	<%--欢迎登录 Think.Admin 后台管理 <sup>2.00 dev</sup> 
            <div style="padding-top:5px;font-size:28px;font-family: Microsoft YaHei">马鞍山公安局交警支队信息报送系统</div>
        	--%>
        </span>
        <ul>
            <!--<li class="notselect"><a href="javascript:void(0)" target="_blank">帮助</a></li>-->
            <li class="notselect">
            	<%--
                <a href="http://sw.bos.baidu.com/sw-search-sp/software/4bcf5e4f1835b/ChromeStandalone_54.0.2840.99_Setup.exe">
                    <b>推荐使用谷歌浏览器</b>
                </a>
                 --%>
            </li>
        </ul>
    </div>
    <!-- 顶部导航条 结束 -->

    <!-- 页面表单主体 开始 -->
    <div class="container" style="top:50%;margin-top:-300px">
        <form action="${ctx}/sois/doLogin" data-time="0.001" data-auto="true" method="post"
              class="content layui-form animated fadeInDown">
            <div class="people">
                <div class="tou"></div>
                <div id="left-hander" class="initial_left_hand transition"></div>
                <div id="right-hander" class="initial_right_hand transition"></div>
            </div>
            <ul>
                <li>
                    
                    <input required="required"  value="" name="username"
                           autofocus="autofocus" autocomplete="off" class="login-input username"
                           title="请输入用户名" placeholder="请输入用户名"/>
                </li>
                <li>
                   
                    <input required="required"  value="" name="password"
                           type="password" autocomplete="off" class="login-input password"
                           title="请输入密码" placeholder="请输入密码"/>
                </li>
                <li class="text-center">
                    <button type="submit" class="layui-btn " data-form-loaded="立 即 登 入">立 即 登 入</button>
                    <!--<a style="position:absolute;display:block;right:0" href="javascript:void(0)">忘记密码？</a>-->
                </li>
                <li>${SYSTEM_ERROR_MSG}</li>
            </ul>
        </form>
    </div>
    <!-- 页面表单主体 结束 -->

    <!-- 底部版权信息 开始 -->
        <div class="footer notselect">马鞍山公安局交警支队 联系电话：0555-2425010</div>
        <!-- 底部版本信息 结束 -->

</div>

        
<script>
  
</script>



</body>

</html>