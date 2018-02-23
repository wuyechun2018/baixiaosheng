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
var deptData=null;
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

			<legend>编辑签收信息</legend>

		</fieldset>
		<form class="layui-form" action="${ctx}/sois/signSave" method="post">
		
			<div class="layui-form-item">
				<label class="layui-form-label">投稿栏目</label>
				<input type="hidden"  value="0"  name="checkState"  />
				<input type="hidden"  value="${article.id}" name="id" />
				<input type="hidden"  value="${article.publishDate}" name="publishDate" id="publishDate" />
				<input type="hidden"  value="${article.articleType}" name="articleType"  />
				<div class="layui-input-block">
					<select name="topicId" id="topicId" value="${article.topicId}" lay-verify="required">
						<option value="1" ></option>
					</select>
				</div>
			</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label">文章标题</label>
				<div class="layui-input-block">
					<input type="text" name="articleTitle"  value="${article.articleTitle}" required lay-verify="required"
						placeholder="请输入标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
	           	 <label class="layui-form-label">形象图</label>
	             <div class="layui-input-inline" style="width: 250px;">
	                <input type="text" value="${article.articleImageUrl}" name="articleImageUrl" value="" class="layui-input" id="articleImageUrl"> 
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
						${article.articleContent}

					</script>
				</div>
			</div>
			
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">签收部门</label>
				<div class="layui-input-block" id="qsbmDiv">
					<%--
					 <input type="checkbox" name="signDept" title="写作">
				      --%>
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
				url:'${ctx}/topic/getSignListByPid?pid=1',
				data:{
					
				},
				async: false,
			    error: function(request) {
			        
			    },
			    success: function(data) {
			    	topicData=data;
			    }
			})
			
			//发送请求，获取"签收部门",用于 加载下拉框
			$.ajax({
				cache: true,
				type: "POST",
				url:'${ctx}/dept/getListByPid?pid=1',
				data:{
					
				},
				async: false,
			    error: function(request) {
			        
			    },
			    success: function(data) {
			    	deptData=data;
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
		        }
		        ,error: function(){
		          
		        }
		      });	
		  var ue = UE.getEditor('editor');	
		  var form = layui.form;
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		   
		  });
		  $('#topicId').append('<option value="1"></option>');
		  for(var i=0;i<topicData.length;i++){
	    	  var topicObj=topicData[i];
	    	  $('#topicId').append('<option value="'+topicObj.id+'">'+topicObj.text+'</option>');
	      }
		  var topicId="${article.topicId}";
		  $('#topicId').val(topicId);
		  form.render('select');
		  
		  //加载签收部门
		  for(var i=0;i<deptData.length;i++){
	    	  var deptObj=deptData[i];
	    	  $('#qsbmDiv').append('<input type="checkbox" name="signDept" value="'+deptObj.id+'" title="'+deptObj.text+'">');
	      }
		  form.render('checkbox');
		  
		  
		  
		});
</script>

</body>

</html>