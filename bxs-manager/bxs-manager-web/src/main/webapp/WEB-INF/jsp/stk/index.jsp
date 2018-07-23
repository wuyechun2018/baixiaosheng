<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<c:set var="resCtx" value="${pageContext.request.contextPath}/resources/stk/metronic-4.7"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--[if IE 8]> <html  class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html  class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
 <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   <title>Sitaoke.vip</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta content="width=device-width, initial-scale=1" name="viewport" />
   <meta content="#1 selling multi-purpose bootstrap admin theme sold in themeforest marketplace packed with angularjs, material design, rtl support with over thausands of templates and ui elements and plugins to power any type of web applications including saas and admin dashboards. Preview page of Theme #2 for blank page layout"
       name="description" />
   <meta content="" name="author" />
   <!-- BEGIN GLOBAL MANDATORY STYLES -->
   <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
   <link href="${resCtx}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <link href="${resCtx}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
   <link href="${resCtx}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <link href="${resCtx}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
   <!-- END GLOBAL MANDATORY STYLES -->
   <!-- BEGIN THEME GLOBAL STYLES -->
   <link href="${resCtx}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
   <link href="${resCtx}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
   <!-- END THEME GLOBAL STYLES -->
   <!-- BEGIN THEME LAYOUT STYLES -->
   <link href="${resCtx}/assets/layouts/layout2/css/layout.min.css" rel="stylesheet" type="text/css" />
   <link href="${resCtx}/assets/layouts/layout2/css/themes/blue.min.css" rel="stylesheet" type="text/css" id="style_color" />
   <link href="${resCtx}/assets/layouts/layout2/css/custom.min.css" rel="stylesheet" type="text/css" />
   <!-- END THEME LAYOUT STYLES -->
   <link rel="shortcut icon" href="favicon.ico" /> 
</head>
<!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid">
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="index.html">
                        <img src="${resCtx}/assets/layouts/layout2/img/logo-default-w.png" alt="logo" class="logo-default" /> </a>
                    <div class="menu-toggler sidebar-toggler">
                        <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
                    </div>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN PAGE ACTIONS -->
                <div class="page-actions">
                    <div class="btn-group">
                        <button type="button" class="btn btn-circle btn-outline red dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-plus"></i>&nbsp;
                            <span class="hidden-sm hidden-xs">新增&nbsp;</span>&nbsp;
                            <i class="fa fa-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="javascript:;">
                                    <i class="icon-docs"></i> 新邮件 </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <i class="icon-tag"></i> 新评论 </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <i class="icon-share"></i> 共享 </a>
                            </li>
                            <li class="divider"> </li>
                            <li>
                                <a href="javascript:;">
                                    <i class="icon-flag"></i> 评论
                                    <span class="badge badge-success">4</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <i class="icon-users"></i> 回馈
                                    <span class="badge badge-danger">2</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END PAGE ACTIONS -->
                <!-- BEGIN PAGE TOP -->
                <div class="page-top">
                    <!-- BEGIN HEADER SEARCH BOX -->
                    <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
                    <form class="search-form search-form-expanded" action="page_general_search_3.html" method="GET">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="查询..." name="query">
                            <span class="input-group-btn">
                                <a href="javascript:;" class="btn submit">
                                    <i class="icon-magnifier"></i>
                                </a>
                            </span>
                        </div>
                    </form>
                    <!-- END HEADER SEARCH BOX -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                            <!-- BEGIN NOTIFICATION DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class below "dropdown-extended" to change the dropdown styte -->
                            <!-- DOC: Apply "dropdown-hoverable" class after below "dropdown" and remove data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to enable hover dropdown mode -->
                            <!-- DOC: Remove "dropdown-hoverable" and add data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to the below A element with dropdown-toggle class -->
                            <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="icon-bell"></i>
                                    <span class="badge badge-default"> 7 </span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="external">
                                        <h3>
                                            <span class="bold">12 pending</span> notifications</h3>
                                        <a href="page_user_profile_1.html">view all</a>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">just now</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-success">
                                                            <i class="fa fa-plus"></i>
                                                        </span> New user registered. </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">3 mins</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-danger">
                                                            <i class="fa fa-bolt"></i>
                                                        </span> Server #12 overloaded. </span>
                                                </a>
                                            </li>
                                           
                                           
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <!-- END NOTIFICATION DROPDOWN -->
                            <!-- BEGIN INBOX DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="icon-envelope-open"></i>
                                    <span class="badge badge-default"> 4 </span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="external">
                                        <h3>你有
                                            <span class="bold">7 新</span> 信息</h3>
                                        <a href="app_inbox.html">查看全部</a>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                                            <li>
                                                <a href="#">
                                                    <span class="photo">
                                                        <img src="${resCtx}/assets/layouts/layout2/img/avatar2.jpg" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Lisa Wong </span>
                                                        <span class="time">Just Now </span>
                                                    </span>
                                                    <span class="message"> Vivamus sed auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo">
                                                        <img src="${resCtx}/assets/layouts/layout2/img/avatar3.jpg" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Richard Doe </span>
                                                        <span class="time">16 mins </span>
                                                    </span>
                                                    <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                                                </a>
                                            </li>
                                          
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <!-- END INBOX DROPDOWN -->
                            <!-- BEGIN TODO DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="icon-calendar"></i>
                                    <span class="badge badge-default"> 3 </span>
                                </a>
                                <ul class="dropdown-menu extended tasks">
                                    <li class="external">
                                        <h3>You have
                                            <span class="bold">12 待完成</span> 任务</h3>
                                        <a href="app_todo.html">查看全部</a>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">New release v1.2 </span>
                                                        <span class="percent">30%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 40%;" class="progress-bar progress-bar-success" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">40% Complete</span>
                                                        </span>
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">Application deployment</span>
                                                        <span class="percent">65%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 65%;" class="progress-bar progress-bar-danger" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">65% Complete</span>
                                                        </span>
                                                    </span>
                                                </a>
                                            </li>
                                          
                                          
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <!-- END TODO DROPDOWN -->
                            <!-- BEGIN 用户登录 DROPDOWN -->
                            <li class="dropdown dropdown-user">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <img alt="" class="img-circle" src="${resCtx}/assets/layouts/layout2/img/avatar3_small.jpg" />
                                    <span class="username username-hide-on-mobile"> Wuyechun </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                    <li>
                                        <a href="page_user_profile_1.html">
                                            <i class="icon-user"></i> 个人信息 </a>
                                    </li>
                                    <li>
                                        <a href="app_calendar.html">
                                            <i class="icon-calendar"></i> 我的日程 </a>
                                    </li>
                                    <li>
                                        <a href="app_inbox.html">
                                            <i class="icon-envelope-open"></i> 我的邮箱
                                            <span class="badge badge-danger"> 3 </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="app_todo_2.html">
                                            <i class="icon-rocket"></i> 我的任务
                                            <span class="badge badge-success"> 7 </span>
                                        </a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="page_user_lock_1.html">
                                            <i class="icon-lock"></i>锁屏 </a>
                                    </li>
                                    <li>
                                        <a href="page_user_login_1.html">
                                            <i class="icon-key"></i> 登出 </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END 用户登录 DROPDOWN -->
                          
                        </ul>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
                <!-- END PAGE TOP -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                <!-- END SIDEBAR -->
               <div class="page-sidebar navbar-collapse collapse">
                    <!-- BEGIN 目录 -->
                   <ul class="page-sidebar-menu  page-header-fixed page-sidebar-menu-hover-submenu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                        <li class="nav-item start ">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title">工作面板</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item start ">
                                    <a href="index.html" class="nav-link ">
                                        <i class="icon-bar-chart"></i>
                                        <span class="title">Dashboard 1</span>
                                    </a>
                                </li>
                                
                            </ul>
                        </li>
						<li class="nav-item  active open">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-layers"></i>
                                <span class="title">Page Layouts</span>
                                <span class="selected"></span>
                                <span class="arrow open"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item  active open">
                                    <a href="layout_blank_page.html" class="nav-link ">
                                        <span class="title">Blank Page</span>
                                        <span class="selected"></span>
                                    </a>
                                </li>
                               
                            </ul>
                        </li>
                   </ul>
                    <!-- END 目录 -->
                </div>
                <!-- END SIDEBAR -->
            </div>
            <!-- END 工具栏 -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                  
                    <h1 class="page-title"> Blank Page Layout
                        <small>blank page layout</small>
                    </h1>
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index.html">首页</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Blank Page</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <span>Page Layouts</span>
                            </li>
                        </ul>
                      
                    </div>
                    <!-- END PAGE HEADER-->
                    <div class="note note-info">
                        <p> A black page template with a minimal </p>
                    </div>
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
           
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="page-footer">
            <div class="page-footer-inner"> 2018 &copy; Sitaoke.vip
                <a target="_blank" href="">Wuyechun</a> &nbsp;|&nbsp;
                <a href="" title="free" target="_blank">联系我们</a>
                <div class="scroll-to-top">
                    <i class="icon-arrow-up"></i>
                </div>
            </div>
		</div>
            <!-- END FOOTER -->
           
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
            <!-- BEGIN THEME GLOBAL SCRIPTS -->
            <script src="${resCtx}/assets/global/scripts/app.min.js" type="text/javascript"></script>
            <!-- END THEME GLOBAL SCRIPTS -->
            <!-- BEGIN THEME LAYOUT SCRIPTS -->
            <script src="${resCtx}/assets/layouts/layout2/scripts/layout.min.js" type="text/javascript"></script>
            <script src="${resCtx}/assets/layouts/layout2/scripts/demo.min.js" type="text/javascript"></script>
            <script src="${resCtx}/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
            <script src="${resCtx}/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
            <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>