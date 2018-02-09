<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>

<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.config.video.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${ctx}/resources/js-lib/ueditor-1.4.3.3/lang/zh-cn/zh-cn.js"></script>


<title>编辑视频文章</title>
<script type="text/javascript">
//提交表单操作
function submitForm(){
	if($("#article_form").form('validate')){ 
		 $('#article_form').submit();
	}
}

//点击"返回按钮",跳转到文章列表页面
function goback(){
	location.href=ctx+"/eui/article-video/list";
}
//页面初始化
$(function(){
	//栏目选择 下拉树
	$('#topicComboTree').combotree({
		url : '${ctx}/topic/getListByPid?pid=0',
		onBeforeExpand : function(node, param) {
			   $('#topicComboTree').combotree("tree").tree("options").url =ctx+ "/topic/getListByPid?pid=" + node.id;
			},
		width:'305',
	    required: true,
	    onLoadSuccess : function(node, data) {
	    	$('#topicComboTree').combotree("tree").tree('expandAll');
		}
	});
	
	//编辑器
	var ue = UE.getEditor('editor');
	
});
</script>
<body>

<table>
	<tr>
		<td>
			<a href="javascript:void(0)" data-options="iconCls:'Arrowleft'" id="resetBtn" class="easyui-linkbutton" onclick="goback()">返回列表</a>
		</td>
	</tr>
</table>
<fieldset  class="article-fieldset">
 <legend>添加文章</legend>
 <form action="${ctx}/articleVideo/euiSave" id="article_form" method="post"  enctype="multipart/form-data">
	 	<table>
	 		<tr>
			 	<th>文章标题：</th>	 		
	 			<td>
	 			  <input type="hidden"  value="${article.id}" name="id"  />
	 			  <%--普通类型 --%>
	 			  <input type="hidden"  value="3" name="articleType"  />
	 			  <input value="${article.articleTitle}" type="text" name="articleTitle" style="width:300px;" />
	 			</td>
	 			<td>&nbsp;</td>
	 			
	 		</tr>
	 		<tr>
			 	<th>栏目：</th>	 		
	 			<td>
	 			 	<input name="topicId" id="topicComboTree" value="${article.topicId}" />
	 			</td>
	 			
	 			<td>&nbsp;</td>
	 		</tr>
	 		
	 		<tr>
			 	<th>说明：</th>	 		
	 			<td>
	 			 	<div style="color:red;font-size:14px;">请点击视频上传按钮上传视频</div>
	 			</td>
	 			<td>&nbsp;</td>
	 		</tr>

	 		<tr>
			 	<th>视频：</th>	 		
	 			<td colspan="2">
	 			 	<script id="editor" name="articleContent" type="text/plain" style="width:800px;height:300px;">
						${article.articleContent}
					</script>
	 			</td>
	 		</tr>
	 		
	 		<tr>
			 	<th>信息来源：</th>	 		
	 			<td>
	 			  <input type="text" name="newsfrom" value="${article.newsfrom}" style="width:300px;" />
	 			</td>
	 		</tr>
	 		
	 		<tr>
			 	<th>作者：</th>	 		
	 			<td>
	 			  <input type="text" name="author" value="${article.author}" style="width:300px;" />
	 			</td>
	 		</tr>
	 		
	 		<tr>
			 	<th>发布时间：</th>	 		
	 			<td>
	 				<input class="easyui-datebox" type="text" value="${article.publishDate}" ID="publishDate" name="publishDate" style="width:300px" />
	 			</td>
	 		</tr>
	 		
	 	</table>
	 	
	 	 <div style="text-align:center;padding-top:15px">
	    	<table>
	    		<tr>
	    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Pagesave'" id="saveBtn" class="easyui-linkbutton" onclick="submitForm()">保存</a></td>
	    			<td style="width:100px;"><a href="javascript:void(0)" data-options="iconCls:'Arrowredo'" id="resetBtn" class="easyui-linkbutton" onclick="goback()">重置</a></td>
	    		</tr>
	    	</table>
    	</div>
 </form>
</fieldset>
  
</body>
</html>