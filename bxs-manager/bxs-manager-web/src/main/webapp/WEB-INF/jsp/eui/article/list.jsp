<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>用户管理</title>
<script type="text/javascript">
var dgTable;
$(function(){
	var searchHeight=$('.searchBox').height();
	var dgTableHeight=$(window).height()-searchHeight-30;
	dgTable=$('#dgTable').datagrid({  
		url:ctx+'/sysUser/list',
		method:'post',
	    queryParams: {
	    	loginAccount:'',
	    	sex:'',
	    	userType:''
		},
		//title:"用户管理",
		fit:false,
		pageSize: 20,
		height: dgTableHeight,
		fitColumns:true,
		striped: true,//奇偶行是否区分
		singleSelect:true,
		pagination: true,  
		rownumbers: true,  
		columns:[[
		          {field:'loginAccount',title: '登录名',align: 'left',width: 100,hidden:true,},
		          {field:'userName',title: '姓名',align: 'left',width: 100},
		          {field:'sex',title: '性别',align: 'center',width: 100, formatter:function(val,rec){
		        	  if(val=='1'){
		        		  return "男";
		        	  }else{
		        		  return "女";
		        	  }
		          }}, 
		          {field:'telephone',title: '电话号码',align: 'center',width: 100}, 
		          {field:'email',title: '邮箱地址',align: 'left',width: 100},
		          {field:'userType',title: '用户类型',align: 'center',width: 50, formatter:function(val,rec){
		        	  var  typeArr=["网络管理","数据库管理","服务器管理","对接部门","平台维护"];
					 
		        	  if(val=='1'){
		        		  return "网络管理";
		        	  }else if(val=='2'){
		        		  return "数据库管理";
		        	  }else if(val=='3'){
		        		  return "服务器管理";
		        	  }else if(val=='4'){
		        		  return "对接部门";
		        	  }else if(val=='5'){
		        		  return "平台维护";
		        	  }
		        	  
		        	  
		        	  
		          }},
		          {field:'userState',title: '用户状态',align: 'center',width: 50, formatter:function(val,rec){
		        	  if(val=='U'){
		        		  return "在用";
		        	  }else if(val=='R'){
		        		  return "注册";
		        	  }else if(val=='L'){
		        		  return "锁定";
		        	  }
		          }},
		          {field:'id',title: '操作',align: 'center',width: 100, formatter:function(val,rec){
		        	  return "<span ><a href='javascript:void(0)' onclick=editFun('"+val+"') class='btn_a_edit'>编辑</a></span><span>&nbsp;&nbsp;<a href='javascript:void(0)' onclick=deleteFun('"+val+"') class='btn_a_delete'>删除</a></span>";
		          }}
		]]
		,toolbar:$('#tb')
		//,footer:$('#ft')

		})
		
		//监听查询按钮点击事件
		$("#search").click(function(){
			doQuery();
		});
			
		$("#add").click(function(){
			add();
		});
	})
	
	
	function doQuery(){
		var options = $("#dgTable").datagrid("options");
		//设置参数
		options.queryParams.loginAccount= $("#account").val();
	    options.queryParams.sex =$('#sex').combobox('getValue');
	    options.queryParams.userType =$('#userType').combobox('getValue');
	    $("#dgTable").datagrid(options);
	}
	
	//新增
	function add(){
		$('#addWin').window('open');
		$('#addForm').form('clear');
		$('#radio_sex_m').prop('checked', 'checked');
		$("#userState").combobox('select','R');
		$('.hideTD').hide();
	}
	
	//清理表单
	function clearForm(){
		$('#addForm').form('clear');
		$('#addWin').window('close');
	}
	
	//提交表单
	function submitForm(){
		if($("#addForm").form('validate')){
			$.ajax({
		         type: "POST",
		         url:'${ctx}/sysUser/save',
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
	}
	
	//编辑
	function editFun(id) {
		 var rows = $("#dgTable").datagrid('getData').rows;
         var length = rows.length;
         var rowindex;
         for (var i = 0; i < length; i++) {
             if (rows[i]['id'] == id) {
                 rowindex = i;
                 break;
             }
         }
         var row=$('#dgTable').datagrid('getData').rows[rowindex];
         $('#addWin').window('open');
         $('.hideTD').show();
         $('#addWin').panel({
 			title : '编辑',
 			iconCls : "icon-edit"
 			});
         $('#addForm').form('load',{
        	 	id:row.id,
        	 	loginAccount:row.loginAccount,
        	 	userName:row.userName,
        	 	telephone:row.telephone,
        	 	email:row.email,
        	 	sex:row.sex,
        	 	userState:row.userState,
        	 	userType:row.userType,
        	 	loginPwd:row.loginPwd,
        	 	userType:row.userType,
        	 	createUser:row.createUser,
        	 	createDate:row.createDate,
        	 	updateUser:row.updateUser,
        	 	updateDate:row.updateDate,
        	 	memo:row.memo
			});
	}
	
	//删除
	function deleteFun(id){
		$.messager.confirm("删除确认", "您确认删除选定的记录吗？", function (action) {
            if (action) {
            	$.ajax({
        			cache: true,
        			type: "POST",
        			url:'${ctx}/sysUser/delete',
        			data:{
        				id:id
        			},
        			async: false,
        		    error: function(request) {
        		        alert("Connection error");
        		    },
        		    success: function(data) {
        		    	$.messager.alert('提示信息',data.msg);
        		    	$("#dgTable").datagrid('reload');
        		    }
        		
        		})
            }
            })
     	}		
	
</script>
</head>
<body>

<div class="easyui-layout" fit="false">
		<fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">登录名:</td>
					<td style="width:200px;text-align: left;"><input  id="account" name="loginAccount" style="width:150px"></td>
					<td style="width:100px;text-align: right;margin-right: 5px;">性别:</td>
					<td style="width:200px;">
						<select data-options="panelHeight:'auto'" class="easyui-combobox" id="sex" name="sex"  style="width:150px">
							<option value="1">男</option>
							<option value="2">女</option>
							<option value="3" selected = "selected">全部</option>
						</select>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">用户类型:</td>
					<td style="width:200px;text-align: left;">
						<select data-options="panelHeight:'auto'" class="easyui-combobox" id="userType" name="userType"  style="width:150px">
							<option value="1">网络管理</option>
							<option value="2">数据库管理</option>
							<option value="3">服务器管理</option>
							<option value="4">对接部门</option>
							<option value="5">平台维护</option>
							<option value="" selected = "selected">全部</option>
						</select>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><a href="#" id="search" class="easyui-linkbutton" iconCls="Zoom">查询</a></td>
				</tr>
			</table>
        </fieldset>

		<table id="dgTable" >
		</table>
</div>
	
	<div id="tb">
	    <a href="#" id="add" class="easyui-linkbutton" plain="true"  iconCls="Applicationadd">添加</a>
	    <%-- 
	    <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:alert('Cut')">Cut</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">Save</a>
	    --%>
	</div>
	
	<div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:630px;height:370px;padding:10px;">
	
	    <form id="addForm" method="post">
	    	<table  class="itable">
	    		<tr>
	    			<th style="width:160px;">用户名：</th>
	    			<td>
	    				<input type="hidden" id="id" name="id" ></input>
	    				<input style="width:180px;"  class="easyui-textbox" type="text" id="userName" name="userName" data-options="required:true"></input>
	    			</td>
	    			
	    			<th>用户类型：</th>
	    			<td>
	    				<select class="easyui-combobox" id="userType" name="userType" style="width:180px;">
		    				<option value="1">网格管理</option>
							<option value="2">数据库管理</option>
							<option value="3">服务器管理</option>
							<option value="4">对接部门</option>
							<option value="5">平台维护</option>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>电话号码：</th>
	    			<td><input style="width:180px;" class="easyui-textbox" type="text" id="telephone" name="telephone" data-options="required:false"></input></td>
	    			<th>邮箱：</th>
	    			<td><input style="width:180px;" class="easyui-textbox" type="text" id="email" name="email" data-options="required:true,validType:'email'"></input></td>
	    			
	    		</tr>
	    		
	    		<tr>
	    			<th>性别：</th>
 					<td style="text-align: left;">
	 					<input  type="radio" id="radio_sex_m" name="sex" value="1" checked="checked" />
						<label for="radio_sex_m" >男</label>
						<input  type="radio" id="radio_sex_f" name="sex" value="2" />
						<label for="radio_sex_f">女</label>
 					</td>
	    			<th>当前状态：</th>
	    			<td>
	    				<select class="easyui-combobox" id="userState" name="userState" style="width:180px;">
		    				<option value="R">注册</option>
		    				<option value="U">在用</option>
		    				<option value="L">锁定</option>
		    				<option value="D">删除</option>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr class="hideTD">
	    			<th>更新人：</th>
	    			<td>
	    				<input style="width:180px;"  class="easyui-textbox" type="text" id="updateUser" name="updateUser" data-options="required:false" readonly="readonly"></input>
	    			</td>
	    			
	    			<th>更新时间：</th>
	    			<td>
	    				<input style="width:180px;"  class="easyui-textbox" type="text" id="updateDate" name="updateDate" data-options="required:false" readonly="readonly"></input>
	    			</td>
	    		</tr>
	    		<tr class="hideTD">
	    			<th>创建人：</th>
	    			<td>
	    				<input style="width:180px;"  class="easyui-textbox" type="text" id="createUser" name="createUser" data-options="required:false" readonly="readonly"></input>
	    			</td>
	    			
	    			<th>创建时间：</th>
	    			<td>
	    				<input style="width:180px;"  class="easyui-textbox" type="text" id="createDate" name="createDate" data-options="required:false" readonly="readonly"></input>
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    		      <th>备注：</th>
	    		      <td colspan="6" align="center" style="padding:1px;"><textarea id="memo" name="memo" style="width:99%;height:80px;"></textarea></td> 
	    		 </tr> 
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" iconCls="icon-save" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" iconCls="icon-cancel"  class="easyui-linkbutton" onclick="clearForm()">取消</a>
	    </div>
	   
		
	</div>

</body>
</html>