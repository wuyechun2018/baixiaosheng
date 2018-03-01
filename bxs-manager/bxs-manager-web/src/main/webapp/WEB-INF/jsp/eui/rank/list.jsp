<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>信息排名</title>
<style type="text/css">
.datagrid-row {  
  height: 42px;  
  text-align:center;  
}

.datagrid-editable-input{
  height: 40px;  
  text-align:center; 
}
</style>


<script type="text/javascript">
var dgTable;
$(function(){
	//页面打开时初始化数据	
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/infoRank/initData',
		data:{
			statYear:$('#statYear').val()
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	
	    }
	})
	
	var searchHeight=$('.searchBox').height();
	var dgTableHeight=$(window).height()-searchHeight-30;
	dgTable=$('#dgTable').edatagrid({  
		url:ctx+'/infoRank/pagerList',
		method:'post',
	    queryParams: {
	    	//weatherDateStart:myDateFormatter(new Date()),
	    	//weatherDateEnd:myDateFormatter(myAddDate(6))
		},
		fit:false,
		pageSize: 20,
		height: dgTableHeight,
		onEndEdit:onAfterEdit,  
		fitColumns:true,
		striped: true,
		singleSelect:true,
		pagination: true,  
		rownumbers: true,  
		columns:[[
				   {field:'id',title: '主键',align: 'left',width: 10,hidden:true},
				   {field:'showSate',title: '显示状态',align: 'left',width: 10,hidden:true},
				   {field:'dataState',title: '数据状态',align: 'left',width: 10,hidden:true},
				   {field:'statYear',title: '统计周期',width: 40,align: 'center',hidden:true},
				   {field:'deptId',title: '部门主键',width: 40,align: 'center',hidden:true},
				   {field:'deptName',title: '部门',width: 40,align: 'center'},
		           {field:'zhidui',title: '支队',align: 'center',width: 40},
		           {field:'shiju',title: '市局',align: 'center',editor:'text',width: 40},
		           {field:'zongdui',title: '总队',align: 'center',editor:'text',width: 40},
		           {field:'shengdui',title: '省队',align: 'center',editor:'text',width: 40},
		           {field:'buju',title: '部局',align: 'center',editor:'text',width: 40}
		]]
		,toolbar:$('#tb')
		})
		
		doQuery();
	})
	
	
	function onAfterEdit(index,row,changes) {  
		$.ajax({
			cache: true,
			type: "POST",
			url:'${ctx}/infoRank/save',
			data:{
				id:row.id,
				showSate:row.showSate,
				dataState:row.dataState,
				statYear:row.statYear,
				deptId:row.deptId,
				zhidui:row.zhidui,
				shiju:row.shiju,
				zongdui:row.zongdui,
				shengdui:row.shengdui,
				buju:row.buju
			},
			async: false,
		    error: function(request) {
		        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
		    },
		    success: function(data) {
		    	
		    }
		})
	} 
	
	function initCell(container, options){  
	    var input = $('<input type="text" class="datagrid-editable-input" style="height: 40px;">').appendTo(container);  
	    return input;  
	} 
	
	
	function doQuery(){
		var options = $("#dgTable").datagrid("options");
		//options.queryParams.weatherDateStart= $('#weatherDateStart').datebox('getValue');
		//options.queryParams.weatherDateEnd= $('#weatherDateEnd').datebox('getValue');
	    $("#dgTable").datagrid(options);
	}
	
	function saveFun(){
		 for(var i=0;i<20;i++){
			 $("#dgTable").datagrid('endEdit',i);
		 }
	}
	
	
</script>
</head>
<body>

<div class="easyui-layout" fit="false">
		<fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">统计周期:</td>
					<td style="width:200px;text-align: left;">
						<%--
						<input class="easyui-datebox" type="text" ID="weatherDateStart" name="weatherDateStart" style="width:150px" />
						 --%>
						<input id="statYear" type="text" value="2018"   onfocus="WdatePicker({skin:'default',dateFmt:'yyyy'})" class="Wdate" style="width:150px;"/>
					</td>
					<%--
					<td style="width:100px;text-align: right;margin-right: 5px;">结束时间:</td>
					<td style="width:200px;">
						<input class="easyui-datebox" type="text" ID="weatherDateEnd" name="weatherDateEnd" style="width:150px" />
					</td>
					 --%>
					<td>&nbsp;</td>
					<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" iconCls="Zoom">查询</a></td>
				</tr>
				
				
			</table>
            
        </fieldset>
		<table id="dgTable" >
		</table>
</div>
	
	<div id="tb">
	    <a href="javascript:void(0)" onclick="saveFun()" id="add" class="easyui-linkbutton" plain="true"  iconCls="icon-save">保存</a>
	</div>

<script type="text/javascript" src="${ctx}/resources/js-lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery-easyui-1.4.3/jquery.edatagrid.js"></script>
	

</body>
</html>