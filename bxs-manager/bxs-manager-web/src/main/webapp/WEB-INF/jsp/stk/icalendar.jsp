<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<c:set var="isAdmin" value="${sessionScope.SESSION_USER_IS_ADMIN}"/> 
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
   <meta content="" name="wuyechun" />
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
   
    <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="${resCtx}/assets/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
   
   
   <!-- BEGIN THEME LAYOUT STYLES -->
   <link href="${resCtx}/assets/layouts/layout2/css/layout.min.css" rel="stylesheet" type="text/css" />
   <link href="${resCtx}/assets/layouts/layout2/css/themes/blue.min.css" rel="stylesheet" type="text/css" id="style_color" />
   <link href="${resCtx}/assets/layouts/layout2/css/custom.min.css" rel="stylesheet" type="text/css" />
   <!-- END THEME LAYOUT STYLES -->
    <link href="${resCtx}/assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
    <!--日历  -->
    <link href="${resCtx}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
   
   
    <!--自定义CSS,覆盖原 layout.min.css  -->
    <link href="${resCtx}/assets/layouts/layout2/css/iLayout.css" rel="stylesheet" type="text/css" />
  
   
   
   
   <link rel="shortcut icon" href="favicon.ico" /> 
   
 <style type="text/css">
			.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>
   
   
   
</head>
<!-- END HEAD -->

    <body class=" page-sidebar-closed-hide-logo page-container-bg-solid">
       
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                     <div class="row">
                        <div class="col-md-12">
                          	<div class="portlet light">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-layers font-green"></i>
                                        <span class="caption-subject font-green sbold uppercase">记上一笔</span>
                                    </div>
                                    
                                </div>
                                <div class="portlet-body">
                                     <div id='calendar'></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                       <div class="row">
                        <div class="col-md-12">
                          	<div class="portlet light">
                               
                                 <div class="portlet-body form">
                                                <!-- BEGIN FORM-->
                                                <form action="javascript:void(0)" class="form-horizontal" id="addForm">
                                                    <div class="form-body">
                                                    	 
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label">日期</label>
                                                            <div class="col-md-5">
                                                            	<input type="hidden" class="form-control"  id="bizId" name="id" >
                                                                <input type="text" class="form-control"  id="bizDay" name="bizDay" placeholder="">
                                                            </div>
                                                        </div>
                                
                                						<div class="form-group">
                                                            <label class="col-md-3 control-label">我的心情</label>
                                                            <div class="col-md-5">
                                                                <div class="mt-radio-inline">
			                                                        <label class="mt-radio">
			                                                            <input type="radio" name="bizState" id="bizState_1" value="1" checked="checked"> 开心
			                                                            <span></span>
			                                                        </label>
			                                                        <label class="mt-radio">
			                                                            <input type="radio" name="bizState" id="bizState_2" value="2" > 难过
			                                                            <span></span>
			                                                        </label>
			                                                        <label class="mt-radio">
			                                                            <input type="radio" name="bizState" id="bizState_3" value="3" >麻木
			                                                            <span></span>
			                                                        </label>
                                                    			</div>
                                                            </div>
                                                        </div>
                                
                                						
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label">我想说的</label>
                                                            <div class="col-md-5">
                                                                <textarea rows="6" name="bizDesc" id="bizDesc" class="form-control"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-actions">
                                                        <div class="row">
                                                            <div class="col-md-offset-4 col-md-8">
                                                            
                                                                <button type="submit" onclick="submitForm()" class="btn btn-lg green">保存</button>
                                                               
                                                                &nbsp;
                                                                <button type="button" onclick="deleteCalendar()" class="btn btn-danger">删除</button>
                                                                
                                                               
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                </form>
                                                <!-- END FORM-->
                                            </div>
                            </div>
                        </div>
                    </div>
                    
                   
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            
            
          
		
		 
            
            
           
        </div>
        <!-- END CONTAINER -->
        
           
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
            
          
  			
  			<!-- 表单验证 -->
  			<script type="text/javascript" src="${ctx}/resources/js-lib/bootstrap-validator-0.5.3/js/bootstrapValidator.min.js"></script> 
  			<!--消息框 --> 
  			<script src="${resCtx}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
  			
  			<!-- 日历控件 -->
  			<script src="${resCtx}/assets/global/plugins/fullcalendar/lib/moment.min.js" type="text/javascript"></script>
  			<script src="${resCtx}/assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
  			<script src="${resCtx}/assets/global/plugins/fullcalendar/lang/zh-cn.js" type="text/javascript"></script>
  			
  			<!-- 日期控件 -->
  			<script src="${resCtx}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
  			<script src="${resCtx}/assets/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
  			
  			
  
  			 <script type="text/javascript">
         		$(function(){
         			
         			//日历
      			 	 $('#calendar').fullCalendar( {
      		                    editable: false,
      		                   	height:200,
      		                    eventLimit: true, 
      		                   	handleWindowResize:false,
      		                    events: function(start,end,timezone, callback){
      		                      var curMonth = this.getDate().format('YYYY-MM');
      		                      $.ajax({
      		                    	type : "POST",
      		    					 url : '${ctx}/bizCalendar/list',
      		                          data: {
      		                         		month:curMonth
      		                          },
      		                          success: function(data) { 
      		                             	 var events = [];
	      		                             for(var i=0;i<data.length;i++){
		      	    							  var eventObj=new Object();
		      	    							  eventObj.id=data[i].id;
		      	    							  eventObj.bizState=data[i].bizState;
		      	    							  eventObj.start=data[i].bizDay;
		      	    							  eventObj.bizDesc=data[i].bizDesc;
		      	    							  eventObj.title=(data[i].bizDesc).length>10?(data[i].bizDesc.substr(0,10)+"..."):data[i].bizDesc;
		      	    							  if(data[i].bizState=='1'){
		      	    								  eventObj.backgroundColor='#D91E18';
		      	    							  }else if(data[i].bizState=='2'){
		      	    								  eventObj.backgroundColor='#26C281';
		      	    							  }else{
		      	    								  eventObj.backgroundColor='#95A5A6';
		      	    							  }
		      	    							events.push(eventObj);
	      	    						  	}
	      		                           callback(events);
      		                          }
      		                          })
      		                       
      		                    },
      		                  eventClick: function(calEvent, jsEvent, view) {
      		                	  //填充表单
      		                	  $('#bizId').val(calEvent.id);
    		                	  $('#bizDay').val(calEvent.start.format('YYYY-MM-DD'));
    		                	  $('#bizDesc').val(calEvent.bizDesc);
    		                	  var bizState=calEvent.bizState;
    		                	  if(bizState=='1'){
    		                		$('#bizState_1').prop('checked', 'checked');
    		                	  }else if(bizState=='2'){
    		                		$('#bizState_2').prop('checked', 'checked');
    		                	  }else{
    		                		$('#bizState_3').prop('checked', 'checked');
    		                	  }
      		                	  
      		                  }
      		           } );
      			 	
         			
         			
         			
         			
         			  
         			 //日期选择 
         			 $("#bizDay").datepicker({
         	            language: "zh-CN",
         	            autoclose: true,
         	            todayBtn: true,
         	            format: "yyyy-mm-dd"
         	        });
         			 //设置为当天
         			$('#bizDay').datepicker('setDate', new Date());
         			
         			$('#addForm').bootstrapValidator({
				　　　　　　　　message: 'This value is not valid',
				            　	    feedbackIcons:{
								valid: 'glyphicon glyphicon-ok',
								invalid: 'glyphicon glyphicon-remove',
				                　　　　　　　　      validating:'glyphicon glyphicon-refresh'
				            　　　　　　　　   },
				            fields: {
				            	bizDay: {
				                    message: '日期验证失败',
				                    validators: {
				                        notEmpty: {
				                            message: '请填写日期'
				                        }
				                    }
				                },
				                bizDesc: {
				                    message: '请填写一些你想说的吧',
				                    validators: {
				                        notEmpty: {
				                            message: '请填写一些你想说的吧'
				                        }
				                    }
				                }
				            }
				        });	
         			 
         			  
         			
         		})		
  			 
         		
         	//提交表单
		    function submitForm(){
		    	var data=$("#addForm").data('bootstrapValidator').validate();
		    	if (data.isValid()) {
					$.ajax({
						type : "POST",
						url : '${ctx}/bizCalendar/save',
						data : $('#addForm').serialize(),
						success : function(data) {
							var objMsg=data.msg;
							bootbox.alert({ 
								  size: "small",
								  title: "提示",
								  message: "保存成功", 
								  callback: function(){
									  $('#calendar'). fullCalendar ( 'refetchEvents' ); 
									  //清空表单
									  $('#addForm')[0].reset();
									  //设置为当天
					         		  $('#bizDay').datepicker('setDate', new Date());
									 //重新启用提交按钮
									 $('#addForm').bootstrapValidator('disableSubmitButtons', false);  
								  }
								})
						},
						error : function(data) {
							alert("error:" + data.responseText);
						}
					});
				}
		    }
         		
         	//删除	
         	function deleteCalendar(){
         		 bootbox.confirm({
			    	    message: "确定删除这条记录吗？",
			    	    buttons: {
			    	        confirm: {
			    	            label: '确定',
			    	            className: 'btn-success'
			    	        },
			    	        cancel: {
			    	            label: '取消',
			    	            className: 'btn-danger'
			    	        }
			    	    },
			    	    callback: function (result) {
			    	    	  if(result){
			    	    		  $.ajax({
			    						type : "POST",
			    						url : '${ctx}/bizCalendar/delete',
			    						data : {
			    							id:$('#bizId').val()
			    						},
			    						success : function(data) {
			    							$('#calendar').fullCalendar('removeEvents',$('#bizId').val())
			    							/*
			    							bootbox.alert({ 
			    								  size: "small",
			    								  title: "提示",
			    								  message: "删除成功", 
			    								  callback: function(){
			    									  $('#calendar').fullCalendar('removeEvents',$('#bizId').val())
			    								  }
			    								})*/
			    						},
			    						error : function(data) {
			    							alert("error:" + data.responseText);
			    						}
			    					});
			                   }
			    	    }
			    	});
         		
         	}	
  			 
  			 
  			 </script>
  	
  
    </body>

</html>