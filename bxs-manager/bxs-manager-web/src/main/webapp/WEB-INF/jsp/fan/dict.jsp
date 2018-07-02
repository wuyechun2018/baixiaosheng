<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>词典</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="${ctx}/resources/js-lib/bootstrap-3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/resources/js-lib/bootstrap-3.3.7/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="${ctx}/resources/js-lib/zTree/css/metroStyle/metroStyle.css" />
<script type="text/javascript" src="${ctx}/resources/js-lib/jquery/jquery-1.12.4.min.js"></script>

<script type="text/javascript">

//树加载成功
function zTreeOnAsyncSuccess(event, treeId, treeNode){
	if(!treeNode){
		var zTree=$.fn.zTree.getZTreeObj("treeDemo");
        var node=zTree.getNodeByParam("pId","-1",null);
        zTree.expandNode(node,true,true,true);
	}
	
}
 
//自定义节点字体样式
function getFont(treeId, node) {
		/**
		if(node.attribute.nodeType=="2"){
			if(node.attribute.orgObj.originMark=="1"){
				var obj={"color":"#679382"};
			return obj;
			}else if(node.attribute.orgObj.originMark=="2"){
				var obj={"color":"#2aabd2"};
			return obj;
			}else{
				var obj={"color":"#CDCD00"};
			return obj;
			}
		}else{
			var obj={"font-weight":"normal"};
			return obj;
			
		}**/
}


//节点右击
function OnRightClick(event, treeId, treeNode) {
	//showRMenu("root", event.clientX, event.clientY);
}

//节点点击事件
function zTreeOnMouseDown(event, treeId, treeNode) {
	if(treeNode){
			
	}
}

var setting = {
		async: {
			enable: true,
			url:'${ctx}/dept/getListByPid',
			otherParam:{"otherParam":"zTreeAsyncTest"},
			autoParam: ["id=pid"]
		},
        data: {   
            simpleData: {
                enable: true,
                idKey: "id", 
                pIdKey: "pid",
                rootPId: 0
            },
    		key:{
    			name:'text'
    		}
        },
		callback: {
			onMouseDown: zTreeOnMouseDown,
			onAsyncSuccess: zTreeOnAsyncSuccess,
			onRightClick: OnRightClick
		},
		view: {
			fontCss: getFont,
			nameIsHTML: true
		},
		data: {
			key: {
				title: "title"
			}
		}
};

$(function(){
	
	 $.fn.zTree.init($("#treeDemo"), setting);
})



</script>



</head>
<body>
<div class="page-header">
		<div class="title-div">
				<h3 class="page-title">
				机构地址维护
				</h3>
			</div>
</div>

<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<div class="scroller" style="height: 500px; overflow: auto; width: auto;" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd" data-initialized="1">
				<ul id="treeDemo" class="ztree"></ul>
			</div>
		</div>
		
		<div class="col-md-8 column">
		</div>
		
		</div>
</div>	
		
		


<script type="text/javascript" src="${ctx}/resources/js-lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/resources/js-lib/bootstrap-validator-0.5.3/js/bootstrapValidator.min.js"></script> 

</body>
</html>