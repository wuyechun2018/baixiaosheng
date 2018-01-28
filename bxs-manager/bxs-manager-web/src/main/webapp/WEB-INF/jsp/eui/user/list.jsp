<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>用户管理</title>
<script type="text/javascript">
//当前选中的左边树的节点ID,即单位ID，它是一个全局变量
var SELECT_NODE_Id="";

function doQuery(){
    var options = $("#dgTable").datagrid("options");
    //设置参数
    options.queryParams.deptId=SELECT_NODE_Id;
    options.queryParams.loginOrUserName=$('#loginOrUserName').val();
    options.queryParams.postName=$('#postName').val();
    options.queryParams.postName=$('#telephone').val();
    options.queryParams.birthday=$('#birthday').val();
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
	var dgTableHeight=$(window).height()-$('.searchBox').height()-28;
    dgTable=$('#dgTable').datagrid({  
		url:ctx+'/user/pagerList',
		method:'post',
	    queryParams: {
	    	deptId:'',
	    	loginOrUserName:'',
	    	postName:'',
	    	telephone:'',
	    	birthday:''
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
		          {field:'loginName',title: '登录名',align: 'left',width: 100,hidden:false,},
		          {field:'userName',title: '姓名',align: 'left',width: 100},
		          {field:'deptId',title: '部门ID',align: 'center',width: 100,hidden:true,}, 
		          {field:'deptName',title: '部门名称',align: 'center',width: 100}, 
		          {field:'postId',title: '职位ID',align: 'center',width: 100,hidden:true,}, 
		          {field:'postName',title: '职位',align: 'center',width: 100}, 
		          {field:'officeTelephone',title: '办公电话',align: 'center',width: 100},
		          {field:'mobileTelephone',title: '手机号',align: 'center',width: 100}, 
		          {field:'birthday',title: '生日',align: 'center',width: 100},
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
    <div data-options="region:'west',split:true,title:'部门'" style="width: 240px; padding: 1px;">
        <div>
            <ul id="leftTree"></ul>
        </div>
    </div>
    <div data-options="region:'center'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">姓名:</td>
					<td style="width:200px;text-align: left;">
						<input id="loginOrUserName" name="loginOrUserName" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">职位:</td>
					<td style="width:200px;">
						<input id="postName" name="postName" style="width:150px">
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">办公电话/手机号:</td>
					<td style="width:200px;text-align: left;">
						<input id="telephone" name="telephone" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">生日:</td>
					<td style="width:200px;">
						<input id="birthday" name="birthday" style="width:150px">
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