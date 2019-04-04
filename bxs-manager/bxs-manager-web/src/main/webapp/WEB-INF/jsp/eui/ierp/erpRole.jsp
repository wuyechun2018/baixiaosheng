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
	text-align: center;
}

.remove-div{
	position: absolute;
	top:55%;
	min-width: 50px;
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
	$('#closeTd').hide();
	$('#editTd').show();
	
	//入账时间默认为当天
	$('#accountDate').datebox('setValue',myDateFormatter(new Date()));
	//默认收入
	$("#radio_accountType_sr" ).prop("checked",true);
}

//点击"添加弹出框-取消按钮",提交表单
function clearForm(){
	$('#addForm').form('clear');
	$('#addWin').window('close');
}

//信息查询-入账类别-单选框事件
function bindRadioChanged(){
	$('input[type=radio][name=queryAccountType]').change(function() {
		     if (this.value == '0') {
		    	 doQuery();
	          }else if (this.value == '1') {
	        	  doQuery();
	         }
	 });
}

//点击“操作列-查看”
function viewFun(id) {
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
    $('#addWin').window('open');
    
    $('#closeTd').show();
    $('#editTd').hide();
    
    $('#addWin').panel({
		title : '查看',
		iconCls : "icon-edit"
	});
    $("#addForm").form("load", record); 
    
    loadPemissionTree();
    
}

//点击“操作列-修改”
function editFun(id) {
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
    loadPemissionTree();
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
    options.queryParams.roleCode=$('#qRoleCode').datebox('getValue');
    $("#dgTable").datagrid(options);
}

//清空查询条件
function doResetQuery(){
	$('#queryForm').form('clear');
	//默认收入
	//$("#radio_accountType_sr" ).prop("checked",true);
	doQuery();
}

function loadUserRoleTab(){
	//中间表格
	var dgTableHeight=$(window).height()-$('.searchBox').height()-18;
    $('#waitDgTable').datagrid({  
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
	  });
    
    
    $('#hasDgTable').datagrid({  
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
	  });
	
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
	 //绑定radio选择事件
	 bindRadioChanged();	 
	 //中间表格
	var dgTableHeight=$(window).height()-$('.searchBox').height()-28;
    $('#dgTable').datagrid({  
		url:ctx+'/erpRole/pagerList',
		method:'post',
	    queryParams: {
	    	
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
 
function loadPemissionTree(){
	 $('#pemissionTree').tree({
			checkbox : true,
			url : '${ctx}/sysmenu/getListByPid?pid=0',
			method : 'post',
			onBeforeExpand : function(node, param) {
			   $('#pemissionTree').tree('options').url = ctx+ "/sysmenu/getListByPid?pid=" + node.id;
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
						<input id="qRoleName" name="qRoleName" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">角色代码:</td>
					<td style="width:200px;">
						<input id="qRoleCode" name="qRoleCode" style="width:150px">
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
<div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:660px;height:425px;padding:1px;">
	<div class="easyui-tabs" style="width:100%;height:100%;">
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
			    		<tr id="closeTd">
			    			<td colspan="2" style="width:50%;text-align: center;"><a href="javascript:void(0)" data-options="iconCls:'Cross'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">关闭</a></td>
			    		</tr>
					 </table>
			    </div>
        </div>
        <div title="权限设置" style="padding:0px">
          	<div style="height:300px;">
             <ul id="pemissionTree"></ul>
            </div>
        </div>
        <div title="用户设置" data-options="" style="padding:0px">
        	<%--开始 --%>
        	<div class="easyui-layout"  fit="true">
			    <div data-options="region:'west',split:false,border:false" style="width: 48%; padding: 1px;">
			        <div>
			        	<table style="width:100%;padding:8px 0" class="searchBox">
							<tr>
								<td style="width:100px;text-align: right;margin-right: 5px;">名称:</td>
								<td style="width:200px;text-align: left;">
									<input id="telephone" name="telephone" style="width:150px">
								</td>
								
								<td>&nbsp;</td>
								<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" style="min-width: 54px;" iconCls="Zoom">查询</a></td>
							</tr>
						</table>
			            <table id="waitDgTable">
			        	</table>
			        </div>
			    </div>
			    <div data-options="region:'center',split:false,border:false" style="width: 4%;min-width:60px; padding:1px;height:auto">
			        <div class="add-div">
			        	<a href="javascript:void(0)" title="添加" class="add-remove-btn" >&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;</a>
			        </div>
			        <div class="remove-div">
			        	<a href="javascript:void(0)" title="移除" class="add-remove-btn">&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;</a>
			        </div>
			    </div>
    
			    <div data-options="region:'east',split:false,border:false" style="width: 48%; padding:1px;height:auto">
			        	<div>
				        	<table style="width:100%;padding:8px 0" class="searchBox">
								<tr>
									<td style="width:100px;text-align: right;margin-right: 5px;">名称:</td>
									<td style="width:200px;text-align: left;">
										<input id="telephone" name="telephone" style="width:150px">
									</td>
									
									<td>&nbsp;</td>
									<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" style="min-width: 54px;" iconCls="Zoom">查询</a></td>
								</tr>
							</table>
				            <table id="hasDgTable">
				        	</table>
			        </div>
			    </div>
 			</div>
 			<%--结束 --%>
 			  
        </div>
    </div>
</div>

</body>
</html>