<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息报送列表</title>
<link rel="stylesheet" href="${ctx}/resources/js-lib/layui/css/layui.css">
<link rel="stylesheet" href="${ctx}/resources/sois/css/global.css">
<script type="text/javascript">
var ctx = "${ctx}";
</script> 
</head>
<body>
	<script type="text/javascript" src="${ctx}/resources/js-lib/layui/layui.js"></script>
	<script>
			layui.use('table', function(){
			   $ = layui.jquery;
			   var form = layui.form;
			   var table = layui.table;
			 
			   var tableIns =  table.render({
			    elem: '#newsList'
			    ,url:'${ctx}/sois/getArticleList/'
			    ,where: {articleType: '6'}
			    ,cols: [[
				  {title: '序号',width:80,templet: '#indexTpl',align:'center'}       
			      //,{field:'id', width:10, title: 'ID', sort: true}
			      ,{field:'topicName', width:120, title: '所属分类',align:'center'}
			      ,{field:'articleTitle', width:280, title: '标题' ,templet: function(d){
			    	 	 return "<sapn title='"+d.articleTitle+"'>"+d.articleTitle+"</span>";
		    		 }}
			      ,{field:'publishUserName', width:80, title: '作者', sort: false}
			      ,{field:'createDate', title: '创建时间', width: 180,align:'center'}
			      ,{field:'viewCount', width:80, title: '浏览量', sort: false,align:'center'}
			      ,{field:'checkState', width:80, title: '状态', sort: false,align:'center'
			    	 ,templet: function(d){
			    	       if(d.checkState=='1'){
			    	    	   return "正常";
			    	       }else{
			    	    	   return "未审核";
			    	       }
			    	 }
			      }
			      ,{title: '操作',width:160, toolbar: '#opBarTpl',align:'center'}
			    ]]
			    ,page: true
			  });
			  
			  //文章预览
			  function view(url){
			    	var index = layui.layer.open({
			            title : "文章预览",
			            type : 2,
			            area:  ['1002px', '500px'],
			            content : url,
			            maxmin: true,
			            success : function(layero, index){
			                
			            }
			        })
			        layui.layer.full(index);
				}  
			  
			  table.on('tool(newsList)', function(obj){
			        var layEvent = obj.event,
			        data = obj.data;
			        if(layEvent === 'edit'){
			        	location.href=ctx+"/sois/feedbackEdit/"+data.id;
			        } else if(layEvent === 'del'){
			            layer.confirm('确定删除此文章？',{icon:3, title:'提示信息'},function(index){
		                 	$.ajax({
				    			cache: true,
				    			type: "POST",
				    			url:'${ctx}/sois/delete',
				    			data:{
				    				id:data.id
				    			},
				    			async: false,
				    		    error: function(request) {
				    		        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
				    		    },
				    		    success: function(data) {
				    		    	tableIns.reload();
				                    layer.close(index);
				    		    }
   							})
			            });
			        } else if(layEvent === 'view'){
			        	var url=ctx+"/sois/show/"+data.id;
			        	view(url);
			        }
			    });
			  
			});
</script>
	<div class="admin-main">
		<form action="#" method="post">
			<blockquote class="layui-elem-quote">
				<a href="${ctx}/sois/feedbackAdd" class="layui-btn"> <i class="layui-icon">&#xe608;</i>
					添加反馈信息
				</a>
				<div class="layui-form-item" style="float: right;">
					<div class="layui-input-inline">
						<input type="text" name="keyword" value="" class="layui-input">
					</div>
					<div class="layui-input-inline">
						<button class="layui-btn" lay-submit="">
							<i class="layui-icon">&#xe615;</i> 搜索
						</button>
					</div>
				</div>
			</blockquote>
		</form>

		<fieldset class="layui-elem-field">
			<legend>数据列表</legend>
			<div class="layui-field-box">
				<table class="layui-table" lay-skin="line" id="newsList" lay-filter="newsList">
				</table>
			</div>
		</fieldset>
	</div>
	
	<!--序号-->
	<script type="text/html" id="indexTpl">
    	{{d.LAY_TABLE_INDEX+1}}
	</script>
	
	<!--操作-->
	<script type="text/html" id="opBarTpl">
		 <a lay-event="view" class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:void(0);"  >预览</a>
         <a lay-event="edit" class="layui-btn layui-btn-xs" href="javascript:void(0);">编辑</a>
         <a lay-event="del" class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);">删除</a>
	</script>
	
</body>

</html>