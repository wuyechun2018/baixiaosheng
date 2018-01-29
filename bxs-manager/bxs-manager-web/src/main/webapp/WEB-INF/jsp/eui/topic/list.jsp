<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>文章栏目</title>
<script type="text/javascript">

//点击"添加"按钮事件
function addNodeFun(){
	var node=$('#leftTree').tree('getSelected');
	if(!node){
		node=$("#leftTree").tree('getRoot');
	}
	if(node){
		//增加
		$('#rightForm').form('clear');
		//节点主键
		$("#pid").val(node.id);
		//默认可签收
	    $('#topic_type_1').prop('checked', 'checked');
	    // 默认在用
	    $('#data_state_1').prop('checked', 'checked');
	}else{
		$.messager.alert('提示',"请选择父栏目");
	}
	
}

//点击"删除"按钮事件
function delNodeFun(){
	var node=$('#leftTree').tree('getSelected');
	if(node){
		$.messager.confirm("删除确认", "删除后将不可恢复，您确认删除选定的栏目吗？", function (action) {
            if (action) {
            	$.ajax({
        			cache: true,
        			type: "POST",
        			url:'${ctx}/topic/delete',
        			data:{
        				id:node.id
        			},
        			async: false,
        		    error: function(request) {
        		        alert("Connection error");
        		    },
        		    success: function(data) {
        		    	$.messager.alert('提示',data.msg);
        		    	$("#leftTree").tree("options").url='${ctx}/topic/getListByPid?pid=0' 
        		        $("#leftTree").tree("reload");
        		    	$('#rightForm').form('clear');
        		    }
        		
        		})
            }
            })
	}else{
		$.messager.alert('提示',"请选择要删除的栏目");
	}
	
}




//点击节点事件
function clickNodeFun(node){
	 //点击事件
    //注意,此处是 "easyui-textbox",不能用jquery的赋值方法
    $("#id").val(node.id);
    $("#pid").val(node.attributes.pid);
    $("#topicName").textbox('setValue',node.text);
    $("#topicCode").textbox('setValue',node.attributes.topicCode);
    $("#disOrder").textbox('setValue',node.text);
    $("#topicDesc").textbox('setValue',node.attributes.topicDesc);
    $('#displayOrder').textbox('setValue',node.attributes.displayOrder);
    
    //可否签收
    if(node.attributes.topicType=='1'){
		  //解决chrome下问题
		  $('#topic_type_1').prop('checked', 'checked');
	  }else{
		  $('#topic_type_2').prop('checked', 'checked');
	  }
    //是否在用
    if(node.attributes.dataState=='1'){
		  //解决chrome下问题
		  $('#data_state_1').prop('checked', 'checked');
	  }else{
		  $('#data_state_2').prop('checked', 'checked');
	  }
}

//右击节点事件
function contextMenuFun(node){
	 $('#leftTree').tree('select', node.target);  
     $('#mm').menu('show', {  
         left: e.pageX,  
         top: e.pageY  
     });
     $("#mm").menu({
         onClick : function (item) {
         	//启用按钮
         	$('#saveBtn').linkbutton('enable');
         	$('#resetBtn').linkbutton('enable');
         	
         	if(item.name=='add'){
         		addNodeFun(node);
         		
         	}else if(item.name=='delete'){
         		//删除
         		$.messager.confirm("删除确认", "您确认删除选定的记录吗？", function (action) {
		            if (action) {
		            	$.ajax({
		        			cache: true,
		        			type: "POST",
		        			url:'${ctx}/sysDic/delete',
		        			data:{
		        				id:node.id
		        			},
		        			async: false,
		        		    error: function(request) {
		        		        alert("Connection error");
		        		    },
		        		    success: function(data) {
		        		    	$("#leftTree").tree("options").url='${ctx}/sysDic/getChildList?pid=0' 
		        		        $("#leftTree").tree("reload");
		        		    	$('#rightForm').form('clear');
		        		    }
		        		
		        		})
		            }
		            })
         		
         	}else{
         		clickNodeFun(node);
         	}
         }
     });
}


//提交表单
function submitForm(){
      if($("#rightForm").form('validate')){  
		 $.ajax({
	         type: "POST",
	         url:'${ctx}/topic/save',
	         data: $('#rightForm').serialize(),
	         success: function (data) {
	         	$.messager.alert('提示',data.msg);
	         	$("#leftTree").tree("options").url='${ctx}/topic/getListByPid?pid=0' 
	            $("#leftTree").tree("reload");
	         },
	         error: function(data) {
	             alert("error:"+data.responseText);
	          }
	
	     });
     }
}


$(function() {
		//禁用按钮
		//$('#saveBtn').linkbutton('disable');
		//$('#resetBtn').linkbutton('disable');
		
		//加载权限菜单树
		$('#leftTree').tree({
					checkbox : false,
					url : '${ctx}/topic/getListByPid?pid=0',
					method : 'post',
					onBeforeExpand : function(node, param) {
					   $('#leftTree').tree('options').url = ctx+ "/topic/getListByPid?pid=" + node.id;
					},
					onClick : function(node) {
						   clickNodeFun(node);
					},
					onLoadSuccess : function(node, data) {
						//默认展开根节点
						var rooNode = $("#leftTree").tree('getRoot');
						$("#leftTree").tree('expandAll');

					},
					onContextMenu: function(e, node){ 
						//右键事件
                        e.preventDefault();  
                        //contextMenuFun(node);
                    }
					
					
					
				});
	})
</script>



</head>
<body>
<div class="easyui-layout" style="width:700px;height:700px;" fit="true">
        <div data-options="region:'west',split:false,border:true,title:'文章栏目维护'" style="width: 240px; padding: 1px;">
            <div>
            <%-- 
             <div style="color:red;padding-left:20px;">右键 添加类别 </div>
             --%>
             <ul id="leftTree"></ul>
            </div>
        </div>
        <div id="tb" data-options="region:'center',title:'字典项'" style="padding:5px;height:auto">                
            <div style="padding:10px 60px 20px 60px">
		    <form id="rightForm" method="post">
		    	<table cellpadding="5" width="360px;">
		    		<tr>
		    			<td class="form-label-right-align">栏目名称：</td>
		    			<td>
		    				<input type="hidden" name="id"  id="id"></input>
		    				<input type="hidden" name="pid"  id="pid"></input>
		    				<input class="easyui-textbox" type="text" id="topicName" name="topicName" data-options="required:true" style="width:100%;"></input>
		    			</td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="form-label-right-align">栏目编码：</td>
		    			<td><input class="easyui-textbox" type="text" id="topicCode" name="topicCode"  style="width:100%;"></input></td>
		    		</tr>
		    		
		    		
		    		
		    		<tr>
		    			<td class="form-label-right-align">可否签收：</td>
						<td class="radioAlign">
						<input type="radio" id="topic_type_1" name="topicType"value="1" checked="checked" style="vetical-align:middle" />
						<label for="topic_type_1"  >是</label>
						<input  type="radio" id="topic_type_2" name="topicType" value="2"  />
						<label for="topic_type_2"  >否</label>
						</td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="form-label-right-align">是否在用：</td>
						<td class="radioAlign">
						<input type="radio" id="data_state_1" name="dataState" value="1" checked="checked" style="vetical-align:middle" />
						<label for="data_state_1"  >是</label>
						<input  type="radio" id="data_state_2" name="dataState" value="2"  />
						<label for="data_state_2"  >否</label>
						</td>
		    		</tr>
		    		
		    		<tr>
		    			<td class="form-label-right-align">排序：</td>
		    			<td><input class="easyui-numberbox" type="text" id="displayOrder" name="displayOrder"  data-options="required:true" style="width:100%;"></input></td>
		    		</tr>
		    		<tr>
		    			<td class="form-label-right-align">备注：</td>
		    			<td><input class="easyui-textbox" id="topicDesc" name="topicDesc" data-options="multiline:true" style="width:100%;height:60px"></input></td>
		    		</tr>
		    		
		    	</table>
		    </form>
		    <div style="text-align:center;padding-top:15px">
		    	<table>
		    		<tr>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Pageadd'" id="addBtn" class="easyui-linkbutton" onclick="addNodeFun()">添加栏目</a></td>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Applicationdelete'" id="delBtn" class="easyui-linkbutton" onclick="delNodeFun()">删除栏目</a></td>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
		    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="clearForm()">取消</a></td>
		    		</tr>
		    	</table>
		    </div>
	    </div>
        </div>
    </div>
    
    <div id="mm" class="easyui-menu" style="display: none;">
 		 <div id="mm-tabclose" data-options="iconCls:'Applicationadd'" name="add">添加</div>
         <%--
         <div id="mm-tabcloseall" data-options="iconCls:'Applicationdelete'" name="delete">删除</div>
         <div id="mm-tabcloseother" data-options="iconCls:'Applicationedit'" name="edit">修改</div>
 		 --%>
 	</div>

</body>
</html>