<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息报送</title>
<link rel="stylesheet"
	href="${ctx}/resources/js-lib/layui/css/layui.css">
<link rel="stylesheet" href="${ctx}/resources/sois/css/global.css">
<script type="text/javascript">
var ctx = "${ctx}";
var topicData=null;
</script>
</head>
<body>
<script type="text/javascript" src="${ctx}/resources/js-lib/base.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/layui/layui.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.config.layui.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.all.min.js"> </script>

	<div style="margin: 15px;">

		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">

			<legend>添加签收信息</legend>

		</fieldset>
		<form class="layui-form" action="${ctx}/sois/signSave" method="post">
		
			<div class="layui-form-item">
				<label class="layui-form-label">投稿栏目</label>
				<input type="hidden"  value="0"  name="checkState"  />
				<%--4为信息报送，5为签收信息报送  --%>
				<input type="hidden"  value="5"  name="articleType"  />
				<input type="hidden"  value="2018-01-01"  name="publishDate" id="publishDate" />
				<div class="layui-input-block">
					<select name="topicId" id="topicId" class="layui-input topicId" lay-verify="required">
						<option value="1"></option>
						<%--
						<option value="0">北京</option>
						<option value="1">上海</option>
						<option value="2">广州</option>
						<option value="3">深圳</option>
						<option value="4">杭州</option>
						 --%>
					</select>
				</div>
			</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label">文章标题</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input articleTitle" name="articleTitle" required lay-verify="required"
						placeholder="请输入标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
	           	 <label class="layui-form-label">形象图</label>
	             <div class="layui-input-inline" style="width: 250px;">
	                <input type="text" name="articleImageUrl" value="" class="layui-input" id="articleImageUrl"> 
	             </div>
	            <div class="layui-input-inline" >
	                <button type="button" name="preimage" class="layui-btn" id="articleImageBtn">上传图片</button>
	            </div>
	            <%--
	            <div class="layui-input-inline" >
	                <img class="layui-upload-img" id="viewImg">
	            </div>
	             --%>
	        </div>
			
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">文章内容</label>
				<div class="layui-input-block">
					<script id="editor" name="articleContent" type="text/plain" style="width:100%;height:180px;">
					</script>
				</div>
			</div>
			
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">签收部门</label>
				<div class="layui-input-block">
					 <input type="checkbox" name="signDept" title="写作">
				     <input type="checkbox" name="signDept" title="阅读" checked>
				     <input type="checkbox" name="signDept" title="发呆">
				</div>
			</div>
			
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>


	<script>
		//Demo
		layui.use(['form','upload'], function(){
			var $ = layui.jquery;
			
			$.ajax({
				cache: true,
				type: "POST",
				url:'${ctx}/topic/getListByPid?pid=1',
				data:{
					
				},
				async: false,
			    error: function(request) {
			        
			    },
			    success: function(data) {
			    	topicData=data;
			    }
			}) 
			
			var upload = layui.upload;
			//创建一个上传组件
		    var uploadInst = upload.render({
		        elem: '#articleImageBtn'
		        ,field:'preimage'
		        ,url: '${ctx}/article/preView'
		        ,before: function(obj){
		          
		        }
		        ,done: function(res){
		        	articleImageUrl.value=res.msg;
		        	//$('#viewImg').attr('src', res.msg);
		        }
		        ,error: function(){
		          
		        }
		      });	
		  var ue = UE.getEditor('editor');	
		  var form = layui.form;
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    //layer.msg(JSON.stringify(data.field));
		    //return false;
		  });
		  $('#topicId').append('<option value="1"></option>');
		  for(var i=0;i<topicData.length;i++){
	    	  var topicObj=topicData[i];
	    	  $('#topicId').append('<option value="'+topicObj.id+'">'+topicObj.text+'</option>');
	      }
		  form.render('select');
		  $('#publishDate').val(myDateFormatter(new Date()));
		});
</script>

</body>

</html>