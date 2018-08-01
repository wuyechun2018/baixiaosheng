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
   
    <!--自定义CSS,覆盖原 layout.min.css  -->
    <link href="${resCtx}/assets/layouts/layout2/css/iLayout.css" rel="stylesheet" type="text/css" />
    <!--ZTree CSS  -->
    <link href="${ctx}/resources/stk/js-lib/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <!-- 表单验证CSS -->
    <link href="${ctx}/resources/js-lib/bootstrap-validator-0.5.3/css/bootstrapValidator.min.css" rel="stylesheet" type="text/css" />
   
   
   
   
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
                            <!-- BEGIN PROFILE SIDEBAR -->
                            <div class="profile-sidebar">
                                <!-- PORTLET MAIN -->
                                <div class="portlet light ">
                               		<div class="portlet-title">
	                                    <div class="caption">
	                                        <i class="icon-equalizer font-red-sunglo"></i>
	                                        <span class="caption-subject font-red-sunglo bold uppercase">Tree</span>
	                                    </div>
	                                    <div class="actions">
                                            <div class="portlet-input input-inline input-small">
                                                <div class="input-icon right">
                                                    <i class="icon-magnifier"></i>
                                                    <input type="text" class="form-control input-circle" placeholder="搜索..."> </div>
                                            </div>
                                       </div>
                               	 	</div>
                               	 	<div class="portlet-body">
                                   		<div class="scroller" style="height: 500px; overflow: auto; width: auto;" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd" data-initialized="1">
											<ul id="leftTree" class="ztree"></ul>
										</div>
                                	</div>
                               
                                </div>
                                <!-- END PORTLET MAIN -->
                            </div>
                            <!-- END BEGIN PROFILE SIDEBAR -->
                            <!-- BEGIN PROFILE CONTENT -->
                            <div class="profile-content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="portlet light ">
                                           <div class="portlet-title">
                                                <div class="caption">
                                                    <i class="icon-equalizer font-red-sunglo"></i>
                                                    <span class="caption-subject font-red-sunglo bold uppercase">Form Sample</span>
                                                    <span class="caption-helper"></span>
                                                </div>
                                               
                                            </div>
                                            <div class="portlet-body form">
                                                <!-- BEGIN FORM-->
                                                <form action="javascript:void(0)" class="form-horizontal" id="addForm">
                                                    <div class="form-body">
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label">节点名称</label>
                                                            <div class="col-md-4">
                                                            	<input type="hidden" class="form-control"  id="nodeId" name="id" >
                                                            	<input type="hidden" class="form-control"  id="nodePid" name="pid">
                                                            	<input type="hidden" class="form-control"  id="typeCode" name="typeCode">
                                                            	<input type="hidden" class="form-control"  id="typeName" name="typeName">
                                                            	<input type="hidden" class="form-control"  id="dataState" name="dataState">
                                                            	<input type="hidden" class="form-control"  id="createDate" name="createDate">
                                                            	<input type="hidden" class="form-control"  id="updateDate" name="updateDate">
                                                            	
                                                            	
                                                            	
                                                                <input type="text" class="form-control"  id="bizNodeName" name="bizNodeName" placeholder="">
                                                                <!-- 
                                                                <span class="help-block">节点名称 </span>
                                                                 -->
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label">节点代码</label>
                                                            <div class="col-md-4">
                                                               <input type="text" class="form-control" id="bizNodeCode" name="bizNodeCode" placeholder=""/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label">描述信息</label>
                                                            <div class="col-md-4">
                                                                <textarea rows="4" name="nodeDesc" id="nodeDesc" class="form-control"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-actions">
                                                        <div class="row">
                                                            <div class="col-md-offset-3 col-md-9">
                                                                <button type="submit" onclick="submitForm()" class="btn green">保存</button>
                                                                <button type="button" class="btn default">取消</button>
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
                            <!-- END PROFILE CONTENT -->
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
            
            <!--ZTree树  -->
            <script src="${ctx}/resources/stk/js-lib/ztree-v3.5.36/jquery.ztree.core.min.js" type="text/javascript"></script>
  			<script src="${ctx}/resources/stk/js-lib/ztree-v3.5.36/jquery.ztree.exedit.min.js" type="text/javascript"></script>
  			
  			<!-- 表单验证 -->
  			<script type="text/javascript" src="${ctx}/resources/js-lib/bootstrap-validator-0.5.3/js/bootstrapValidator.min.js"></script> 
  			
  			
  
  			 <script type="text/javascript">
   
		   var setting = {
		   		async: {
		   			enable: true,
		   			url:'${ctx}/bizNode/getTreeNodeList',
					otherParam:{"otherParam":"zTreeAsyncTest"},
					autoParam: ["id=pId"]
		   		},
		   		callback: {
		   			onMouseDown: zTreeOnMouseDown,
		   			onAsyncSuccess: zTreeOnAsyncSuccess,
		   			onRightClick: OnRightClick,
		   			beforeRemove: beforeRemove,
					beforeRename: beforeRename
		   		},
		   		edit: {
					enable: true
					,selectedMulti:false
					//,editNameSelectAll: true
					//,showRemoveBtn: showRemoveBtn
					//,showRenameBtn: showRenameBtn
				},
		   		view: {
						fontCss: getFont,
						nameIsHTML: true,
						addHoverDom: addHoverDom,
						removeHoverDom: removeHoverDom
					},
					data: {
						key: {
							title: "title"
						}
					}
		   	};
		   
		   var newCount = 1;
		   function addHoverDom(treeId, treeNode) {
			   var sObj = $("#" + treeNode.tId + "_span");
				if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
				var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
					+ "' title='新增' onfocus='this.blur();'></span>";
				sObj.after(addStr);
				var btn = $("#addBtn_"+treeNode.tId);
				if (btn) btn.bind("click", function(){
					var zTree = $.fn.zTree.getZTreeObj("leftTree");
					zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
					return false;
				});
		   }
		   
		    function removeHoverDom(treeId, treeNode) {
		    	$("#diyBtn_"+treeNode.id).unbind().remove();
		    	$("#diyBtn_space_" +treeNode.id).unbind().remove();
		   }
		   
			function showRemoveBtn(treeId, treeNode) {
				return !treeNode.isFirstNode;
			}
			function showRenameBtn(treeId, treeNode) {
				return !treeNode.isLastNode;
			}
			
			//删除节点之前
			function beforeRemove(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("leftTree");
				zTree.selectNode(treeNode);
				return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
			}	
			//更改节点名称之前
			function beforeRename(treeId, treeNode, newName) {
				if (newName.length == 0) {
					setTimeout(function() {
						var zTree = $.fn.zTree.getZTreeObj("leftTree");
						zTree.cancelEditName();
						alert("节点名称不能为空.");
					}, 0);
					return false;
				}else{
					$.ajax({
						type : "POST",
						url : '${ctx}/bizNode/save',
						data : {
							bizNodeName:newName,
							typeCode:'stock',
							dataState:'1',
							pid:treeNode.pId
						},
						success : function(data) {
							//var zTree=$.fn.zTree.getZTreeObj("leftTree");
							//zTree.reAsyncChildNodes(null, "refresh");
							
						},
						error : function(data) {
							alert("error:" + data.responseText);
						}
					});
				}
				return true;
			}

		   
		   
		   //节点点击事件
		  	function zTreeOnMouseDown(event, treeId, treeNode) {
		  		if(treeNode){
		  			$('#nodeId').val(treeNode.id);
                	$('#nodePid').val(treeNode.pId);
                	$('#bizNodeName').val(treeNode.name);
                	if(typeof(treeNode.attribute) == "undefined"){
                		$('#typeCode').val(treeNode.attribute.typeCode);
                    	$('#typeName').val(treeNode.attribute.typeName);
                    	$('#dataState').val(treeNode.attribute.dataState);
                    	$('#createDate').val(treeNode.attribute.createDate);
                    	$('#updateDate').val(treeNode.attribute.updateDate);
    		  			$('#bizNodeCode').val(treeNode.attribute.nodeCode);
    		  			$('#nodeDesc').val(treeNode.attribute.nodeDesc);
                	}
                
                	
		  		}
		  	}
		   
			//树加载成功
		   	function zTreeOnAsyncSuccess(event, treeId, treeNode){
		   		if(!treeNode){
		   			var zTree=$.fn.zTree.getZTreeObj("leftTree");
		            var node=zTree.getNodeByParam("pId","-1",null);
		            zTree.expandNode(node,true,true,true);
		   		}
		   		
		   	}
			
		   //自定义节点字体样式
		   	function getFont(treeId, node) {
		   		var obj={"font-weight":"normal"};
				return obj;
			}
		  
		    //右击
		   	function OnRightClick(event, treeId, treeNode) {
				
			}
		
		    
		    //提交表单
		    function submitForm(){
		    	var data=$("#addForm").data('bootstrapValidator').validate();
				if (data.isValid()) {
					$.ajax({
						type : "POST",
						url : '${ctx}/bizNode/save',
						data : $('#addForm').serialize(),
						success : function(data) {
							var zTree=$.fn.zTree.getZTreeObj("leftTree");
							zTree.reAsyncChildNodes(null, "refresh");
							
							
							//$('#modal-msg').html(data.msg);
							//$('#myModal').modal('show');
						},
						error : function(data) {
							alert("error:" + data.responseText);
						}
					});
				}
		    }
		   
		   
		   	$(function(){
		   		 $.fn.zTree.init($("#leftTree"), setting);
		   		 $('#addForm').bootstrapValidator({
				　　　　　　　　message: 'This value is not valid',
				            　	 feedbackIcons:{
								valid: 'glyphicon glyphicon-ok',
								invalid: 'glyphicon glyphicon-remove',
				                　　　　　　　　      validating:'glyphicon glyphicon-refresh'
				            　　　　　　　　   },
				            fields: {
				            	bizNodeName: {
				                    message: '节点名称验证失败',
				                    validators: {
				                        notEmpty: {
				                            message: '节点名称不能为空'
				                        }
				                    }
				                },
				                bizNodeCode: {
				                    message: '节点编码验证失败',
				                    validators: {
				                        notEmpty: {
				                            message: '节点编码不能为空'
				                        }
				                    }
				                }
				            }
				        });	
		   	
		   	})
   </script>
  	
  
    </body>

</html>