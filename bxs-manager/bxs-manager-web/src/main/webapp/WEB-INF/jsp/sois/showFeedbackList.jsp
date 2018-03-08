<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我反馈的信息列表</title>
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
			   var table = layui.table;
			   var articleId='${articleInfoVo.id}';
			   
			   var tableIns =  table.render({
			    elem: '#newsList'
			    ,url:'${ctx}/sois/getMyFeedBackList'
			    ,where: {articleId: articleId}
			    ,cols: [[
				  {title: '序号',width:80,templet: '#indexTpl',align:'center'}
				  ,{field:'topicName', width:120, title: '所属分类',align:'center'}
				  ,{field:'articleTitle', width:280, title: '标题' ,templet: function(d){
			    	 	 return "<sapn title='"+d.articleTitle+"'>"+d.articleTitle+"</span>";
		    		 }}
				  ,{field:'publishDeptName', width:120, title: '报送部门',align:'center'}
			      ,{field:'publishUserName', width:120, title: '作者',align:'center'}
			      ,{field:'signDate', width:160, title: '我的反馈时间',align:'center'
			    	  ,templet: function(d){
			    	       if(d.signState=='1'){
			    	    	   return d.signDate;
			    	       }else{
			    	    	   return '-' ;
			    	       }
			    	 }
			      }
			      ,{title: '操作',width:210, toolbar: '#opBarTpl',align:'center'}
			    
			    ]]
			    ,page: true
			  });
			   
			   function view(text){
			    	layui.layer.open({
			            title : '反馈信息',
			            type : 1,
			            area:  ['700px', '300px'],
			            content : '<div style="padding: 5px 10px;">'+text+'</div>',
			            maxmin: false,
			            success : function(layero, index){
			                
			            }
			        })
			        
				}
			   
			   function viewArticle(url){
			    	var index = layui.layer.open({
			            title : "文章预览",
			            type : 2,
			            area:  ['800px', '400px'],
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
			        if(layEvent === 'view'){
			        	view(data.signContent);
			  	  }else if(layEvent === 'viewArticle'){
			        	var url=ctx+"/sois/show/"+data.articleId;
			        	viewArticle(url);
			  	  }
			   })
			   
			});
</script>
	<div class="admin-main">
		<fieldset class="layui-elem-field">
			<legend>我反馈的信息列表</legend>
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
	
	<!--操作,审核通过的，不可进行编辑和删除-->
	  <script type="text/html" id="opBarTpl">
		  <a lay-event="viewArticle" class="layui-btn layui-btn-xs" href="javascript:void(0);"  >预览文章</a>
          {{#  if(d.signContent !=''){ }}
    			  <a title="预览页面" lay-event="view" class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:void(0);">我的反馈信息</a>
  		  {{#  } else { }}
    			  <a title="预览页面"  class="layui-btn layui-btn-disabled layui-btn-xs" href="javascript:void(0);">无反馈信息</a>
  		  {{#  } }}
	</script>
	
</body>

</html>