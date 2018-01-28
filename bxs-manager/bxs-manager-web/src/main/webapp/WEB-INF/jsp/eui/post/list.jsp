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
    dgTable=$('#dgTable').datagrid({  
		url:ctx+'/post/pagerList',
		method:'post',
	    queryParams: {
	    	deptId:'',
	    	loginOrUserName:'',
	    	userType:''
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
		          {field:'postDesc',title: '职责',align: 'center',width: 100}, 
		          {field:'dataState',title: '职位',align: 'center',width: 100,hidden:true}, 
		          {field:'displayOrder',title: '排序',align: 'center',width: 100,hidden:true},
		          {field:'id',title: '操作',align: 'center',width: 100, formatter:function(val,rec){
		        	  return "<span class='btn_a_edit'><a href='javascript:void(0)' onclick=editFun('"+val+"') >编辑</a></span>|<span class='btn_a_delete'><a href='javascript:void(0)' onclick=deleteFun('"+val+"') >删除</a></span>";
		          }}
		]]
		,toolbar:$('#tb')
	  });
 })
	
</script>
</head>
<body>
<div class="easyui-layout"  fit="true">
    <div data-options="region:'west',split:true,title:'部门信息'" style="width: 240px; padding: 1px;">
        <div>
            <ul id="leftTree"></ul>
        </div>
    </div>
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
    
    <div id="tb">
	    <a href="#" id="add" class="easyui-linkbutton" plain="true"  iconCls="Applicationadd">添加</a>
	</div>
    
 </div>  
</body>
</html>