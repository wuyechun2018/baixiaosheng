<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/ajaxfileupload.js"></script>

<title>飘窗设置</title>
<script type="text/javascript">

//图片上传
function preView(){
  $.ajaxFileUpload({
          url:'${ctx}/article/preViewImage',
          secureuri:false ,
          fileElementId:'filebox_file_id_1',
          dataType: 'text',
          success: function (data){
        	 var dataObj=eval("(" + data + ")");
             $('#view_image').attr('src',dataObj.msg);
             $('#link_image_url').val(dataObj.msg);
          },
          error: function (data, status, e){
        	  debugger;
          }
      });
    return false;
}
/***************************以上是 导航类型 管理相关方法***************************/

//点击"添加弹出框-保存按钮",提交表单
function submitForm(){
  if($("#addForm").form('validate')){
	$.ajax({
         type: "POST",
         url:'${ctx}/floatWin/save',
         data: $('#addForm').serialize(),
         success: function (data) {
        	 $('#addWin').window('close');
		    //刷新列表
		    $("#dgTable").datagrid('reload');
         },
         error: function(data) {
             //alert("error:"+data.responseText);
             //ReferenceError: obj is not defined
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
	//默认不展示飘窗
	$("#radio_showState_n" ).prop("checked",true);
	$('#displayOrder').val('1');
	$('#linkTargetType').val('_blank');
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
    $('#addWin').window('open');
    $('#addWin').panel({
		title : '编辑',
		iconCls : "icon-edit"
	});
    $("#addForm").form("load", record); 
   	if(record.linkImageUrl){
   	  $('#view_image').attr('src',record.linkImageUrl);
   	  $('#preimage').filebox('setValue',record.linkImageUrl);
   	
   	}else{
   	  $('#view_image').attr('src',ctx+"/resources/images/nopic.png");	
   	}
   
}

//点击“操作列-删除”
function deleteFun(id){
	$.messager.confirm("删除确认", "您确认删除该条记录吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/floatWin/delete',
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
    options.queryParams.winName=$('#winName').val();
    options.queryParams.linkUrl=$('#linkUrl').val();
    $("#dgTable").datagrid(options);
}



 $(function(){
	 //中间表格
	var dgTableHeight=$(window).height()-$('.searchBox').height()-28;
    $('#dgTable').datagrid({  
		url:ctx+'/floatWin/pagerList',
		method:'post',
	    queryParams: {
	      	winName:'',
	      	linkUrl:''
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
		          {field:'winName',title: '飘窗名称',align: 'center',width: 100},
		          {field:'linkUrl',title: '链接地址',align: 'center',width: 100}, 
		          {field:'showState',title: '是否显示',align: 'center',width: 100, formatter:function(val,rec){
		        	  if(val=='1'){
		        		  return '<span style="color:green;">显示</span>';
		        	  }else{
		        		  return '<span style="color:red;">不显示</span>';
		        	  }
		          }}, 
		          {field:'linkTargetType',title: '链接打开方式',align: 'center',width: 100,hidden:true}, 
		          {field:'winDesc',title: '备注',align: 'center',width: 100,hidden:true},
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
    <div data-options="region:'center'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">飘窗名称:</td>
					<td style="width:200px;text-align: left;">
						<input id="winName" name="winName" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">链接地址:</td>
					<td style="width:200px;">
						<input id="linkUrl" name="linkUrl" style="width:150px">
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
 <div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:680px;height:390px;padding:10px;">
	    <form id="addForm" method="post">
		   	<table class="isingelTable">
				      <tr>
				        <th>飘窗名称：</th>
				        <td>
				          <input type="hidden" name="id"></input>
				          <input style="width:250px;" class="easyui-textbox" type="text" name="winName" data-options="required:true"></input>
				        </td>
				        
				         <td rowspan="7" style="border: 1px solid;width:258px;text-align: center;">
					    	<img id="view_image" src="${ctx}/resources/images/image.png" alt="配图预览"  noresize="true" style="max-width:270px;max-height:270px;background-color:#ccc;border:1px solid #333">
					    	<input type="hidden" id="link_image_url" name="linkImageUrl" style="width:300px;" />
					    </td>
				        
				      </tr>
				      <tr>
				        <th>链接地址：</th>
				        <td>
				          <input style="width:250px;" class="easyui-textbox" type="text" name="linkUrl"></input>
				          <input type="hidden" id="linkTargetType" name="linkTargetType" value="_blank"  />
				        </td>
				      </tr>
				      
				      <tr>
				        <th>配图：</th>
				        <td>
				         	<input name="preimage" id="preimage"  class="easyui-filebox"  style="width:250px;" data-options="onChange:function(){preView()},buttonText:'选择文件', accept:'image/jpeg', prompt : '请选择一个图片类型的文件'"/>
				       		<input type="hidden"  id="displayOrder" name="displayOrder"  value="1"></input>
				        </td>
				      </tr>
				      
				      <tr>
				        <th>是否显示：</th>
				        <td>
				         	<input  type="radio" id="radio_showState_n" name="showState" value="0" checked="checked" />
						    <label for="radio_showState_n" >否</label>
							<input  type="radio" id="radio_showState_y" name="showState" value="1" />
							<label for="radio_showState_y">是</label>
				        </td>
				      </tr>
				      
				      <tr>
				        <th>备注：</th>
				        <td align="center" style="padding:1px;">
				          <textarea name="winDesc" style="width:248px;height:80px;"></textarea>
				        </td>
				      </tr>
			</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<table style="width:100%;">
    		<tr>
    			<td style="width:20%;text-align: right;padding-left: 5px;padding-right: 5px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
    			<td style="width:20%;text-align: left;padding-left: 5px;padding-right: 5px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">取消</a></td>
    		</tr>
		 	</table>
	    </div>
	</div>
 
</body>
</html>