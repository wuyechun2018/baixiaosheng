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



//点击"添加弹出框-保存按钮",提交表单
function submitForm(){
  if($("#addForm").form('validate')){
	$.ajax({
         type: "POST",
         url:'${ctx}/erpUser/save',
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

//重置密码
function resetPwd(){
	$.messager.confirm("删除确认", "您确认重置该用户的密码吗？(重置密码为：123456)", function (action) {
        if (action) {
			$.ajax({
		        type: "POST",
		        url:'${ctx}/erpUser/resetPwd',
		        data: {
		        	id:$('#id').val()
		        },
		        success: function (data) {
		        	$.messager.alert('提示信息',data.msg);
		        },
		        error: function(data) {
		            alert("error:"+data.responseText);
		         }
		  		});
        }
	}) 
}

//初始化登录名
function initLoginName(){
	$.messager.confirm("删除确认", "您确认初始化登录名操作吗？(有登录名的不进行初始化)", function (action) {
        if (action) {
			$.ajax({
		        type: "POST",
		        url:'${ctx}/user/initLoginName',
		        data: {
		        	
		        },
		        success: function (data) {
		        	$.messager.alert('提示信息',data.msg);
		        },
		        error: function(data) {
		            alert("error:"+data.responseText);
		         }
		  		});
        }
	})
}


//点击"添加按钮"
function addFun(){
	$('#addWin').panel({
		title : '添加',
		iconCls : "icon-add"
	});
	$('#addWin').window('open');
	$('#addForm').form('clear');
	var node=$('#leftTree').tree('getSelected');
	if(!node){
		node=$("#leftTree").tree('getRoot');
	}
	//加载部门下拉框树
	loadOrgTree();
	if(node){
		//给部门下拉框赋值
		$('#belongOrgComboTree').combotree('setValue', node.id);
	}
}

//加载弹出框公司下拉框树
function loadOrgTree(){
	//弹出框，单位下拉框树
	$('#belongOrgComboTree').combotree({
		url : '${ctx}/erpOrg/getListByPid?pid=0',
		onBeforeExpand : function(node, param) {
			   $('#belongOrgComboTree').combotree("tree").tree("options").url =ctx+ "/erpOrg/getListByPid?pid=" + node.id;
			},
		width:'180',
	    required: true,
	    onLoadSuccess : function(node, data) {
	    	$('#belongOrgComboTree').combotree("tree").tree('expandAll');
		},
		onSelect:function(node){
			
		}
	});
}

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
  	//加载公司下拉框树
	loadOrgTree();
    $('#addWin').window('open');
    $('#addWin').panel({
		title : '编辑',
		iconCls : "icon-edit"
	});
    $("#addForm").form("load", record); 
}

//点击“操作列-删除”
function deleteFun(id){
	$.messager.confirm("删除确认", "您确认删除该用户吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/erpUser/delete',
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


//查询
function doQuery(){
    var options = $("#dgTable").datagrid("options");
    //设置参数
    options.queryParams.orgId=SELECT_NODE_Id;
    options.queryParams.loginOrUserName=$('#loginOrUserName').val();
    options.queryParams.empNo=$('#empNo').val();
    options.queryParams.mobilePhone=$('#mobilePhone').val();
    options.queryParams.email=$('#email').val();
    $("#dgTable").datagrid(options);
}


//点击"角色分配"按钮
function addRole(){
	var rows = $("#dgTable").datagrid('getSelections');
	if (rows.length > 0) {
		 $('#roleWin').window('open');
		 var userId=rows[0].id;
		 $('#userId').val(rows[0].id);
		 $.ajax({
		        type: "POST",
		        url:'${ctx}/userRole/isSysAdmin',
		        data: {
		        	userId:userId
		        },
		        success: function (data) {
		       	  	if(data.success){
		       	  	 	 $('#radio_sysadmin_y').prop('checked', 'checked');
		       	  	}else{
		       	  		 $('#radio_sysadmin_n').prop('checked', 'checked');
		       	  	}
		        },
		        error: function(data) {
		            alert("error:"+data.responseText);
		         }
		  		});
		
	}else{
		 $.messager.alert("操作提示", "请选择一个用户！","warning");  
	}
}


//关闭"角色分配"窗口
function clearRoleForm(){
	$('#roleForm').form('clear');
	$('#roleWin').window('close');
}


//提交"角色分配"表单
function submitRoleForm(){
	$.ajax({
        type: "POST",
        url:'${ctx}/userRole/save',
        data: $('#roleForm').serialize(),
        success: function (data) {
       	    $('#roleWin').window('close');
		    //刷新列表
		    $("#dgTable").datagrid('reload');
        },
        error: function(data) {
            alert("error:"+data.responseText);
         }
  		});
}

/******************************页面开始******************************************/
 $(function(){
	 //主页面，左边树
	 $('#leftTree').tree({
			checkbox : false,
			url : '${ctx}/erpOrg/getListByPid?pid=0',
			method : 'post',
			onBeforeExpand : function(node, param) {
			   $('#leftTree').tree('options').url = ctx+ "/erpOrg/getListByPid?pid=" + node.id;
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
    $('#dgTable').datagrid({  
		url:ctx+'/erpUser/pagerList',
		method:'post',
	    queryParams: {
	    	orgId:'',
	    	loginOrUserName:'',
	    	empNo:'',
	    	mobilePhone:'',
	    	email:''
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
		          {field: 'ck', checkbox: true, width: '30' },
		          {field:'empNo',title: '工号',align: 'left',width: 100,hidden:false},
		          {field:'empName',title: '姓名',align: 'center',width: 100},
		          {field:'loginName',title: '登录账号',align: 'center',width: 100,hidden:false}, 
		          {field:'belongOrgName',title: '所属公司',align: 'center',width: 100}, 
		          {field:'empState',title: '员工状态',align: 'center',width: 100,hidden:false, formatter:function(val,rec){
			         if(val=='1'){
			        	  return '在职';
		        	   }else{
		        		  return '离职';
		        	   }
		          }}, 
		          {field:'mobilePhone',title: '手机号',align: 'center',width: 100}, 
		          {field:'email',title: '邮箱',align: 'center',width: 100},
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
    <div data-options="region:'west',split:false,border:true,title:'部门'" style="width: 240px; padding: 1px;">
        <div>
            <ul id="leftTree"></ul>
        </div>
    </div>
    <div data-options="region:'center'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">姓名/登录名:</td>
					<td style="width:200px;text-align: left;">
						<input id="loginOrUserName" name="loginOrUserName" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">工号:</td>
					<td style="width:200px;">
						<input id="empNo" name="empNo" style="width:150px">
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">办公电话/手机号:</td>
					<td style="width:200px;text-align: left;">
						<input id="mobilePhone" name="mobilePhone" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">邮箱:</td>
					<td style="width:200px;">
						<input id="email" name="email" style="width:150px">
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
	   <a href="javascript:void(0)" id="roleBtn" onclick="addRole()" class="easyui-linkbutton" plain="true"  iconCls="Userkey">角色分配</a>
 </div>
 
 <%--点击"添加"弹出的窗口 --%>
 <div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:630px;height:370px;padding:10px;">
	    <form id="addForm" method="post">
	    	<table  class="itable">
	    		<tr>
	    			<th style="width:160px;">所属公司：</th>
	    			<td>
	    				<!-- 主键 -->
	    				<input type="hidden" id="id" name="id" ></input>
	    				<!-- 数据状态-->
	    				<input type="hidden" id="dataState" name="dataState" ></input>
	    				<!-- 密码-->
	    				<input  type="hidden"  name="loginPwd" ></input>
	    				
	    				<%--
	    				<input type="hidden"  id="form_deptId"  name="deptId" ></input>
	    				<input style="width:180px;" class="easyui-textbox"  id="form_deptName" name="deptName" data-options="required:false" readonly="readonly"></input>
	    				 --%>
	    				<input id="belongOrgComboTree" name="belongOrgId"  />
	    			</td>
	    			
	    			<th>工号：</th>
	    			<td>
	    				<input style="width:180px;" class="easyui-textbox" type="text"  name="empNo" data-options="required:false"></input>
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<th>姓名：</th>
	    			<td>
	    				<input style="width:180px;"  class="easyui-textbox" type="text"  name="empName" ></input>
	    			</td>
	    			
	    			<th>登录账号：</th>
 					<td style="text-align: left;">
	 					<input style="width:180px;" class="easyui-textbox" type="text"  name="loginName" ></input>
 					</td>
	    			
	    		</tr>
	    		
	    		<tr>
	    			<th>邮箱：</th>
 					<td style="text-align: left;">
	 					<input style="width:180px;" class="easyui-textbox" type="text"  name="email" data-options="required:true"></input>
 					</td>
	    			<th>手机号：</th>
	    			<td>
	    				<input class="easyui-textbox" type="text"  name="mobilePhone" style="width:180px" />
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<th>是否在职：</th>
	    			<td>
	    				
						<input  type="radio" id="radio_empState_y" name="empState" value="1" checked="checked" />
						<label for="radio_empState_y">是</label>
						
						<input  type="radio" id="radio_empState_n" name="empState" value="0"  />
					    <label for="radio_empState_n" >否</label>
	    			
	    			</td>
	    		</tr>
	    		
	    		
	    		
	    		<tr>
	    		      <th>备注：</th>
	    		      <td colspan="6" align="center" style="padding:1px;"><textarea id="userDesc" name="userDesc" style="width:490px;height:80px;"></textarea></td> 
	    		 </tr> 
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<table style="width:100%;">
    		<tr>
    			<td style="width:20%;text-align: right;padding-left: 5px;padding-right: 5px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
    			<td style="width:20%;text-align: center;padding-left: 5px;padding-right: 5px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="resetPwd()">重置密码</a></td>
    			<td style="width:20%;text-align: left;padding-left: 5px;padding-right: 5px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">取消</a></td>
    		</tr>
		 	</table>
	    </div>
	   
		
	</div>

<%--点击"角色分配"弹出的窗口 --%>
<div id="roleWin" class="easyui-window" title="&nbsp;角色分配" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:460px;height:215px;padding:10px;">
   <form id="roleForm" method="post">
   	<table  class="isingelTable">
   		<tr>
   			<th>设为管理员：</th>
   			<td>
   				<input type="hidden" id="userId"  name="userId" value="1"></input>
   				
   				<input  type="radio" id="radio_sysadmin_n" name="sysadmin" value="0" checked="checked" />
			    <label for="radio_sysadmin_n" >否</label>
				<input  type="radio" id="radio_sysadmin_y" name="sysadmin" value="1" />
				<label for="radio_sysadmin_y">是</label>
   			</td>
   		<tr>
   	</table>
   </form>
    <div style="text-align:center;padding:25px 5px 5px 5px;">
    	<table style="width:100%;">
    		<tr>
    			<td style="width:50%;text-align: right;padding-right: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitRoleForm()">保存</a></td>
    			<td style="width:50%;text-align: left;padding-left: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearRoleForm()">取消</a></td>
    		</tr>
		 </table>
    </div>
</div> 
 
</body>
</html>