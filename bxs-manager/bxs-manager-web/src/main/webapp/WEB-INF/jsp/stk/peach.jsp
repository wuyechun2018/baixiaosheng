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
                	<h1 class="page-title font-red-thunderbird"> 
                			知根知底，才能信手拈来
                         	 <small class="font-green-jungle">相信统计学的力量</small>
                    </h1>
                     <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN PROFILE SIDEBAR -->
                            <div class="profile-sidebar">
                                <!-- PORTLET MAIN -->
                                <div class="portlet light ">
                               		<div class="portlet-title">
	                                    <div class="caption">
	                                        <i class="fa fa-tree"></i>
	                                        <span class="caption-subject  bold uppercase">树信息</span>
	                                    </div>
	                                    <div class="actions">
                                            <div class="portlet-input input-inline input-small">
                                                <div class="input-icon right">
                                                    <i class="icon-magnifier"></i>
                                                    <input type="text" id="key" onchange="doSearch()" class="form-control input-circle" placeholder="搜索..."> </div>
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
                                                    <i class="fa fa-cloud "></i>
                                                    <span class="caption-subject  bold uppercase">基本信息</span>
                                                    <span class="caption-helper"></span>
                                                </div>
                                               
                                            </div>
                                            <div class="portlet-body form">
                                                <!-- BEGIN FORM-->
                                                <form action="javascript:void(0)" class="form-horizontal" id="addForm">
                                                    <div class="form-body">
                                                    	 <div class="form-group">
                                                            <label class="col-md-3 control-label">上级节点</label>
                                                            <div class="col-md-4">
                                                               <input type="text" class="form-control" id="parentNodeName" name="parentNodeName" readonly placeholder=""/>
                                                            </div>
                                                        </div>
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
                                                    <c:if test="${sessionScope.SESSION_USER_IS_ADMIN==true}">
                                                    <div class="form-actions">
                                                        <div class="row">
                                                            <div class="col-md-offset-3 col-md-9">
                                                            	<button type="button" onclick="addNode()" class="btn green-meadow">新增</button>
                                                            	&nbsp;
                                                                <button type="submit" onclick="submitForm()" class="btn green">保存</button>
                                                               
                                                                &nbsp;
                                                                <button type="button" onclick="deleteNode()" class="btn btn-danger">删除</button>
                                                                
                                                                <!-- 
                                                                 &nbsp;
                                                                <button type="button" class="btn default">取消</button>
                                                                 -->
                                                                
                                                                 &nbsp;
                                                                <button type="button" onclick="addTips()" class="btn yellow-crusta">添加标签</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                </form>
                                                <!-- END FORM-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                           
                           		<div class="row" id="myTips">
                               </div>
                           
                            </div>
                            <!-- END PROFILE CONTENT -->
                        </div>
                    </div>
                    
                    
                    
                   
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            
            
           <div class="modal fade" tabindex="-1" role="dialog" id="myModal">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">提示信息</h4>
			      </div>
			      <div class="modal-body">
			        <p id="modal-msg"></p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
			      </div>
			    </div>
			  </div>
		</div>
		
		
		 <div class="modal fade" tabindex="-1" role="dialog" id="addTipsModal">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">添加标签</h4>
			      </div>
			      <div class="modal-body">
			        	<form action="javascript:void(0)" class="form-horizontal" id="addTipForm">
                                                    <div class="form-body">
                                                    	<div class="form-group">
                                                            <label class="col-md-3 control-label">节点</label>
                                                            <div class="col-md-7">
                                                            	<input type="text" class="form-control" id="mainNodeName" name="mainNodeName" readonly/>
                                                            </div>
                                                        </div>
                                                    
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label">标签</label>
                                                            <div class="col-md-7">
                                                            	<input type="hidden" class="form-control"  id="bizNodeExtend" name="id" >
                                                            	<input type="hidden" class="form-control"  id="mainNodeId" name="mainNodeId">
                                                               	
                                                               	<input type="text" class="form-control" id="attrKey" name="attrKey" placeholder=""/>
                                                            </div>
                                                        </div>
                                                        
                                                         <div class="form-group">
                                                            <label class="col-md-3 control-label">描述信息</label>
                                                            <div class="col-md-7">
                                                                <textarea rows="4"  id="attrValue" name="attrValue" class="form-control"></textarea>
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                    
                              </form>
			        
			        
			      </div>
			      <div class="modal-footer">
			      	<button type="submit" class="btn green" onclick="submitTipForm()">保存</button>
			        <button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
			      </div>
			    </div>
			  </div>
		</div>
            
            
            
           
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
  			<script src="${ctx}/resources/stk/js-lib/ztree-v3.5.36/jquery.ztree.exhide.js" type="text/javascript"></script>
  			<script src="${ctx}/resources/stk/js-lib/ztree-v3.5.36/fuzzysearch.js" type="text/javascript"></script>
  			
  			
  			<!-- 表单验证 -->
  			<script type="text/javascript" src="${ctx}/resources/js-lib/bootstrap-validator-0.5.3/js/bootstrapValidator.min.js"></script> 
  			<!--消息框 --> 
  			<script src="${resCtx}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
  			
  
  			 <script type="text/javascript">
          //当前选中的Node的Id    
  		  var curNodeId=0; 
          var isAdmin="${isAdmin}";
  			 
		   var setting = {
		   		async: {
		   			enable: true,
		   			url:'${ctx}/bizNode/getTreeNodeList',
					otherParam:{"otherParam":"zTreeAsyncTest"},
					autoParam: ["id=pId"]
		   		},
		   		callback: {
		   			onMouseDown: zTreeOnMouseDown,
		   			onAsyncSuccess: zTreeOnAsyncSuccess
		   		},
		   		edit: {
					enable: false
					,selectedMulti:false
				},
		   		view: {
						fontCss: getFont,
						nameIsHTML: true,
						showIcon: showIconForTree
						
					},
					data: {
						key: {
							title: "title"
						}
					}
		   	};
		   
		   function doSearch(){
			   fuzzySearch('leftTree','#key',null,true);
		   }
		   
		   
		   
		   //不显示图标
		   function showIconForTree(treeId, treeNode) {
				return !treeNode.isParent;
			};

		   
		   //加载表单
		   function loadForm(treeNode){
			  	var parentNode=treeNode.getParentNode();
			  	if(parentNode!=null){
			  		$('#parentNodeName').val(parentNode.name);
			  	}
	  			$('#nodeId').val(treeNode.id);
	           	$('#nodePid').val(treeNode.pId);
	           	$('#bizNodeName').val(treeNode.name);
	           	if(typeof(treeNode.attribute) != "undefined"){
	           		$('#typeCode').val(treeNode.attribute.typeCode);
	               	$('#typeName').val(treeNode.attribute.typeName);
	               	$('#dataState').val(treeNode.attribute.dataState);
	               	$('#createDate').val(treeNode.attribute.createDate);
	               	$('#updateDate').val(treeNode.attribute.updateDate);
			  		$('#bizNodeCode').val(treeNode.attribute.nodeCode);
			  		$('#nodeDesc').val(treeNode.attribute.nodeDesc);
	           	}
		   }
		   
		   //加载节点附属信息
		   function loadNodeExtend(treeNode){
			   $.ajax({
					type : "POST",
					url : '${ctx}/bizNodeExtend/list',
					data :{
						mainNodeId:treeNode.id
					},
					success : function(data) {
						$('#myTips').html('');
						var colorArray=["ribbon-color-primary","ribbon-color-success","ribbon-color-danger","ribbon-color-warning"];
						for(var i=0;i<data.length;i++){
							var delHTML="";
							//有管理员权限，显示删除按钮
							if(isAdmin){
								delHTML="<a onclick=\"delTips('"+data[i].id+"')\" href=\"javascript:void(0)\"><i style=\"color:red\" class=\"fa fa-trash-o fa-fw fa-1x\"></i></a>";
							}
							var colorIndex=i%4;
							var tipsHTML="<div class=\"col-xs-12\">\n" +
								"      <div class=\"mt-element-ribbon bg-grey-steel\">\n" + 
								"            <div class=\"ribbon ribbon-shadow "+colorArray[colorIndex]+" uppercase\">"+data[i].attrKey+"</div>\n" + 
								"               <p class=\"ribbon-content\">"+data[i].attrValue+delHTML+"</p>\n" + 
								"      </div>\n" + 
								"</div>";
							$('#myTips').append(tipsHTML);
						}
					},
					error : function(data) {
						alert("error:" + data.responseText);
					}
				});
		   }
		
		   
		    //节点点击事件
		  	function zTreeOnMouseDown(event, treeId, treeNode) {
		  		if(treeNode){
		  			curNodeId=treeNode.id;
		  			//加载节点表单
		  			loadForm(treeNode);
		  			//加载附属信息
		  			loadNodeExtend(treeNode);
		  		}
		  	}
		   
			//树加载成功
		   	function zTreeOnAsyncSuccess(event, treeId, treeNode){
		   		if(!treeNode){
		   			var zTree=$.fn.zTree.getZTreeObj("leftTree");
		           	 var node=zTree.getNodeByParam("pId","-1",null);
		            zTree.expandNode(node,true,true,true);
		            //从展开第一层调整到展开全部
		            zTree.expandAll(true);
		   		}
		   		
		   	}
			
		    //自定义节点字体样式
		   	function getFont(treeId, node) {
		   		var obj={"font-weight":"normal"};
				return obj;
			}
		    
		    //新增节点
		    function addNode(){
		    	var zTree=$.fn.zTree.getZTreeObj("leftTree");
		    	var nodes = zTree.getSelectedNodes();
		    	if(nodes.length>0){
		    		$("#addForm")[0].reset();
		    		var parentNode=nodes[0];
		    		$('#parentNodeName').val(parentNode.name);
		    		$('#nodeId').val('');
		    		$('#nodePid').val(parentNode.id);
		    		$('#typeCode').val('stock');
		    		$('#dataState').val('1');
		    		
		    	}else{
		    		$('#modal-msg').html('请选择上级节点');
					
		    	}
		    	
		    }
		    //删除节点
		    function deleteNode(){
		    	var zTree=$.fn.zTree.getZTreeObj("leftTree");
		    	var nodes = zTree.getSelectedNodes();
		    	if(nodes.length>0){
		    		var node=nodes[0];
		    		var parentNode=node.getParentNode();
		    		 bootbox.confirm({
				    	    message: "确定删除该节点吗？",
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
					   						url : '${ctx}/bizNode/delete',
					   						data : {id:node.id},
					   						success : function(data) {
					   							$('#modal-msg').html('成功删除节点['+node.name+"]");
					   							$('#myModal').modal('show');
					   							var zTree=$.fn.zTree.getZTreeObj("leftTree");
					   							//zTree.reAsyncChildNodes(null, "refresh");
					   							zTree.reAsyncChildNodes(parentNode, "refresh");
					   						},
					   						error : function(data) {
					   							alert("error:" + data.responseText);
					   						}
					   					});
				                   }
				    	    }
				    	});
		    	}else{
		    		$('#modal-msg').html('请选择要删除的节点');
					$('#myModal').modal('show');
		    	}
		    }
		    
		    //添加标签
		    function addTips(){
		    	$('#addTipForm')[0].reset();
		    	$('#addTipsModal').modal('show');
		    	$('#mainNodeId').val(curNodeId);
		    	
		    	var zTree=$.fn.zTree.getZTreeObj("leftTree");
	            var node=zTree.getNodeByParam("id",curNodeId,null);
		    	$('#mainNodeName').val(node.name);
		    	
		    	
		    }
		    
		    //删除标签
		    function delTips(id){
		    	bootbox.confirm({
		    	    message: "确定删除该标签吗？",
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
		       					url : '${ctx}/bizNodeExtend/delete',
		       					data : {
		       						  id:id						
		       						},
		       					success : function(data) {
		       						var zTree=$.fn.zTree.getZTreeObj("leftTree");
		       						var node=zTree.getNodeByParam("id",curNodeId,null);
		       						//加载附属信息
		       			  			loadNodeExtend(node);
		       						
		       					}
		       		    	})
		                   }
		    	    }
		    	});
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
							
							$('#modal-msg').html('保存成功！');
							$('#myModal').modal('show');
							
							var zTree=$.fn.zTree.getZTreeObj("leftTree");
					    	var nodes = zTree.getSelectedNodes();
					    	var parentNode=nodes[0].getParentNode();
					    	zTree.reAsyncChildNodes(parentNode, "refresh");
					    	zTree.reAsyncChildNodes(nodes[0], "refresh");
					    	zTree.expandNode(nodes[0], true, true, true);
					    	zTree.expandNode(parentNode, true, true, true);
							
							//重新启用提交按钮
							$('#addForm').bootstrapValidator('disableSubmitButtons', false);  
							
						},
						error : function(data) {
							alert("error:" + data.responseText);
						}
					});
				}
		    }
		    
		    
		    
		    //提交标签（扩展属性）表单
		    function submitTipForm(){
		    	//var data=$("#addTipForm").data('bootstrapValidator').validate();
				//data.isValid()
		    	if (true) {
					$.ajax({
						type : "POST",
						url : '${ctx}/bizNodeExtend/save',
						data : $('#addTipForm').serialize(),
						success : function(data) {
							$('#addTipsModal').modal('hide');
							
							//$('#modal-msg').html('保存成功！');
							//$('#myModal').modal('show');
							
							//重新启用提交按钮
							$('#addTipForm').bootstrapValidator('disableSubmitButtons', false);
							
							
							var zTree=$.fn.zTree.getZTreeObj("leftTree");
							var node=zTree.getNodeByParam("id",curNodeId,null);
							//加载附属信息
				  			loadNodeExtend(node);
							
							
						},
						error : function(data) {
							alert("error:" + data.responseText);
						}
					});
				}
		    }
		   
		   
		   	$(function(){
		   		 $.fn.zTree.init($("#leftTree"), setting);
		   		 //采用bootstrapValidator对表单进行验证
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