<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>天气预报</title>
<script type="text/javascript">
var dgTable;
$(function(){
	var searchHeight=$('.searchBox').height();
	var dgTableHeight=$(window).height()-searchHeight-30;
	dgTable=$('#dgTable').edatagrid({  
		url:ctx+'/user/pagerList',
		method:'post',
	    queryParams: {
	    	
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
				   {field:'id',title: '主键',align: 'left',width: 100,hidden:true},
		           {field:'weatherDate',title: '日期',width: 60,align: 'center'},
		           {field:'weatherConditions',title: '天气',align: 'center',editor:'text',width: 300}
		]]
		,toolbar:$('#tb')
		})
		
	})
	
	
	function onAfterEdit(index,row,changes) {  
		debugger; 
	    //alert(row.weatherConditions);
	} 
	
	
	function doQuery(){
		var options = $("#dgTable").datagrid("options");
	    $("#dgTable").datagrid(options);
	}
	
</script>
</head>
<body>

<div class="easyui-layout" fit="false">
		<fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">开始时间:</td>
					<td style="width:200px;text-align: left;">
						<input id="telephone" name="telephone" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">结束时间:</td>
					<td style="width:200px;">
						<input id="birthday" name="birthday" style="width:150px">
					</td>
					<td>&nbsp;</td>
					<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" iconCls="Zoom">查询</a></td>
				</tr>
				
				
			</table>
            
        </fieldset>
		<table id="dgTable" >
		</table>
</div>
	
	<div id="tb">
	    <a href="#" id="add" class="easyui-linkbutton" plain="true"  iconCls="icon-save">保存</a>
	</div>
	
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery-easyui-1.4.3/jquery.edatagrid.js"></script>
	

</body>
</html>