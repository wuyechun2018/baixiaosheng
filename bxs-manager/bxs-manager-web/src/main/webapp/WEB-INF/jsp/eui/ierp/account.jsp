<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>账单管理</title>
<script type="text/javascript">

//点击"添加弹出框-保存按钮",提交表单
function submitForm(){
  if($("#addForm").form('validate')){
	$.ajax({
         type: "POST",
         url:'${ctx}/bizAccount/save',
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
    
    //$('#saveBtn').css("color","#c3c3c3");
    
    
    $('#addWin').panel({
		title : '查看',
		iconCls : "icon-edit"
	});
    $("#addForm").form("load", record); 
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
}

//点击“操作列-删除”
function deleteFun(id){
	$.messager.confirm("删除确认", "您确认删除该条记录吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/bizAccount/delete',
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
    //开始时间
    options.queryParams.accountDateFrom=$('#accountDateFrom').val();
    //结束时间
    options.queryParams.accountDateTo=$('#accountDateTo').val();
    //入账人Id
    options.queryParams.accountUserId=$('#queryAccountUserId').combobox('getValue');
    //入账类型
    options.queryParams.accountType=$("input[name='queryAccountType'][checked]").val(); 
    $("#dgTable").datagrid(options);
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
		url:ctx+'/bizAccount/pagerList',
		method:'post',
	    queryParams: {
	    	accountDateFrom:'',
	    	accountDateTo:'',
	    	accountUserId:'',
	    	accountType:''
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
		          /*{field: 'ck', checkbox: true, width: '30' },*/
		          {field:'accountDate',title: '入账时间',align: 'center',width: 40},
		          {field:'accountUserId',title: '入账人ID',align: 'center',width: 100,hidden:true},
		          {field:'accountUserName',title: '入账人',align: 'center',width: 50},
		          {field:'accountItem',title: '入账事项',align: 'center',width: 160}, 
		          {field:'accountType',title: '入账类别',align: 'center',width: 40,formatter:function(val,rec){
		        	  if(val=='0'){
		        		  return "<span style='color:red;font-weight:bold;'>收入</span>";
		        	  }else{
		        		  return "<span style='color:green;font-weight:bold;'>支出</span>";
		        	  }
		          }},
		          {field:'amount',title: '金额',align: 'center',width: 50}, 
		          {field:'actualAmount',title: '实际金额',align: 'center',width: 50}, 
		          {field:'accountDesc',title: '备注',align: 'center',width: 100,hidden:true},
		          {field:'id',title: '操作',align: 'center',width: 80, formatter:function(val,rec){
		        	  return "<button class='ibtn-front' onclick=viewFun('"+val+"')>查看</button><button class='ibtn-edit' onclick=editFun('"+val+"')>编辑</button><button class='ibtn-top' onclick=deleteFun('"+val+"')>删除</button>";
		          }}
		]]
		,toolbar:$('#tb')
	  });
 })
	
</script>
</head>
<body>
<div class="easyui-layout"  fit="true">
    <div data-options="region:'center'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;font-weight: bold;">入账时间:</td>
					<td style="width:300px;text-align: left;">
						<span>从</span>
						<input style="width:120px;"  class="easyui-datebox" type="text" id="accountDateFrom" name="accountDateFrom" data-options="required:false"></input>
						<span>到</span>
						<input style="width:120px;"  class="easyui-datebox" type="text" id="accountDateTo" name="accountDateTo" data-options="required:false"></input>
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;font-weight: bold;">入账人:</td>
					<td style="width:200px;">
						  <input style="width:200px;" class="easyui-combobox" id="queryAccountUserId" name="accountUserId" data-options="valueField:'id',textField:'text',url:'${ctx}/user/getUserComboboxData',onSelect:function(){doQuery()}">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;font-weight: bold;">入账类别:</td>
					<td style="width:200px;">
						<input  type="radio"  name="queryAccountType" value="0" checked="checked" />
					    <label for="radio_accountType_sr">收入</label>
						<input  type="radio"  name="queryAccountType" value="1" />
						<label for="radio_accountType_zc">支出</label>
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
<div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:460px;height:425px;padding:10px;">
   <form id="addForm" method="post">
   	<table  class="isingelTable">
   		<tr>
   			<th>入账时间：</th>
   			<td>
   				<input type="hidden" id="id" name="id"></input>
   				<input type="hidden" id="dataState" name="dataState" value="1"></input>
   				
   				<input style="width:250px;"  class="easyui-datebox" type="text" id="accountDate" name="accountDate" data-options="required:false"></input>
   			</td>
   		<tr>
   	
   		<tr>
   			<th>入账人：</th>
   			<td>
   				<input style="width:250px;" class="easyui-combobox" id="accountUserId" name="accountUserId" data-options="valueField:'id',textField:'text',url:'${ctx}/user/getUserComboboxData'">
   				
   			</td>
   		</tr>
   		
   		<tr>
   			<th>入账事项：</th>
   			<td>
   			<textarea name="accountItem" style="width:248px;height:30px;">
   		      </textarea>
   			</td>
   		<tr>
   		
   		<tr>
   			<th>入账类别：</th>
   			<td>
   				<input  type="radio" id="radio_accountType_sr" name="accountType" value="0" checked="checked" />
			    <label for="radio_accountType_sr">收入</label>
				<input  type="radio" id="radio_accountType_zc" name="accountType" value="1" />
				<label for="radio_accountType_zc">支出</label>
   			</td>
   		<tr>
   		
   		<tr>
   			<th>金额：</th>
   			<td>
   				<input style="width:250px;"  class="easyui-textbox" type="text" id="amount"  name="amount"  data-options="required:true,validType:'currency'"></input>
   			</td>
   		<tr>
   		
   		<tr>
   			<th>实际金额：</th>
   			<td>
   				<input style="width:250px;"  class="easyui-textbox" type="text" id="actualAmount"  name="actualAmount" data-options="required:true,validType:'currency'"></input>
   			</td>
   		<tr>
   		
   		<tr>
   		      <th>备注：</th>
   		      <td colspan="6" align="center" style="padding:1px;">
   		      	<textarea name="accountDesc" style="width:248px;height:80px;">
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

</body>
</html>