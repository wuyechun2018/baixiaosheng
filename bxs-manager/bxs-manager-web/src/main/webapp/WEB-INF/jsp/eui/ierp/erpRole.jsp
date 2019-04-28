<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>角色管理</title>

<style type="text/css">

.add-div{
	position: absolute;
	top:45%;
	min-width: 50px;
	width:50px;
	text-align: center;
}

.remove-div{
	position: absolute;
	top:55%;
	min-width: 50px;
	width:50px;
	text-align: center;
}


.add-remove-btn{
	color:#777;
	background:#FFF;
	font-size:14px;
	font-weight:bold;
	border: 1px solid #dddddd;
	text-decoration: none;
	min-width: 40px;
	padding:2px 3px;
}


.add-remove-btn:hover{
	background:#E6E6E6;
}


</style>

<script type="text/javascript">

//点击"添加弹出框-保存按钮",提交表单
function submitForm(){
  if($("#addForm").form('validate')){
	$.ajax({
         type: "POST",
         url:'${ctx}/erpRole/save',
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



//点击"添加按钮"
function addFun(){
	$('#addWin').panel({
		title : '添加',
		iconCls : "icon-add"
	});
	$('#addWin').window('open');
	$('#addForm').form('clear');
	
	
	$('#userRoleSetTab').tabs('select',0);
	//新增时
	$('#userRoleSetTab').tabs('disableTab', 1);
	$('#userRoleSetTab').tabs('disableTab', 2);
	
	loadPemissionTree();
    //加载用户角色Tab页面
    loadUserRoleTab();
}

//点击"添加弹出框-取消按钮",提交表单
function clearForm(){
	$('#addForm').form('clear');
	$('#addWin').window('close');
}

//点击"权限设置"-"取消"按钮
function clearRoleMenuForm(){
	$('#addWin').window('close');
}

//提交"权限设置"
function submitRoleMenuForm(){
 //获取选中的menuId	
 var roleId=$('#selectRoleId').val();
 var menuIds='';
 
 var checkedNodes = $('#pemissionTree').tree('getChecked');
 for(var i=0;i<checkedNodes.length;i++){
	 menuIds=menuIds+checkedNodes[i].id+",";
 }
 menuIds=menuIds.substring(0, menuIds.length-1);
	
 $.ajax({
       type: "POST",
       url:'${ctx}/erpRoleMenu/save',
       data:{
    	   roleId:roleId,
    	   menuIds:menuIds
       },
       success: function (data) {
    	   $.messager.alert('提示信息',data.msg);
       },
       error: function(data) {
           alert("error:"+data.responseText);
        }
 		});
}


//点击“操作列-查看”
function viewFun(id) {
	
	$('#userRoleSetTab').tabs('enableTab', 1);
	$('#userRoleSetTab').tabs('enableTab', 2);
	
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
    $('#addWin').window('open');
    
    $('#addWin').panel({
		title : '查看',
		iconCls : "icon-edit"
	});
    $("#addForm").form("load", record); 
    
  //加载权限树
    loadPemissionTree(id);
    //此处的Id为roleId
    loadUserRoleTab(id);
}

//点击“操作列-修改”
function editFun(id) {
	 
	$('#userRoleSetTab').tabs('enableTab', 1);
	$('#userRoleSetTab').tabs('enableTab', 2);
	
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
    $('#addWin').window('open');
    $('#closeTd').hide();
    $('#editTd').show();
    $('#addWin').panel({
		title : '编辑',
		iconCls : "icon-edit"
	});
    $("#addForm").form("load", record);
    //加载权限树
    loadPemissionTree(id);
    //此处的Id为roleId
    loadUserRoleTab(id);
}

//点击“操作列-删除”
function deleteFun(id){
	$.messager.confirm("删除确认", "您确认删除该条记录吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/erpRole/delete',
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
    options.queryParams.roleName= $('#qRoleName').textbox('getValue');
    //结束时间
    options.queryParams.roleCode=$('#qRoleCode').textbox('getValue');
    $("#dgTable").datagrid(options);
}

//待授权查询
function doWaitDgQuery(){
    var options = $("#waitDgTable").datagrid("options");
    //查询
    options.queryParams.roleId=$('#selectRoleId').val();
    options.queryParams.queryKey= $('#waitDgQueryKey').val();
    $("#waitDgTable").datagrid(options);
}


//已授权用户查询
function doHasDgQuery(){
    var options = $("#hasDgTable").datagrid("options");
    //查询
    options.queryParams.roleId=$('#selectRoleId').val();
    options.queryParams.queryKey= $('#hasDgQueryKey').val();
    $("#hasDgTable").datagrid(options);
}


//清空查询条件
function doResetQuery(){
	$('#queryForm').form('clear');
	//默认收入
	//$("#radio_accountType_sr" ).prop("checked",true);
	doQuery();
}

//加载用户角色Tab页面
function loadUserRoleTab(roleId){
	//alert(roleId);
	$('#selectRoleId').val(roleId);
	
	//中间表格
	var dgTableHeight=340;
	
	//1、待授权列表
    $('#waitDgTable').datagrid({  
		url:ctx+'/erpUserRole/getUserListByRoleId',
		method:'post',
	    queryParams: {
	    	isWait:'0',
	    	roleId:roleId,
	    	queryKey:$('#waitDgQueryKey').val()
		},
		fit:false,
		pageSize: 10,
		height: dgTableHeight,
		fitColumns:true,
		striped: true,
		singleSelect:true,
		pagination: true,  
		rownumbers: true,  
		columns:[[
				{field:'id',title: '部门ID',align: 'center',width: 100,hidden:true}, 
				{field:'empNo',title: '工号',align: 'left',width: 80},
				{field:'empName',title: '姓名',align: 'center',width: 100},
				{field:'loginName',title: '登录名',align: 'center',width: 100}
		]]
	  });
    
    //2、已授权列表
    $('#hasDgTable').datagrid({  
		url:ctx+'/erpUserRole/getUserListByRoleId',
		method:'post',
	    queryParams: {
	    	isWait:'1',
	    	roleId:roleId,
	    	queryKey:$('#hasDgQueryKey').val()
		},
		fit:false,
		pageSize: 10,
		height: dgTableHeight,
		fitColumns:true,
		striped: true,
		singleSelect:true,
		pagination: true,  
		rownumbers: true,
		columns:[[
		          {field:'id',title: '部门ID',align: 'center',width: 100,hidden:true}, 
		          {field:'empNo',title: '工号',align: 'left',width: 80},
		          {field:'empName',title: '姓名',align: 'center',width: 80},
		          {field:'loginName',title: '登录名',align: 'center',width: 100}
		]]
	  });
	
    //doWaitDgQuery();
    //doHasDgQuery();
    
}

//给角色添加用户
function addUserRole(){
    var record=$('#waitDgTable').datagrid('getSelected');
	var userId=record.id;
	var roleId=$('#selectRoleId').val();
	
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/erpUserRole/save',
		data:{
			userId:userId,
			roleId:roleId
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	$.messager.alert('提示信息',data.msg);
	    	doWaitDgQuery();
	    	doHasDgQuery();
	    }
	})
	
	
}

//给角色移除用户
function removeUserRole(){
	//获取选中的用户
	//var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#hasDgTable').datagrid('getSelected');
	var userId=record.id;
	var roleId=$('#selectRoleId').val();
	
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/erpUserRole/delete',
		data:{
			userId:userId,
			roleId:roleId
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	$.messager.alert('提示信息',data.msg);
	    	doWaitDgQuery();
	    	doHasDgQuery();
	    }
	})
	
}



 $(function(){
	 //初始化时先判断当前用户是否已经登录
	 //如果用户未登录,则跳转到登录页面
	 $.ajax({
         type: "POST",
         url:'${ctx}/user/isHasLogin',
         data:{},
         success: function (data) {
        		if(data.success){
        			$('#userinfo').val(data.msg.userName);
        		}else{
        			$.messager.confirm("确认登录", "您当前尚未登录或登录已经过期，请到登录页面重新登录", function (action) {
        	       		if (window != top){
        	       	            top.location.href = "${ctx}/login";
        	       	  	}else{
        	       	  			location.href="${ctx}/login";
        	       	  	}
        			})
        		}
         
         },
         error: function(data) {
             alert("error:"+data.responseText);
          }
   		});
	
	 //中间表格
	var dgTableHeight=$(window).height()-$('.searchBox').height()-28;
    $('#dgTable').datagrid({  
		url:ctx+'/erpRole/pagerList',
		method:'post',
	    queryParams: {
	    	roleName:$('#qRoleName').textbox('getValue'),
	    	roleCode:$('#qRoleCode').textbox('getValue')
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
		          {field:'roleCode',title: '角色编码',align: 'center',width: 40},
		          {field:'roleName',title: '角色名称',align: 'center',width: 100},
		          {field:'memo',title: '备注',align: 'center',width: 60},
		          {field:'id',title: '操作',align: 'center',width: 85, formatter:function(val,rec){
		        	  return "<button class='ibtn-front' onclick=viewFun('"+val+"')>查看</button><button class='ibtn-edit' onclick=editFun('"+val+"')>编辑</button><button class='ibtn-top' onclick=deleteFun('"+val+"')>删除</button>";
		          }}
		]]
		,toolbar:$('#tb')
	  });
    
 })
 
 //加载权限树，角色和目录菜单的对应关系
function loadPemissionTree(roleId){
	 $('#pemissionTree').tree({
			checkbox : true,
			url : '${ctx}/erpRoleMenu/getErpMenuListByPid?pid=0&roleId='+roleId,
			method : 'post',
			onBeforeExpand : function(node, param) {
			   $('#pemissionTree').tree('options').url = ctx+ "/erpRoleMenu/getErpMenuListByPid?pid=" + node.id+"&roleId="+roleId;
			},
			onClick : function(node) {
				   clickNodeFun(node);
			},
			onLoadSuccess : function(node, data) {
				//默认展开根节点
				var rooNode = $("#pemissionTree").tree('getRoot');
				$("#pemissionTree").tree('expandAll');

			},
			onContextMenu: function(e, node){ 
	            e.preventDefault();  
	        }
			
		});
 }
	
</script>
</head>
<body>
<div class="easyui-layout"  fit="true">
    <div data-options="region:'center'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
              <form id="queryForm" method="post">
            <table style="width:100%;">
				<tr>
					 <td style="width:100px;text-align: right;margin-right: 5px;">角色名称:</td>
					<td style="width:200px;text-align: left;">
						<input id="qRoleName"  class="easyui-textbox"  name="qRoleName" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">角色代码:</td>
					<td style="width:200px;">
						<input id="qRoleCode"  class="easyui-textbox"  name="qRoleCode" style="width:150px">
					</td>
					
					<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" iconCls="Zoom">查询</a>&nbsp;<a href="javascript:void(0)" id="search" onclick="doResetQuery()" class="easyui-linkbutton" iconCls="Arrowrefresh">清空</a></td>
				</tr>
			</table>
            </form>
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
<div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:699px;height:500px;padding:1px;">
	<div class="easyui-tabs" style="width:100%;height:450px" id="userRoleSetTab">
        <div title="角色信息" style="padding:0px">
			 <form id="addForm" method="post">
			   	<table  class="isingelTable">
			   		<tr>
			   			<th>角色名称：</th>
			   			<td>
			   				<input type="hidden" id="id" name="id"></input>
			   				<input type="hidden" id="dataState" name="dataState" value="1"></input>
			   				
					    	<input class="easyui-textbox" type="text" id="roleName" name="roleName" data-options="required:true" style="width:250px;"></input>
			   			</td>
			   		<tr>
			   	
			   		<tr>
			   			<th>角色编码：</th>
			   			<td>
			   				<input class="easyui-textbox" type="text" id="roleCode" name="roleCode" data-options="required:true" style="width:250px;"></input>
			   			</td>
			   		</tr>
			   		
			   		<tr>
			   		      <th>备注：</th>
			   		      <td colspan="6" align="center" style="padding:1px;">
			   		      	<textarea name="memo" style="width:248px;height:80px;">
			   		      </textarea></td> 
			   		 </tr> 
			   	</table>
			   </form>
			    <div style="text-align:center;padding:25px 5px 5px 5px;">
			    	<table style="width:100%;">
			    		<tr id="editTd">
			    			<td style="width:50%;text-align: right;padding-right: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
			    			<td style="width:50%;text-align: left;padding-left: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">取消</a></td>
			    		</tr>
			    		<%--
			    		<tr id="closeTd">
			    			<td colspan="2" style="width:50%;text-align: center;"><a href="javascript:void(0)" data-options="iconCls:'Cross'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">关闭</a></td>
			    		</tr>
			    		 --%>
					 </table>
			    </div>
        </div>
        <div title="权限设置" style="padding:0px">
          	<div style="height:300px;">
             <ul id="pemissionTree"></ul>
            </div>
            
            <div style="text-align:center;padding:25px 5px 5px 5px;">
		    	<table style="width:100%;">
		    		<tr >
		    			<td style="width:50%;text-align: right;padding-right: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveRoleMenuBtn" class="easyui-linkbutton" onclick="submitRoleMenuForm()">保存</a></td>
		    			<td style="width:50%;text-align: left;padding-left: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetRoleMenuBtn" class="easyui-linkbutton" onclick="clearRoleMenuForm()">取消</a></td>
		    		</tr>
				 </table>
			</div>
            
        </div>
        <div title="用户设置" data-options="" style="padding:0px">
        	<table style="margin:0px;">
        		<tr style="margin:0px;padding:0px;">
        			<td style="margin:0px;padding:0px;width:308px;height:410px;border: 0px solid;">
        				<input style="visibility: hidden;" id="selectRoleId" />
		        		<table style="width:100%;padding:0px;margin:0px;;height:50px;" class="searchBox">
							<tr>
								<td style="width:100px;text-align: right;margin-right: 5px;">名称:</td>
								<td style="width:200px;text-align: left;">
									<input id="waitDgQueryKey" name="waitDgQueryKey" style="width:150px">
								</td>
								
								<td>&nbsp;</td>
								<td><a href="javascript:void(0)" id="search" onclick="doWaitDgQuery()" class="easyui-linkbutton" style="min-width: 54px;" iconCls="Zoom">查询</a></td>
							</tr>
						</table>
			            <table id="waitDgTable">
			        	</table>
        			</td>
        			<td style="margin:0px;padding:0px;width:68px;height:410px;border: 0px solid;">
        				<div class="add-div">
				        	<a href="javascript:void(0)" title="添加" class="add-remove-btn" onclick="addUserRole()">&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;</a>
				        </div>
				        <div class="remove-div">
				        	<a href="javascript:void(0)" title="移除" class="add-remove-btn" onclick="removeUserRole()">&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;</a>
				        </div>
        			</td>
        			<td style="margin:0px;padding:0px;width:318px;height:410px;border: 0px solid;">
        				<table style="width:100%;padding:0px;margin:0px;height:50px;" class="searchBox">
							<tr>
								<td style="width:100px;text-align: right;margin-right: 5px;">名称:</td>
								<td style="width:200px;text-align: left;">
									<input id="hasDgQueryKey" name="hasDgQueryKey" style="width:150px">
								</td>
								
								<td>&nbsp;</td>
								<td><a href="javascript:void(0)" id="search" onclick="doHasDgQuery()" class="easyui-linkbutton" style="min-width: 54px;" iconCls="Zoom">查询</a></td>
							</tr>
						</table>
			            <table id="hasDgTable">
			        	</table>
        			</td>
        		</tr>
        	</table>
        </div>
    </div>
</div>

</body>
</html>