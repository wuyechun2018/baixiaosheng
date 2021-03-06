<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>公司管理</title>
<script type="text/javascript">

//点击"添加"按钮事件
function addNodeFun(){
	var node=$('#leftTree').tree('getSelected');
	if(!node){
		node=$("#leftTree").tree('getRoot');
	}
	if(node){
		//增加
		$('#rightForm').form('clear');
		//节点主键
		$("#parentOrgId").val(node.id);
	}else{
		$.messager.alert('提示',"请选择父栏目");
	}
	
}

//点击"删除"按钮事件
function delNodeFun(){
	var node=$('#leftTree').tree('getSelected');
	if(node){
		$.messager.confirm("删除确认", "删除后将不可恢复，您确认删除选定的公司吗？", function (action) {
            if (action) {
            	$.ajax({
        			cache: true,
        			type: "POST",
        			url:'${ctx}/erpOrg/delete',
        			data:{
        				id:node.id
        			},
        			async: false,
        		    error: function(request) {
        		        alert("Connection error");
        		    },
        		    success: function(data) {
        		    	$.messager.alert('提示',data.msg);
        		    	$("#leftTree").tree("options").url='${ctx}/dept/getListByPid?pid=0' 
        		        $("#leftTree").tree("reload");
        		    	$('#rightForm').form('clear');
        		    }
        		
        		})
            }
            })
	}else{
		$.messager.alert('提示',"请选择要删除的公司");
	}
	
}

//点击节点事件
function clickNodeFun(node){
	debugger;
	//点击事件
    //注意,此处是 "easyui-textbox",不能用jquery的赋值方法
    $("#id").val(node.id);
    $("#parentOrgId").val(node.attributes.parentOrgId);
    $("#orgName").textbox('setValue',node.text);
    $("#orgCode").textbox('setValue',node.attributes.orgCode);
    $("#orgDesc").textbox('setValue',node.attributes.orgDesc);
    $("#contactAddress").textbox('setValue',node.attributes.contactAddress);
    $("#contactEmail").textbox('setValue',node.attributes.contactEmail);
    $("#contactMobile").textbox('setValue',node.attributes.contactMobile);
    $("#orgLeaderId").combobox('setValue',node.attributes.orgLeaderId);
    
    
    $('#displayOrder').textbox('setValue',node.attributes.displayOrder);
    $('#dataState').val(node.attributes.dataState);
}

//提交表单
function submitForm(){
    if($("#rightForm").form('validate')){  
	 $.ajax({
	        type: "POST",
	        url:'${ctx}/erpOrg/save',
	        data: $('#rightForm').serialize(),
	        success: function (data) {
	        	$.messager.alert('提示',data.msg);
	        	$("#leftTree").tree("options").url='${ctx}/erpOrg/getListByPid?pid=0' 
	            $("#leftTree").tree("reload");
	        },
	        error: function(data) {
	            alert("error:"+data.responseText);
	         }
	    });
   }
}

$(function() {
		//加载权限菜单树
		$('#leftTree').tree({
					checkbox : false,
					url : '${ctx}/erpOrg/getListByPid?pid=0',
					method : 'post',
					onBeforeExpand : function(node, param) {
					   $('#leftTree').tree('options').url = ctx+ "/erpOrg/getListByPid?pid=" + node.id;
					},
					onClick : function(node) {
						   clickNodeFun(node);
					},
					onLoadSuccess : function(node, data) {
						//默认展开根节点
						var rooNode = $("#leftTree").tree('getRoot');
						$("#leftTree").tree('expandAll');

					},
					onContextMenu: function(e, node){ 
                        e.preventDefault();  
                    }
					
				});
	})
</script>



</head>
<body>
<div class="easyui-layout" style="width:700px;height:700px;" fit="true">
        <div data-options="region:'west',split:true,title:'部门信息'" style="width: 240px; padding: 1px;">
            <div>
             <ul id="leftTree"></ul>
            </div>
        </div>
        <div id="tb" data-options="region:'center',title:'部门属性'" style="padding:5px;height:auto">                
            <div style="padding:10px 60px 20px 60px">
		    <form id="rightForm" method="post">
		    	<table cellpadding="5" width="360px;" style="table-layout: fixed;">
		    		<tr>
		    			<td class="form-label-right-align">公司名称：</td>
		    			<td>
		    				<input type="hidden" name="id"  id="id"></input>
		    				<input type="hidden" name="parentOrgId"  id="parentOrgId"></input>
		    				<input type="hidden" name="dataState"  id="dataState"></input>
		    				
		    				<input class="easyui-textbox" type="text" id="orgName" name="orgName" data-options="required:true" style="width:100%;"></input>
		    			</td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="form-label-right-align">公司编码：</td>
		    			<td><input class="easyui-textbox" type="text" id="orgCode" name="orgCode"  style="width:100%;"></input></td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="form-label-right-align">公司地址：</td>
		    			<td><input class="easyui-textbox" id="contactAddress" name="contactAddress" data-options="multiline:true" style="width:100%;height:40px"></input></td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="form-label-right-align">公司邮箱：</td>
		    			<td><input class="easyui-textbox" type="text" id="contactEmail" name="contactEmail"  style="width:100%;"></input></td>
		    		</tr>
		    		
		    	    <tr>
		    			<td class="form-label-right-align">公司电话：</td>
		    			<td><input class="easyui-textbox" type="text" id="contactMobile" name="contactMobile"  style="width:100%;"></input></td>
		    		</tr>
		    		
		    		
		    		<tr>
		    			<td class="form-label-right-align">公司负责人：</td>
		    			<td><input class="easyui-combobox" type="text" id="orgLeaderId" name="orgLeaderId"  style="width:100%;" data-options="valueField:'id',textField:'text',url:'${ctx}/erpUser/getUserComboboxData'"></input></td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="form-label-right-align">排序：</td>
		    			<td><input class="easyui-numberbox" type="text" id="displayOrder" name="displayOrder"  data-options="required:true,validType:'integer'" style="width:100%;"></input></td>
		    		</tr>
		    		<tr>
		    			<td class="form-label-right-align">备注：</td>
		    			<td><input class="easyui-textbox" id="orgDesc" name="orgDesc" data-options="multiline:true" style="width:100%;height:60px"></input></td>
		    		</tr>
		    		
		    	</table>
		    </form>
		    <div style="text-align:center;padding-top:15px">
		    	<table>
		    		<tr>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Pageadd'" id="addBtn" class="easyui-linkbutton" onclick="addNodeFun()">添加公司</a></td>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Applicationdelete'" id="delBtn" class="easyui-linkbutton" onclick="delNodeFun()">删除</a></td>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">取消</a></td>
		    		</tr>
		    	</table>
		    </div>
	    </div>
        </div>
    </div>
    
    <div id="mm" class="easyui-menu" style="display: none;">
 		 <div id="mm-tabclose" data-options="iconCls:'Applicationadd'" name="add">添加</div>
 	</div>

</body>
</html>