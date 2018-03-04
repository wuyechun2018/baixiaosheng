<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>职位管理</title>
<script type="text/javascript">
//当前选中的左边树的节点ID,即单位ID，它是一个全局变量
var SELECT_NODE_Id="";

//查询操作
function doQuery(){
    var options = $("#dgTable").datagrid("options");
    //设置参数
    options.queryParams.deptId=SELECT_NODE_Id;
    options.queryParams.postName=$('#postName').val();
    options.queryParams.postCode=$('#postCode').val();
    $("#dgTable").datagrid(options);
}

//点击"添加按钮"
function addFun(){
	$('#addWin').window('open');
	$('#addForm').form('clear');
	var node=$('#leftTree').tree('getSelected');
	if(!node){
		node=$("#leftTree").tree('getRoot');
	}
	if(node){
		$("#form_deptId").val(node.id);
		$("#form_deptName").textbox('setValue',node.text)
		$("#form_dataState").val("1");
		$("#form_displayOrder").val("1");
	}
}

//点击"添加弹出框-保存按钮",提交表单
function submitForm(){
  if($("#addForm").form('validate')){
	$.ajax({
         type: "POST",
         url:'${ctx}/post/save',
         data: $('#addForm').serialize(),
         success: function (data) {
        	 $('#addWin').window('close');
		    //刷新列表
		    $("#dgTable").datagrid('reload');
         },
         error: function(data) {
             alert("error:"+data.responseText);
          }
   		});
   }
};

//点击"添加弹出框-取消按钮",提交表单
function clearForm(){
	$('#addForm').form('clear');
	$('#addWin').window('close');
}

//点击“操作列-修改”
function editFun(id) {
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
    $('#addWin').window('open');
    $("#addForm").form("load", record); 
}


//点击“操作列-删除”
function deleteFun(id){
	$.messager.confirm("删除确认", "删除后将不可恢复，您确认删除该职位吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/post/delete',
    			data:{
    				id:id
    			},
    			async: false,
    		    error: function(request) {
    		        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
    		    },
    		    success: function(data) {
    		    	$.messager.alert('提示信息',data.msg);
    		    	$("#dgTable").datagrid('reload');
    		    }
    		})
        }
      })
}

//页面初始化
$(function(){
	 $('#leftTree').tree({
			checkbox : false,
			url : '${ctx}/dept/getListByPid?pid=0',
			method : 'post',
			onBeforeExpand : function(node, param) {
			   $('#leftTree').tree('options').url = ctx+ "/dept/getListByPid?pid=" + node.id;
			},
			onClick : function(node) {
				//此处给全局变量赋值
				SELECT_NODE_Id=node.id;
				doQuery();
			},
			onLoadSuccess : function(node, data) {
				//默认展开根节点
				var rooNode = $("#leftTree").tree('getRoot');
				$("#leftTree").tree('expandAll');

			}
		});
	
	//中间表格
	var dgTableHeight=$(window).height()-$('.searchBox').height()-58;
    $('#dgTable').datagrid({  
		url:ctx+'/post/pagerList',
		method:'post',
	    queryParams: {
	    	deptId:'',
	    	postName:'',
	    	postCode:''
		},
		fit:false,
		pageSize: 20,
		height: dgTableHeight,
		fitColumns:true,
		striped: true,
		singleSelect:true,
		pagination: true,  
		rownumbers: true,  
		columns:[[
		          {field:'postName',title: '职位名称',align: 'left',width: 100},
		          {field:'postCode',title: '职位编码',align: 'left',width: 100},
		          {field:'deptId',title: '部门ID',align: 'center',width: 100,hidden:true}, 
		          {field:'deptName',title: '部门名称',align: 'center',width: 100}, 
		          {field:'postDesc',title: '职责',align: 'center',width: 100,formatter:function(val,rec){
		        	  return toolTipCol(val,rec);
		          }}, 
		          {field:'dataState',title: '职位',align: 'center',width: 100,hidden:true}, 
		          {field:'displayOrder',title: '排序',align: 'center',width: 100,hidden:true},
		          {field:'id',title: '操作',align: 'center',width: 100, formatter:function(val,rec){
		        	  return "<span class='btn_a_edit'><a href='javascript:void(0)' onclick=editFun('"+val+"') >编辑</a></span>|<span class='btn_a_delete'><a href='javascript:void(0)' onclick=deleteFun('"+val+"') >删除</a></span>";
		          }}
		]]
		,toolbar:$('#tb')
	  });
    
 });
	
</script>
</head>
<body>
<div class="easyui-layout"  fit="true">
    <%-- 左边树 --%>
    <div data-options="region:'west',split:false,border:true,title:'部门信息'" style="width: 240px; padding: 1px;">
        <div>
            <ul id="leftTree"></ul>
        </div>
    </div>
    
     <%-- 右边表格 --%>
    <div data-options="region:'center',title:'职位列表'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">职位名称:</td>
					<td style="width:200px;text-align: left;">
						<input id="postName" name="postName" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">职位编码:</td>
					<td style="width:200px;">
						<input id="postCode" name="postCode" style="width:150px">
					</td>
					<td>&nbsp;</td>
					<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" iconCls="Zoom">查询</a></td>
				</tr>
			</table>
            
        </fieldset>
        <table id="dgTable">
        </table>
    </div>
 </div> 
 
<%--TBar 添加按钮 --%>
<div id="tb">
	    <a href="javascript:void(0)" id="addBtn" onclick="addFun()" class="easyui-linkbutton" plain="true"  iconCls="Applicationadd">添加</a>
</div>

<%--点击"添加"弹出的窗口 --%>
<div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:460px;height:345px;padding:10px;">
   <form id="addForm" method="post">
   	<table  class="isingelTable">
   		<tr>
   			<th>所属部门：</th>
   			<td>
   				<input type="hidden"  id="form_deptId"  name="deptId" ></input>
   				<input type="hidden" id="form_dataState"  name="dataState" value="1"></input>
   				<%--
   				<input type="hidden" id="form_displayOrder"  name="displayOrder" value="1"></input>
   				 --%>
   				<input style="width:250px;"  class="easyui-textbox" type="text" id="form_deptName" name="deptName" data-options="required:false"></input>
   			</td>
   		<tr>
   	
   		<tr>
   			<th>职位名称：</th>
   			<td>
   				<input type="hidden" id="form_id" name="id" ></input>
   				<input style="width:250px;"  class="easyui-textbox" type="text"  name="postName" data-options="required:true"></input>
   			</td>
   		</tr>
   		
   		<tr>
   			<th>职位编码：</th>
   			<td>
   				<input style="width:250px;"  class="easyui-textbox" type="text"  name="postCode" data-options="required:false"></input>
   			</td>
   		<tr>
   		
   		<tr>
   			<th>排序：</th>
   			<td>
   				<input style="width:250px;"  class="easyui-textbox" type="text" id="form_displayOrder"  name="displayOrder" data-options="required:false"></input>
   			</td>
   		<tr>
   		
   		<tr>
   		      <th>职责：</th>
   		      <td colspan="6" align="center" style="padding:1px;">
   		      	<textarea name="postDesc" style="width:248px;height:80px;">
   		      </textarea></td> 
   		 </tr> 
   	</table>
   </form>
    <div style="text-align:center;padding:25px 5px 5px 5px;">
    	<table style="width:100%;">
    		<tr>
    			<td style="width:50%;text-align: right;padding-right: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
    			<td style="width:50%;text-align: left;padding-left: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">取消</a></td>
    		</tr>
		 </table>
    </div>
</div>

 
  
</body>
</html>