<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<c:set var="resCtx" value="${pageContext.request.contextPath}/resources/stk/metronic-4.7"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--[if IE 8]> <html  class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html  class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>Sitaoke.vip</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="#1 selling multi-purpose bootstrap admin theme sold in themeforest marketplace packed with angularjs, material design, rtl support with over thausands of templates and ui elements and plugins to power any type of web applications including saas and admin dashboards. Preview page of Theme #2 for "
            name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="${resCtx}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${resCtx}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${resCtx}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${resCtx}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${resCtx}/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="${resCtx}/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${resCtx}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${resCtx}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="${resCtx}/assets/pages/css/login.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->

    <body class=" login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="${ctx}/fan/index">
            	 <span style="color:white;font-size:25px;">SITAOKE</span>
            	 <span style="color:#F7CA18;font-size:25px;">.</span>
            	 <span style="color:red;font-size:25px;">VIP</span>
            	<%--
                <img src="${resCtx}/assets/pages/img/logo-big.png" alt="" />
                 --%>
                </a>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form class="login-form" action="${ctx}/stk/doLogin" method="post">
                <h3 class="form-title font-green">登录</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span> 请输入用户名（手机号）和密码 </span>
                </div>
                
                 <c:if test="${!empty SYSTEM_ERROR_MSG}">
                 	<div class="alert alert-danger">
	                    <button class="close" data-close="alert"></button>
	                    <span> ${SYSTEM_ERROR_MSG} </span>
                	</div>
              	</c:if>
                
                
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">用户名/手机号</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名或手机号" name="username" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password" /> </div>
                <div class="form-actions">
                    <button type="submit" class="btn green uppercase">登录</button>
                    <label class="rememberme check mt-checkbox mt-checkbox-outline">
                        <input type="checkbox" name="remember" value="1" />记住我
                        <span></span>
                    </label>
                    <a href="javascript:;" id="forget-password" class="forget-password">忘记密码？</a>
                </div>
                <%--
                <div class="login-options">
                    <h4>Or login with</h4>
                    <ul class="social-icons">
                        <li>
                            <a class="social-icon-color facebook" data-original-title="facebook" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color twitter" data-original-title="Twitter" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color googleplus" data-original-title="Goole Plus" href="javascript:;"></a>
                        </li>
                        <li>
                            <a class="social-icon-color linkedin" data-original-title="Linkedin" href="javascript:;"></a>
                        </li>
                    </ul>
                </div>
                 --%>
                <div class="create-account">
                    <p>
                        <a href="javascript:;" id="register-btn" class="uppercase">用户注册</a>
                    </p>
                </div>
            </form>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <form class="forget-form" action="javascript:void(0)" method="post" id="forgetPwdForm">
                <h3 class="font-green">忘记密码 ?</h3>
                <p id="forget_pwd_tips"> 请输入您注册时用的邮箱以便于我们重置您的密码. </p>
                <div class="form-group">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="邮箱地址" name="email" /> </div>
                <div class="form-actions">
                    <button type="button" id="back-btn" class="btn green btn-outline">回退</button>
                    <button type="submit" class="btn btn-success uppercase pull-right">重置密码</button>
                </div>
            </form>
            <!-- END FORGOT PASSWORD FORM -->
            <!-- BEGIN REGISTRATION FORM -->
            <form class="register-form" action="javascript:void(0)" method="post" id="registerForm">
                <h3 class="font-green">注册</h3>
                 <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span id="register-msg"> 请输入用户名（手机号）和密码 </span>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">手机号</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="手机号" name="mobilePhone" /> </div>
                
                 <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">邮箱</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="邮箱" name="email" /> </div>
                
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">登录名</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="登录名" name="loginName" /> </div>
              
                
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="密码" name="loginPassword" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Re-type Your Password</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="再次输入密码" name="rloginPassword" /> </div>
                <div class="form-group margin-top-20 margin-bottom-20">
                    <label class="mt-checkbox mt-checkbox-outline">
                        <input type="checkbox" name="tnc" />  我已阅读并同意网站的 
                        <a href="javascript:;">使用条件 </a> 及
                        <a href="javascript:;"> 隐私声明 </a>
                        <span></span>
                    </label>
                    <div id="register_tnc_error"> </div>
                </div>
                <div class="form-actions">
                    <button type="button" id="register-back-btn" class="btn green btn-outline">回退</button>
                    <button type="submit" id="register-submit-btn" class="btn btn-success uppercase pull-right">提交</button>
                </div>
            </form>
            <!-- END REGISTRATION FORM -->
        </div>
        <div class="copyright"> 2018 © Sitaoke.vip </div>
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<script src="../assets/global/plugins/ie8.fix.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="${resCtx}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="${resCtx}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${resCtx}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="${resCtx}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="${resCtx}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="${resCtx}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${resCtx}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${resCtx}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="${resCtx}/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="${resCtx}/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${resCtx}/assets/pages/scripts/login.min.stk.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        
        <script type="text/javascript">
        	var ctx="${ctx}";
        </script>
    </body>

</html>