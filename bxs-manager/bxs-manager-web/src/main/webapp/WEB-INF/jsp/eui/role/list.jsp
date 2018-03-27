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
         url:'${ctx}/user/euiSave',
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
		        url:'${ctx}/user/resetPwd',
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
	var node=$('#menuTree').tree('getSelected');
	if(!node){
		node=$("#menuTree").tree('getRoot');
	}
	//生日默认为当天
	$('#birthday_form').datebox('setValue',myDateFormatter(new Date()));
	//加载部门下拉框树
	loadDeptTree();
	
	if(node){
		//给部门下拉框赋值
		$('#deptComboTree').combotree('setValue', node.id);
		$('#form_postId').combobox('reload', ctx+'/post/getPostByDeptId?deptId='+node.id);
	}
}

//加载部门下拉框树
function loadDeptTree(){
	$('#deptComboTree').combotree({
		url : '${ctx}/dept/getListByPid?pid=0',
		onBeforeExpand : function(node, param) {
			   $('#deptComboTree').combotree("tree").tree("options").url =ctx+ "/dept/getListByPid?pid=" + node.id;
			},
		width:'180',
	    required: true,
	    onLoadSuccess : function(node, data) {
	    	$('#deptComboTree').combotree("tree").tree('expandAll');
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
  	//加载部门下拉框树
	loadDeptTree();
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
    			url:'${ctx}/user/euiDelete',
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
    options.queryParams.deptId=SELECT_NODE_Id;
    options.queryParams.loginOrUserName=$('#loginOrUserName').val();
    options.queryParams.postName=$('#postName').val();
    options.queryParams.telephone=$('#telephone').val();
    options.queryParams.birthday=$('#birthday').val();
    $("#dgTable").datagrid(options);
}

 $(function(){
	 $('#menuTree').tree({
			checkbox : false,
			url : '${ctx}/sysmenu/getListByPid?pid=0',
			method : 'post',
			checkbox:true,
			onBeforeExpand : function(node, param) {
			   $('#menuTree').tree('options').url = ctx+ "/sysmenu/getListByPid?pid=" + node.id;
			},
			onClick : function(node) {
				//此处给全局变量赋值
				SELECT_NODE_Id=node.id;
				doQuery();
			},
			onLoadSuccess : function(node, data) {
				//默认展开根节点
				var rooNode = $("#menuTree").tree('getRoot');
				$("#menuTree").tree('expandAll');

			}
		});
	
	 //中间表格
	var dgTableHeight=$(window).height()-$('.searchBox').height()-18;
    $('#dgTable').datagrid({  
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
		          {field:'loginName',title: '登录名',align: 'left',width: 100,hidden:true},
		          {field:'userName',title: '角色名称',align: 'center',width: 100},
		          {field:'deptId',title: '部门ID',align: 'center',width: 100,hidden:true}, 
		          {field:'deptName',title: '角色编码',align: 'center',width: 100}
		]]
		,toolbar:$('#tb')
	  });
    
     $('#pemissionsTab').tabs({ 
    		width: '100%', 
    		height: $(window).height()-5 
    	}); 
    
 })
	
</script>
</head>
<body>
<div class="easyui-layout"  fit="true">
    <div data-options="region:'west',split:false,border:false" style="width: 500px; padding: 1px;">
        <div>
        	<table style="width:100%;padding:8px 0" class="searchBox">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">角色名称:</td>
					<td style="width:200px;text-align: left;">
						<input id="telephone" name="telephone" style="width:150px">
					</td>
					
					<td>&nbsp;</td>
					<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" iconCls="Zoom">查询</a></td>
				</tr>
			</table>
            <table id="dgTable">
        	</table>
        </div>
    </div>
    <div data-options="region:'center',split:false,border:false" style="padding:1px;height:auto">
        	<div class="easyui-tabs" id="pemissionsTab" style="width:100%;height:auto">
		        <div title="系统权限" iconCls="Groupadd" style="padding:10px;">
	            	<div>
	            		<ul class="easyui-tree" data-options="url:'${ctx}/resources/data/permissions.json',method:'get',animate:true,checkbox:true"></ul>
	        		</div>
		        </div>
		        <div title="菜单权限" iconCls="Applicationsidelist" closable="true" style="padding:10px;">
		           <div>
             			<ul id="menuTree"></ul>
            		</div>
		        </div>
    		</div>
        
    </div>
 </div>  
 
 <%--TBar 添加按钮 --%>
 <div id="tb">
	   <a href="javascript:void(0)" id="addBtn" onclick="addFun()" class="easyui-linkbutton" plain="true"  iconCls="Applicationadd">添加</a>
 </div>
 
 <%--点击"添加"弹出的窗口 --%>
 <div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:630px;height:370px;padding:10px;">
	    <form id="addForm" method="post">
	    	<table  class="itable">
	    		<tr>
	    			<th style="width:160px;">部门：</th>
	    			<td>
	    				<input type="hidden" id="id" name="id" ></input>
	    				<%--
	    				<input type="hidden"  id="form_deptId"  name="deptId" ></input>
	    				<input style="width:180px;" class="easyui-textbox"  id="form_deptName" name="deptName" data-options="required:false" readonly="readonly"></input>
	    				 --%>
	    				<input id="deptComboTree" name="deptId"  />
	    			</td>
	    			
	    			<th>职位：</th>
	    			<td>
	    				<%--
	    				<select class="easyui-combobox" id="postId" name="postId" style="width:180px;">
	    				</select>
	    				 --%>
	    				
	    				<input style="width:180px;" class="easyui-combobox" id="form_postId" name="postId" data-options="valueField:'id',textField:'text',url:'${ctx}/post/getPostByDeptId?deptId=1'">
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<th>姓名：</th>
 					<td style="text-align: left;">
	 					<input style="width:180px;" class="easyui-textbox" type="text" id="userName" name="userName" data-options="required:true"></input>
 					</td>
	    			<th>生日：</th>
	    			<td>
	    				<input class="easyui-datebox" type="text" ID="birthday_form" name="birthday" style="width:180px" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>办公电话：</th>
	    			<td><input style="width:180px;" class="easyui-textbox" type="text" id="officeTelephone" name="officeTelephone" data-options="required:false"></input></td>
	    			<th>手机号：</th>
	    			<td><input style="width:180px;" class="easyui-textbox" type="text" id="mobilePhone" name="mobilePhone" ></input></td>
	    			
	    		</tr>
	    		<tr>
	    			<th>登录账号：</th>
 					<td style="text-align: left;">
	 					<input style="width:180px;" class="easyui-textbox" type="text" id="loginName" name="loginName" ></input>
 					</td>
	    			<th>登录密码：</th>
	    			<td>
	    				<input style="width:180px;"  type="password" id="loginPassword" name="loginPassword" ></input>
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
 
 
</body>
</html>