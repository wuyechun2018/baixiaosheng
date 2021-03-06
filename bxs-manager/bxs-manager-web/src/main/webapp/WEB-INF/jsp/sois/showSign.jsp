<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签收信息列表</title>
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
			    ,url:'${ctx}/sois/getSignList/'
			    ,where: {articleId: articleId}
			    ,cols: [[
				  {title: '序号',width:80,templet: '#indexTpl',align:'center'}       
			      ,{field:'signDeptName', width:120, title: '部门',align:'center'}
			      ,{field:'signUserName', width:120, title: '签收人',align:'center'}
			      ,{field:'signDate', width:280, title: '签收时间',align:'center'
			    	  ,templet: function(d){
			    	       if(d.signState=='1'){
			    	    	   return d.signDate;
			    	       }else{
			    	    	   return '-' ;
			    	       }
			    	 }
			      }
			      ,{field:'signState', width:180, title: '签收状态', sort: false,align:'center'
			    	 ,templet: function(d){
			    	       if(d.signState=='1'){
			    	    	   return '<span style="color:#5FB878;font-weight:bold;">已签收</span>';
			    	       }else{
			    	    	   return '<span style="color:#FF5722;font-weight:bold;">未签收</span>';
			    	       }
			    	 }
			      }
			    
			    ]]
			    ,page: true
			  });
			});
</script>
	<div class="admin-main">
		<fieldset class="layui-elem-field">
			<legend>签收信息列表</legend>
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
		  <a title="预览页面" lay-event="view" class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:void(0);">预览</a>
	</script>
	
</body>

</html>