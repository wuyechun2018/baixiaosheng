<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<title>图片文章</title>
<script type="text/javascript">
//当前选中的左边树的节点ID,即单位ID，它是一个全局变量
var SELECT_NODE_Id="";

function doQuery(){
    var options = $("#dgTable").datagrid("options");
    //设置参数
    options.queryParams.topicId=SELECT_NODE_Id;
    //该页面只处理普通类型
    options.queryParams.articleType='2';
    options.queryParams.articleTitle=$('#articleTitle').val();
    options.queryParams.publishUserName=$('#publishUserName').val();
    options.queryParams.publishDeptId=$("#publishDeptComboTree").combotree("getValue")
    options.queryParams.checkState=$('#checkState').combobox('getValue');
    
    $("#dgTable").datagrid(options);
}

//点击"添加按钮"
function addFun(){
	 location.href=ctx+"/eui/article-image/add";
}

//点击“操作列-修改”
function editFun(id) {
	location.href=ctx+"/articleImage/euiEdit?id="+id;
}


//点击"置顶"效果
function topFun(id){
	$.ajax({
        type: "POST",
        url:'${ctx}/article/saveTopCount',
        data: {
        	id:id
        },
        success: function (data) {
        	 $.messager.alert('提示信息',"置顶成功，该文章将显示在本栏目第一条！");
        	 doQuery();
        },
        error: function(data) {
            alert("error:"+data.responseText);
         }
  		});
}


//文章预览
function viewFun(id){
	location.href=ctx+"/articleImage/showArticle?id="+id;
}

//文章审核
function checkFun(id){
	location.href=ctx+"/articleImage/check?id="+id;
}

//首页推荐
function toFront(id){
	var rowIndex=getSelectRowIndex(id);
    //获取操作列
    var record=$('#dgTable').datagrid('getData').rows[rowIndex];
    $('#toFrontWin').window('open');
    $("#toFrontForm").form("load", record); 
}


//点击“操作列-删除”
function deleteFun(id){
	$.messager.confirm("删除确认", "您确认删除该文章吗？", function (action) {
        if (action) {
        	$.ajax({
    			cache: true,
    			type: "POST",
    			url:'${ctx}/article/euiDelete',
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

//页面初始化
$(function(){
	 $('#leftTree').tree({
			checkbox : false,
			url : '${ctx}/topic/getListByPidAndTopicName?pid=0',
			queryParams:{topicName:'图片'},		
			method : 'post',
			onBeforeExpand : function(node, param) {
			   $('#leftTree').tree('options').url = ctx+ "/topic/getListByPidAndTopicName?pid=" + node.id;
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
	var dgTableHeight=$(window).height()-$('.searchBox').height()-51;
	$('#dgTableContainer').height(dgTableHeight); 
    $('#dgTable').datagrid({  
		url:ctx+'/article/pagerList',
		method:'post',
	    queryParams: {
	    	//普通类型
	    	articleType:'2',
	    	topicId:'',
	    	articleTitle:'',
	    	publishDeptId:'',
	    	checkState:''
		},
		fit:true,
		pageSize: 20,
		//height: dgTableHeight,
		fitColumns:true,
		striped: true,
		singleSelect:true,
		pagination: true,  
		rownumbers: true,  
		columns:[[
		          {field:'topicName',title: '栏目',align: 'center',width: 80},
		          {field:'articleTitle',title: '标题',align: 'center',width: 120,hidden:false,formatter:function(val,rec){
		        	  	//return "<a title='预览' onclick=viewFun('"+rec.id+"') class='preview_link' href='javascript:void(0)'>"+val+"</a>";
		        		return "<a title='[预览]"+val+"' onclick=viewFun('"+rec.id+"') class='preview_link' href='javascript:void(0)'>"+val+"</a>";
		          }},
		          {field:'publishDeptName',title: '发布部门',align: 'center',width: 80},
		          {field:'publishUserName',title: '发布人',align: 'center',width: 80}, 
		          //{field:'createDate',title: '发布时间',align: 'center',width: 120}, 
		          {field:'publishDate',title: '发布时间',align: 'center',width: 120}, 
		          {field:'checkState',title: '状态',align: 'center',width: 100,formatter:function(val,rec){
		        	  if(val=='1'){
		        		  return "<span style='color:green'><a title='请审核' class='slink' onclick=checkFun('"+rec.id+"')>正常</a></span>";
		        	  }else if(val=='0'){
		        		  return "<span style='color:red'><a title='请审核' class='slink'  onclick=checkFun('"+rec.id+"')>未审核</a></span>";
		        	  }else{
		        		  return "<span style='color:#ec53ca'><a title='不予通过' class='slink'  onclick=checkFun('"+rec.id+"')>不予通过</a></span>";
		        	  }
		          }}, 
		          {field:'viewCount',title: '查看次数',align: 'center',width: 50},
		          {field:'id',title: '操作',align: 'center',width: 120, formatter:function(val,rec){
		        	 // return "<span class='btn_a_top'><a href='javascript:void(0)' onclick=editFun('"+val+"') >置顶</a></span><span class='btn_a_edit'><a href='javascript:void(0)' onclick=editFun('"+val+"') >编辑</a></span><span class='btn_a_delete'><a href='javascript:void(0)' onclick=deleteFun('"+val+"') >删除</a></span>";
		        	  return "<span class='btn_a_top'><a href='javascript:void(0)' onclick=topFun('"+val+"') >置顶</a></span><span class='btn_a_front'><a href='javascript:void(0)' onclick=toFront('"+val+"') >首推</a></span><span class='btn_a_edit'><a href='javascript:void(0)' onclick=editFun('"+val+"') >编辑</a></span><span class='btn_a_delete'><a href='javascript:void(0)' onclick=deleteFun('"+val+"') >删除</a></span>";
		          }}
		]]
		,toolbar:$('#tb')
	  });
    
    //查询表单发布部门下拉框树
    $('#publishDeptComboTree').combotree({
		url : '${ctx}/dept/getListByPid?pid=0',
		onBeforeExpand : function(node, param) {
			   $('#publishDeptComboTree').combotree("tree").tree("options").url =ctx+ "/dept/getListByPid?pid=" + node.id;
			},
		width:'155',
	    required: false,
	    onLoadSuccess : function(node, data) {
	    	$('#publishDeptComboTree').combotree("tree").tree('expandAll');
		}
	});
    
 })
	
</script>
</head>
<body>
<div class="easyui-layout"  fit="true">
    <div data-options="region:'west',split:false,border:true,title:'文章栏目'" style="width: 240px; padding: 1px;">
        <div>
            <ul id="leftTree"></ul>
        </div>
    </div>
    <div data-options="region:'center',title:'文章列表'" style="padding:5px;height:auto">
        <fieldset style="margin: 0" class="searchBox">
            <legend>信息查询</legend>
            <table style="width:100%;">
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">标题:</td>
					<td style="width:200px;text-align: left;">
						<input id="articleTitle" name="articleTitle" style="width:150px">
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">审核状态:</td>
					<td style="width:200px;">
						<select data-options="panelHeight:'auto'" class="easyui-combobox" id="checkState" name="checkState"  style="width:150px">
							<option value="2" selected="selected">全部</option>
							<option value="0">未审核</option>
							<option value="1">正常</option>
						</select>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width:100px;text-align: right;margin-right: 5px;">发布部门:</td>
					<td style="width:200px;text-align: left;">
						<input style="width:160px" id="publishDeptComboTree"  name="publishDeptId" />
					</td>
					<td style="width:100px;text-align: right;margin-right: 5px;">发布人:</td>
					<td style="width:200px;">
						<input id="publishUserName" name="publishUserName" style="width:150px">
					</td>
					<td>&nbsp;</td>
					<td><a href="javascript:void(0)" id="search" onclick="doQuery()" class="easyui-linkbutton" iconCls="Zoom">查询</a></td>
				</tr>
				
				
			</table>
            
        </fieldset>
        <div style="height:85%" id="dgTableContainer">
	        <table id="dgTable">
	        </table>
	     </div>   
    </div>
 </div> 
 
<%--TBar 添加按钮 --%>
<div id="tb">
    <a href="javascript:void(0)" onclick="addFun()" id="add" class="easyui-linkbutton" plain="true"  iconCls="Applicationadd">添加</a>
</div>
  
</body>
</html>