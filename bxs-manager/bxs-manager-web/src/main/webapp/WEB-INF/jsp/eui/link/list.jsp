<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/ajaxfileupload.js"></script>

<title>友情链接</title>
<script type="text/javascript">
//当前选中的左边树的节点ID,即单位ID，它是一个全局变量
var SELECT_NODE_Id="";

/***************************以下是 导航类型 管理相关方法***************************/
//点击"添加类型弹出框"
function addTypeFun(){
	$('#addTypeWin').window('open');
	$('#addTypeForm').form('clear');
	var node=$('#leftTree').tree('getSelected');
	if(!node){
		node=$("#leftTree").tree('getRoot');
	}
	loadTypeTree();
	if(node){
		//给部门下拉框赋值
		$('#addlinkTypeComboTree').combotree('setValue', node.id);
	}
};
//点击添加类型按钮，弹出框前加载下拉框树
function loadTypeTree(){
	$('#addlinkTypeComboTree').combotree({
		url : '${ctx}/linkType/getListByPid?pid=0',
		onBeforeExpand : function(node, param) {
			   $('#addlinkTypeComboTree').combotree("tree").tree("options").url =ctx+ "/linkType/getListByPid?pid=" + node.id;
			},
		width:'250',
	    required: true,
	    onLoadSuccess : function(node, data) {
	    	$('#addlinkTypeComboTree').combotree("tree").tree('expandAll');
		}
	});
}

function loadAddLinkTree(){
	$('#addlinkComboTree').combotree({
		url : '${ctx}/linkType/getListByPid?pid=0',
		onBeforeExpand : function(node, param) {
			   $('#addlinkComboTree').combotree("tree").tree("options").url =ctx+ "/linkType/getListByPid?pid=" + node.id;
			},
		width:'250',
	    required: true,
	    onLoadSuccess : function(node, data) {
	    	$('#addlinkComboTree').combotree("tree").tree('expandAll');
		}
	});
}


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



//点击"添加弹出框-取消按钮",提交表单
function clearTypeForm(){
	$('#addTypeForm').form('clear');
	$('#addTypeWin').window('close');
}

//保存类型
function submitTypeForm(){
	  if($("#addTypeForm").form('validate')){
		$.ajax({
	         type: "POST",
	         url:'${ctx}/linkType/save',
	         data: $('#addTypeForm').serialize(),
	         success: function (data) {
	        	 $('#addTypeWin').window('close');
			    //刷新列表
	        	 loadLeftTree();
	         },
	         error: function(data) {
	             alert("error:"+data.responseText);
	          }
	   		});
	   }
	};
	
//点击“操作列-修改”
function editTypeFun(id) {
	var node=$('#leftTree').tree('getSelected');
	if(node){
		   $('#addTypeWin').window('open');
		    $('#addTypeWin').panel({
				title : '编辑',
				iconCls : "icon-edit"
			});
		    loadTypeTree();
		    $('#addTypeForm').form('load',{
        	 	id:node.id,
        	 	pid:node.attributes.pid,
        	 	linkTypeName:node.text,
        	 	linkTypeCode:node.attributes.linkTypeCode,
        	 	linkTypeDesc:node.attributes.linkTypeDesc
			});
		    
		    
		    
	}else{
		  $.messager.alert('提示信息',"请选中您要修改的导航类型！");
	}
}	

//点击“操作列-删除”
function delTypeFun(){
	var node=$('#leftTree').tree('getSelected');
	if(node){
	 $.messager.confirm("删除确认", "您确认删除导航类型吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/linkType/delete',
    			data:{
    				id:node.id
    			},
    			async: false,
    		    error: function(request) {
    		        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
    		    },
    		    success: function(data) {
    		    	$.messager.alert('提示信息',data.msg);
    		    	loadLeftTree();
    		    }
    		})
        }
      })
      }else{
    	  $.messager.alert('提示信息',"请选中您要删除的导航类型！");
      }
}


/***************************以上是 导航类型 管理相关方法***************************/




//点击"添加弹出框-保存按钮",提交表单
function submitForm(){
  if($("#addForm").form('validate')){
	$.ajax({
         type: "POST",
         url:'${ctx}/link/save',
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
	var node=$('#leftTree').tree('getSelected');
	if(!node){
		node=$("#leftTree").tree('getRoot');
	}
	loadAddLinkTree();
	if(node){
		$('#addlinkComboTree').combotree('setValue', node.id);
	}
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
	loadAddLinkTree();
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
	$.messager.confirm("删除确认", "您确认删除该用户吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/link/delete',
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
    options.queryParams.linkTypeId=SELECT_NODE_Id;
    options.queryParams.linkName=$('#linkName').val();
    options.queryParams.linkUrl=$('#linkUrl').val();

   
    $("#dgTable").datagrid(options);
}

//重新加载左侧树
function loadLeftTree(){
	$('#leftTree').tree({
		url : '${ctx}/linkType/getListByPid?pid=0',
		onBeforeExpand : function(node, param) {
			 $('#leftTree').tree('options').url = ctx+ "/linkType/getListByPid?pid=" + node.id;
			},
		width:'250',
	    required: true,
	    onLoadSuccess : function(node, data) {
	    	$("#leftTree").tree('expandAll');
		}
	});
}


 $(function(){
	 $('#leftTree').tree({
			checkbox : false,
			url : '${ctx}/linkType/getListByPid?pid=0',
			method : 'post',
			onBeforeExpand : function(node, param) {
			   $('#leftTree').tree('options').url = ctx+ "/linkType/getListByPid?pid=" + node.id;
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
		url:ctx+'/link/pagerList',
		method:'post',
	    queryParams: {
	    	linkTypeId:'',
	      	linkName:'',
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
		          {field:'linkName',title: '链接名称',align: 'center',width: 100},
		          {field:'linkTypeId',title: '链接类型ID',align: 'center',width: 100,hidden:true},
		          {field:'linkTypeName',title: '类型名称',align: 'center',width: 100},
		          {field:'linkUrl',title: '链接地址',align: 'center',width: 100}, 
		          {field:'linkTargetType',title: '链接打开方式',align: 'center',width: 100}, 
		          {field:'linkDesc',title: '备注',align: 'center',width: 100,hidden:true},
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
    <div data-options="region:'west',split:false,border:true,title:'链接类型',footer:$('#footerbar')" style="width: 240px; padding: 1px;">
        <div>
            <ul id="leftTree"></ul>
        </div>
    </div>
    <div data-options="region:'center'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">链接名称:</td>
					<td style="width:200px;text-align: left;">
						<input id="linkName" name="linkName" style="width:150px">
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
 
<%--TBar 左边链接类型按钮 --%>
<div id="footerbar">
	   &nbsp;&nbsp;
	   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addTypeFun()"></a>
	   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editTypeFun()"></a>
	   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delTypeFun()"></a>
</div>
 
 <%--点击"添加"弹出的窗口 --%>
 <div id="addWin" class="easyui-window" title="&nbsp;添加" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:680px;height:390px;padding:10px;">
	    <form id="addForm" method="post">
		   	<table class="isingelTable">
				  <tr>
					    <th>导航类型：</th>
					    <td>
					      <input type="hidden" name="id"></input>
					      <input style="width:250px;" class="easyui-textbox" type="text" id="addlinkComboTree" name="linkTypeId" data-options="required:false"></input>
					    </td>
					    <td rowspan="7" style="border: 1px solid;width:258px;text-align: center;">
					    	<img id="view_image" src="${ctx}/resources/images/image.png" alt="配图预览"  noresize="true" style="max-width:270px;max-height:270px;background-color:#ccc;border:1px solid #333">
					    	<input type="hidden" id="link_image_url" name="linkImageUrl" style="width:300px;" />
					    </td>
				    </tr>
				      <tr>
				        <th>导航名称：</th>
				        <td>
				          <input style="width:250px;" class="easyui-textbox" type="text" name="linkName" data-options="required:true"></input>
				        </td>
				      </tr>
				      <tr>
				        <th>导航地址：</th>
				        <td>
				          <input style="width:250px;" class="easyui-textbox" type="text" name="linkUrl"></input>
				        </td>
				      </tr>
				      <tr>
				        <th>打开方式：</th>
				        <td>
				          <select data-options="panelHeight:'auto'" class="easyui-combobox" name="linkTargetType" style="width:250px">
				            <option value="_blank" selected="selected">_blank(新窗口)</option>
				            <option value="_self">_self(当前窗口)</option>
				            <option value="_parent">_parent(父窗口)</option>
				            <option value="_top">_top(顶级窗口)</option></select>
				        </td>
				      </tr>
				      <tr>
				        <th>链接配图：</th>
				        <td>
				         	<input name="preimage" id="preimage"  class="easyui-filebox"  style="width:250px;" data-options="onChange:function(){preView()},buttonText:'选择文件', accept:'image/jpeg', prompt : '请选择一个图片类型的文件'"/>
				        </td>
				      </tr>
				      
				      <tr>
				        <th>排序：</th>
				        <td>
				          <input style="width:250px;" class="easyui-textbox" type="text" name="displayOrder"></input>
				        </td>
				      </tr>
				      <tr>
				        <th>备注：</th>
				        <td align="center" style="padding:1px;">
				          <textarea name="linkDesc" style="width:248px;height:80px;"></textarea>
				        </td>
				      </tr>
			</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<table style="width:100%;">
    		<tr>
    			<td style="width:20%;text-align: right;padding-left: 5px;padding-right: 5px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
    			<td style="width:20%;text-align: left;padding-left: 5px;padding-right: 5px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">取消2</a></td>
    		</tr>
		 	</table>
	    </div>
	</div>
	
	
<%--点击"添加类型"弹出的窗口 --%>
<div id="addTypeWin" class="easyui-window" title="&nbsp;添加类型" data-options="collapsible:false,maximizable:false,minimizable:false,iconCls:'icon-add',resizable:true,closed:true,modal:true" style="width:460px;height:315px;padding:10px;">
   <form id="addTypeForm" method="post">
   	<table  class="isingelTable">
   		<tr>
   			<th>上级类型：</th>
   			<td>
   				<input type="hidden" name="id" ></input>
   				<input style="width:250px;"  class="easyui-textbox" type="text" id="addlinkTypeComboTree" name="pid" data-options="required:false"></input>
   			</td>
   		<tr>
   		
   		<tr>
   			<th>类型名称：</th>
   			<td>
   				<input style="width:250px;"  class="easyui-textbox" type="text"  name="linkTypeName" data-options="required:true"></input>
   			</td>
   		</tr>
   	
   		<tr>
   			<th>类型编码：</th>
   			<td>
   				<input style="width:250px;"  class="easyui-textbox" type="text"  name="linkTypeCode" ></input>
   			</td>
   		</tr>
   		<tr>
   		      <th>备注：</th>
   		      <td colspan="6" align="center" style="padding:1px;">
   		      	<textarea name="linkTypeDesc" style="width:248px;height:80px;">
   		      </textarea></td> 
   		 </tr> 
   	</table>
   </form>
    <div style="text-align:center;padding:25px 5px 5px 5px;">
    	<table style="width:100%;">
    		<tr>
    			<td style="width:50%;text-align: right;padding-right: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitTypeForm()">保存</a></td>
    			<td style="width:50%;text-align: left;padding-left: 15px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearTypeForm()">取消</a></td>
    		</tr>
		 </table>
    </div>
</div>
 
 
</body>
</html>