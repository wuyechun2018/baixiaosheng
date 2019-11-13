<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>账单管理</title>
<script type="text/javascript">

//提交"审批"表单
//TG 通过 DH 打回
function submitSpForm(spFlag){
	if($("#addForm").form('validate')){
		$.ajax({
	        type: "POST",
	        url:'${ctx}/erpBill/spReport?spFlag='+spFlag,
	        data: $('#addForm').serialize(),
	        success: function (data) {
	        	$.messager.alert('提示信息',data.msg);
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



//点击"添加弹出框-保存按钮",提交表单
function submitForm(){
  if($("#addForm").form('validate')){
	$.ajax({
         type: "POST",
         url:'${ctx}/erpBill/save',
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

//不允许操作
function notOperFun(id,opFlag){
	if(opFlag=='EDIT'){
		$.messager.alert('提示信息','该条记录已上报，不允许编辑操作！');
	}else if(opFlag=='DELETE'){
		$.messager.alert('提示信息','该条记录已上报，不允许删除操作！');
	}
}


function addFormBtnShow(funFlag){
	//上报、关闭
	$('#reportTd').hide();
	//关闭
	$('#closeTd').hide();
	//通过、打回、关闭
	$('#shTd').hide();
	//申请更改
	$('#sqggTd').hide();
	//审核意见
	$('#shOption').hide();
	// 保存 、取消
	$('#editTd').hide();
	
	if(funFlag=='Add'){
		// 保存 、取消
		$('#editTd').show();
	}else if(funFlag=='View'){
		//关闭
		$('#closeTd').show();
	}else if(funFlag=='Edit'){
		//保存、取消
		$('#editTd').show();
	}
	
	
}


//点击"添加按钮"
function addFun(){
	$('#addWin').panel({
		title : '添加',
		iconCls : "icon-add"
	});
	$('#addWin').window('open');
	$('#addForm').form('clear');
	//入账时间默认为当天
	$('#billDate').datebox('setValue',myDateFormatter(new Date()));
	//默认收入
	$("#radio_accountType_sr" ).prop("checked",true);
	bindAccountTypeChanged();
	addFormBtnShow('Add');
}

//点击"添加弹出框-取消按钮",提交表单
function clearForm(){
	$('#addForm').form('clear');
	$('#addWin').window('close');
}

//上报
function reportForm(){
	$.ajax({
        type: "POST",
        url:'${ctx}/erpBill/report',
        data: $('#addForm').serialize(),
        success: function (data) {
        	$.messager.alert('提示信息',data.msg);
       	 	$('#addWin').window('close');
		    //刷新列表
		    $("#dgTable").datagrid('reload');
		    
        },
        error: function(data) {
            alert("error:"+data.responseText);
         }
  		});
}


//信息查询-入账类别-单选框事件
function bindRadioChanged(){
	$('input[type=radio][name=queryAccountType]').change(function() {
		 //收入   
		 if (this.value == '1') {
		    	 doQuery();
	          }else if (this.value == '2') {
	        	 //支出
	        	  doQuery();
	         }
	 });
}

//新增弹出框，监测账单类别变化
function bindAccountTypeChanged(){
	$('input[type=radio][name=accountType]').change(function() {
		     $('#accountTypeItemId').combobox('setValue','')
		     if (this.value == '1') {
				   $('#accountTypeItemId').combobox('reload', ctx+ "/erpAccountType/getListByPidAndType?pid=1&type=1");
		     
		     }else if (this.value == '2') {
				   $('#accountTypeItemId').combobox('reload', ctx+ "/erpAccountType/getListByPidAndType?pid=1&type=2");
	         }
	 });
}



//点击“操作列-查看”
function viewFun(id) {
	bindAccountTypeChanged();
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
    $('#addWin').window('open');
    $('#addWin').panel({
		title : '查看',
		iconCls : "Image",
		height:425
	});
    $("#addForm").form("load", record); 
    //只读
    $('input,select,textarea',$('form[id="addForm"]')).attr('readonly',true);
    addFormBtnShow('View')
}


//点击“操作列-上报”
function reportFun(id,flag) {
	//设置状态
	$('#sbFlag').val(flag);
	
	bindAccountTypeChanged();
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
    $('#addWin').window('open');
    $('#closeTd').hide();
    $('#editTd').hide();
    $('#shTd').hide();
    $('#reportTd').hide();
    $('#sqggTd').hide();
    $('#shOption').hide();
   
    //上报
    if(flag=='SB'){
    	  $('#addWin').panel({
    			title : '上报',
    			iconCls : "Folderup"
    	});
        $('#reportTd').show();
       
    	  
    }else if(flag=='SH'){
    //审核	
    	$('#addWin').panel({
			title : '审核',
			iconCls : "Useredit",
			height:500
		});
       $('#shOption').show();
       $('#shTd').show();	
    }else if(flag=='SQGG'){
    	$('#addWin').panel({
			title : '申请更改',
			iconCls : "Useredit",
			height:500
		});
       $('#shOption').show();
       $('#shTd').show();	
    }
    
   
    $("#addForm").form("load", record);
    //只读
    $('input,select,textarea',$('form[id="addForm"]')).attr('readonly',true);
    //审核意见放开，非只读
    $('#shDesc').attr('readonly',false);
}

//点击“操作列-修改”
function editFun(id) {
	debugger;
	bindAccountTypeChanged();
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
   
    $('#addWin').window('open');
    $('#addWin').panel({
		title : '编辑',
		iconCls : "icon-edit",
		height:425
	});
    $("#addForm").form("load", record); 
    addFormBtnShow('Edit')
    //去除只读
    $('input,select,textarea',$('form[id="addForm"]')).attr('readonly',false);
}

//点击“操作列-删除”
function deleteFun(id){
	$.messager.confirm("删除确认", "您确认删除该条记录吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/erpBill/delete',
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
    options.queryParams.accountDateFrom= $('#accountDateFrom').datebox('getValue');
    //结束时间
    options.queryParams.accountDateTo=$('#accountDateTo').datebox('getValue');
    //入账人Id
    options.queryParams.accountUserId=$('#queryAccountUserId').combobox('getValue');
    //入账类型
    //options.queryParams.accountType=$("input[type=radio][name=queryAccountType]").val(); 
    options.queryParams.accountType=$("input[name='queryAccountType']:checked").val();
    $("#dgTable").datagrid(options);
}

//清空查询条件
function doResetQuery(){
	$('#queryForm').form('clear');
	//默认收入
	//$("#radio_accountType_sr" ).prop("checked",true);
	doQuery();
}

//展示审批记录
function showLogFun(bizId){
	$('#erpLogWin').panel({
		title : '审批日志',
		iconCls : "Textpaddingtop"
	});
	$('#erpLogWin').window('open');
	
	$('#erpLogDgTable').datagrid({  
			url:ctx+'/erpLog/pagerList',
			method:'post',
		    queryParams: {
		    	bizId:bizId
			},
			fit:false,
			pageSize: 10,
			height: 300,
			fitColumns:true,
			striped: true,
			singleSelect:true,
			pagination: true,  
			rownumbers: true,  
			columns:[[
					{field:'id',title: 'ID',align: 'center',width: 100,hidden:true}, 
					{field:'operateTime',title: '时间',align: 'center',width: 100},
					{field:'loginUserName',title: '操作人',align: 'center',width: 80},
					{field:'operateInfo',title: '操作',align: 'center',width: 100,formatter:function(val,rec){
						 return "<span title='"+val+"'>"+val+"</span>";
			          }}
			]]
		  });
	
	
}


 $(function(){
	 //初始化时先判断当前用户是否已经登录
	 //如果用户未登录,则跳转到登录页面
	 $.ajax({
         type: "POST",
         url:'${ctx}/erpUser/isHasLogin',
         data:{},
         success: function (data) {
        		if(data.success){
        			//如果是分公司财务，只能看到自己
        			if(data.msg.PTYG){
        				$('#queryAccountUserId').combobox('reload', ctx+ "/erpUser/getUserComboboxData?orgId="+data.msg.userInfo.belongOrgId+"&Id="+data.msg.userInfo.id);
        				$('#queryAccountUserId').combobox('setValue',data.msg.userInfo.id);
        			}
        			//如果是分公司财务，只能看到本公司员工
        			if(data.msg.CW){
        				$('#queryAccountUserId').combobox('reload', ctx+ "/erpUser/getUserComboboxData?orgId="+data.msg.userInfo.belongOrgId);
        				$('#queryAccountUserId').combobox('setValue',data.msg.userInfo.id);
        			}
        			//总经理或者管理员，不做筛选
        			if(data.msg.ZJL||data.msg.GLY){
        				$('#queryAccountUserId').combobox('reload', ctx+ "/erpUser/getUserComboboxData");
        				$('#queryAccountUserId').combobox('setValue',data.msg.userInfo.id);
        			}
        			
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
		url:ctx+'/erpBill/pagerList',
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
		          {field:'billDate',title: '入账时间',align: 'center',width: 55},
		          {field:'billUserId',title: '入账人ID',align: 'center',width: 100,hidden:true},
		          {field:'billUserName',title: '入账人',align: 'center',width: 50},
		          {field:'accountItem',title: '入账事项',align: 'center',width: 160}, 
		          {field:'accountType',title: '入账类别',align: 'center',width: 40,formatter:function(val,rec){
		        	  if(val=='1'){
		        		  return "<span style='color:red;font-weight:bold;'>收入</span>";
		        	  }else{
		        		  return "<span style='color:green;font-weight:bold;'>支出</span>";
		        	  }
		          }},
		          {field:'amount',title: '金额',align: 'center',width: 50}, 
		          {field:'actualAmount',title: '实际金额',align: 'center',width: 50}, 
		          {field:'bizStatus',title: '当前状态',align: 'center',width: 50,formatter:function(val,rec){
		        	  if(val=='1'){
		        		  return "<span style='color:red;font-weight:bold;'>待上报</span>";
		        	  }else if(val=='2'){
		        		  return "<span style='color:green;font-weight:bold;'>待审核</span>";
		        	  }else if(val=='3'){
		        		  return "<span style='color:green;font-weight:bold;'>已审核</span>";
		        	  }else if(val=='4'){
		        		  return "<span style='color:green;font-weight:bold;'>已归档</span>";
		        	  }
		          }},
		          {field:'id',title: '操作',align: 'center',width: 85, formatter:function(val,rec){
		        	  if(rec.bizStatus=='1'){
		        		  return "<button class='ibtn-front' onclick=viewFun('"+val+"')>查看</button><button class='ibtn-edit' onclick=editFun('"+val+"')>编辑</button><button class='ibtn-top' onclick=deleteFun('"+val+"')>删除</button>";  
		        	  }else if(rec.bizStatus=='2'){
		        		  return "<button class='ibtn-front' onclick=viewFun('"+val+"')>查看</button><button class='ibtn-edit ibtn-disabled'  onclick=notOperFun('"+val+"','EDIT')>编辑</button><button class='ibtn-top ibtn-disabled' onclick=notOperFun('"+val+"','DELETE')>删除</button>";  
		        	  }else if(rec.bizStatus=='3'){
		        		  return "<button class='ibtn-front' onclick=viewFun('"+val+"')>查看</button><button class='ibtn-edit ibtn-disabled' onclick=notOperFun('"+val+"','EDIT')>编辑</button><button class='ibtn-top ibtn-disabled' onclick=notOperFun('"+val+"','DELETE')>删除</button>";  
		        	  }
		        	  
		        	 
		          }},
		          {field:'sb',title: '上报',align: 'center',width: 90,formatter:function(val,rec){
		        	  if(rec.bizStatus=='1'){
		        		  return "<button class='ibtn-front' onclick=reportFun('"+rec.id+"','SB')>上报</button><button class='ibtn-log' onclick=showLogFun('"+rec.id+"')>审批日志</button>";
		        	  }else if(rec.bizStatus=='2'){
		        		  return "<button class='ibtn-front' style='color:red' onclick=reportFun('"+rec.id+"','SH')>审核</button><button class='ibtn-log' onclick=showLogFun('"+rec.id+"')>审批日志</button>";
		        	  }else if(rec.bizStatus=='3'){
		        		  return "<button class='ibtn-sqgg' onclick=reportFun('"+rec.id+"','SQGG')>申请更改</button><button class='ibtn-log' onclick=showLogFun('"+rec.id+"')>审批日志</button>";
		        	  }
		          }},
		          {field:'billDesc',title: '备注',align: 'center',width: 60,hidden:true}
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
              <form id="queryForm" method="post">
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
						  <input style="width:200px;" class="easyui-combobox" id="queryAccountUserId" name="accountUserId" data-options="valueField:'id',textField:'text',url:'${ctx}/erpUser/getUserComboboxData',onSelect:function(){doQuery()}">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;font-weight: bold;">入账类别:</td>
					<td style="width:150px;">
						<input  type="radio" id="radio_queryAccountType_sr"  name="queryAccountType" value="1" checked="checked" />
					    <label for="radio_queryAccountType_sr">收入</label>
						<input  type="radio"  id="radio_queryAccountType_zc" name="queryAccountType" value="2" />
						<label for="radio_queryAccountType_zc">支出</label>
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
<div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:460px;height:425px;padding:10px;">
   <form id="addForm" method="post">
   	<table  class="isingelTable">
   		<tr>
   			<th>入账时间：</th>
   			<td>
   				<input type="hidden" id="id" name="id"></input>
   				<input type="hidden" id="dataState" name="dataState" value="1"></input>
   				<%--在上报或审核时使用，用于区分到底是上报还是审核 --%>
   				<input type="hidden" id="sbFlag" name="sbFlag"></input>
   				
   				<input style="width:250px;"  class="easyui-datebox" type="text" id="billDate" name="billDate" data-options="required:false"></input>
   			</td>
   		<tr>
   	
   		<tr>
   			<th>入账人：</th>
   			<td>
   				<input style="width:250px;" class="easyui-combobox" id="billUserId" name="billUserId" data-options="valueField:'id',textField:'text',url:'${ctx}/erpUser/getUserComboboxData'">
   				
   			</td>
   		</tr>
   		
   		
   		<tr>
   			<th>入账类别：</th>
   			<td>
   				<input  type="radio" id="radio_accountType_sr" name="accountType" value="1" checked="checked" />
			    <label for="radio_accountType_sr">收入</label>
				<input  type="radio" id="radio_accountType_zc" name="accountType" value="2" />
				<label for="radio_accountType_zc">支出</label>
   			</td>
   		<tr>
   		
   		
   		<tr>
   			<th>入账事项：</th>
   			<td>
   			
   			<!-- 
   			<textarea name="accountItem" style="width:248px;height:30px;">
   		    </textarea> -->
   			
   			<input style="width:250px;" class="easyui-combobox" id="accountTypeItemId" name="accountTypeItemId" data-options="valueField:'id',textField:'text',url:'${ctx}/erpAccountType/getListByPidAndType?pid=1&type=1'">
   			
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
   		      	<textarea name="billDesc" style="width:248px;height:80px;">
   		      </textarea></td> 
   		 </tr>
   		 
   		 
   		 <tr id="shOption">
   		      <th style="color:red" id="sqggTH">审核意见：</th>
   		      <td colspan="6" align="center" style="padding:1px;">
   		      	<textarea name="shDesc" id="shDesc" style="width:248px;height:80px;">
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
    		
    		<%--上报 --%>
    		<tr id="reportTd">
    			<td style="width:50%;text-align: right;padding-right: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Folderup'" id="saveBtn" class="easyui-linkbutton" onclick="reportForm()">上报</a></td>
    			<td style="width:50%;text-align: left;padding-left: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">关闭</a></td>
    		</tr>
    		
    		<%--审核--%>
    		<tr id="shTd">
    			<td style="width:45%;text-align: right;"><a href="javascript:void(0)" data-options="iconCls:'Accept'" id="saveBtn" class="easyui-linkbutton" onclick="submitSpForm('TG')">通过</a></td>
    			<td style="width:20%;text-align: center;"><a href="javascript:void(0)" data-options="iconCls:'Cancel'" id="saveBtn" class="easyui-linkbutton" onclick="submitSpForm('DH')">打回</a></td>
    			<td style="width:45%;text-align: left;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">关闭</a></td>
    		</tr>
    		
    		<%--申请更改--%>
    		<tr id="sqggTd">
    			<td style="width:50%;text-align: right;padding-right: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Folderup'" id="saveBtn" class="easyui-linkbutton" onclick="submitSpForm('SQGG')">申请更改</a></td>
    			<td style="width:50%;text-align: left;padding-left: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">关闭</a></td>
    		</tr>
    		
		 </table>
    </div>
</div>


<div id="erpLogWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:460px;height:358px;padding:10px;">
	 <table id="erpLogDgTable">
	 </table>
</div>

</body>
</html>