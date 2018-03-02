<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="shortcut icon"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通讯录</title>
<link href="${ctx}/resources/contacts/css/tongxunlu.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/common.js"></script>

<script type="text/javascript">
	function doQuery(deptId,loginOrUserName,officeTelephone,mobilePhone){
		$.ajax({
			cache: true,
			type: "POST",
			url:'${ctx}/user/pagerList',
			data:{
				page:0,
				rows:100,
				deptId:deptId,
				loginOrUserName:loginOrUserName,
				officeTelephone:officeTelephone,
				mobilePhone:mobilePhone
			},
			async: false,
		    error: function(request) {
		        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
		    },
		    success: function(data) {
		    	$('#userData').html('');
		    	for(var i=0;i<data.rows.length;i++){
		    		var userObj=data.rows[i];
		    		var postName=userObj.postName==null?'&nbsp;':userObj.postName;
		    		var officeTelephone="&nbsp;";
		    		if(userObj.officeTelephone!=null&&userObj.officeTelephone!=''){
		    			officeTelephone=userObj.officeTelephone;
		    		}
		    		
		    		
		    		var dtHtml='<dl class="xx_dd clearfix">'+
			                	'<dt class="xx_bumen">'+userObj.deptName+'<i class="xx1"></i></dt>'+
			                    '<dt class="dt">'+postName+'</dt>'+
			                	'<dt class="dt name">'+userObj.userName+'</dt>'+
			                    '<dt class="dt">'+officeTelephone+'</dt>'+
			                    '<dt class="dt">'+userObj.mobilePhone+'</dt>'+
                			   '</dl>';
		    	 $('#userData').append(dtHtml);
		    	}
		    }
		})
		
	}

	//左边部门列表点击事件
	function clickDept(deptId){
		$('#deptUL li').removeClass('active');
		$('#'+'alink'+deptId).addClass('active');
		$('#deptTitle').html($('#'+'alink'+deptId).attr("name"));
		doQuery(deptId,'','','');
	}
	
	//点击查询事件
	function btnSearch(){
		var deptId=$('#deptComobx').val();
		var loginOrUserName=$('#loginOrUserName').val();
		var officeTelephone=$('#officeTelephone').val();
		var mobilePhone=$('#mobilePhone').val();
		doQuery(deptId,loginOrUserName,officeTelephone,mobilePhone);
	}


	$(function(){
		
		//请选择部门，后台不做部门筛选
		$('#deptComobx').append('<option value="1">请选择部门</option>');
		
		$.ajax({
			cache: true,
			type: "POST",
			url:'${ctx}/dept/getListByPid?pid=1',
			data:{
				
			},
			async: false,
		    error: function(request) {
		        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
		    },
		    success: function(data) {
		    	for(var i=0;i<data.length;i++){
		    		var deptObj=data[i];
		    		$('#deptComobx').append('<option value="'+deptObj.id+'">'+deptObj.text+'</option>');
		    		$('#deptUL').append("<li id='alink"+deptObj.id+"' name='"+deptObj.text+"'  class=''><a  href='javascript:void(0)' onclick=clickDept('"+deptObj.id+"')>"+deptObj.text+"</a></li>");
		    	}
		    	//加载完部门列表后默认选中第一个
		    	if(data.length>0){
		    		clickDept(data[0].id);
		    	}
		    }
		})
		
	})

</script>

</head>

<!--[if lt IE 9]>
  <script src="${ctx}/resources/portal/js/html5.min.js"></script>
  <script src="${ctx}/resources/portal/jsrespond.min.js"></script>
<![endif]-->
<!--[if lt IE 10]>
    <script type="text/javascript"src="${ctx}/resources/portal/js/placeholder.min.js" charset="utf-8"></script>
<![endif]-->



<div class="hdTop">
	<div class="container">
    	<div class="logo"><a href="#"><img src="${ctx}/resources/contacts/images/logo.png"></a></div>
    </div>
</div>
<div class=" search_box ">
	<div class="n_search " id="secrchBox1">
            	<form action="#" method="post" autocomplete="off" onsubmit="return check('secrchBox1')">
            	<div class="n_in fl">
                	<select name="type" id="deptComobx">
                		<%--
                    	<option value="0">请选择部门</option>
                        <option value="0">科技部</option>
                        <option value="0">宣传部</option>
                        <option value="0">法制科</option>
                        <option value="0">管理部</option>
                       --%>
                    </select>
                </div>
            	<div class="n_in fl ss_line"><input type="text" class="in_txt" name="name" id="loginOrUserName" placeholder="请输入姓名"></div>
                <div class="n_in fl ss_line"><input type="text" class="in_txt" name="phone" id="officeTelephone" placeholder="请输入固定电话"></div>
                <div class="n_in fl ss_line"><input type="text" class="in_txt" name="tel" id="mobilePhone" placeholder="请输入手机号码"></div>
                <div class="n_in fl"><input type="button" onclick="btnSearch()" class="btn-search" value=""></div>
                </form>
	</div>
</div>
<div class="txlBg container clearfix">
	<div class="txlLeft fl">
    	<h1 class="h6-1"><span>部门列表</span></h1>
        <ul id="deptUL">
			
			<%--
			<li  class="active"><a  href="#">科技科</a></li>
		
			<li  class=""><a  href="#">管理部</a></li>
		
			<li  class=""><a  href="#">宣教部</a></li>
		
			<li  class=""><a  href="#">办公室</a></li>
		
			<li  class=""><a  href="#">法制科</a></li>
            <li  class=""><a  href="#">法制科</a></li>
            <li  class=""><a  href="#">法制科</a></li>
			 --%>
		</ul>
    </div>
     <div class="txlRight fl">
    	<div class="list-title" id="deptTitle"></div>
        
        <div class="txlRight-list-box clearfix">
        	    <dl class="xx_h">
            		
                	<dt class="xx_bumen">部门</dt>
                	<dt class="dt">职位</dt>
                	<dt class="dt name">姓名</dt>
                    <dt class="dt">固定电话</dt>
                    <dt class="dt">手机号码</dt>
                   
                </dl>
                <div class="clear_f" ></div>
                <div id="userData">
                <%--
                <dl class="xx_dd clearfix">
                	
                	<dt class="xx_bumen">科技科<i class="xx1"></i></dt>
                	<dt class="dt name">王嘉佳</dt>
                    <dt class="dt">0553-8888888</dt>
                    <dt class="dt">13333333333</dt>
                   
                </dl>
                 <dl class="xx_dd clearfix md">
                	
                	<dt class="xx_bumen">科技科<i class="xx1"></i></dt>
                	<dt class="dt name">王嘉佳</dt>
                    <dt class="dt">0553-8888888</dt>
                    <dt class="dt">13333333333</dt>
                   
                </dl>
                 <dl class="xx_dd clearfix">
                	
                	<dt class="xx_bumen">科技科<i class="xx1"></i></dt>
                	<dt class="dt name">王嘉佳</dt>
                    <dt class="dt">0553-8888888</dt>
                    <dt class="dt">13333333333</dt>
                   
                </dl>
                 <dl class="xx_dd clearfix md">
                	
                	<dt class="xx_bumen">科技科<i class="xx1"></i></dt>
                	<dt class="dt name">王嘉佳</dt>
                    <dt class="dt">0553-8888888</dt>
                    <dt class="dt">13333333333</dt>
                   
                </dl>
                 <dl class="xx_dd clearfix">
                	
                	<dt class="xx_bumen">科技科<i class="xx1"></i></dt>
                	<dt class="dt name">王嘉佳</dt>
                    <dt class="dt">0553-8888888</dt>
                    <dt class="dt">13333333333</dt>
                   
                </dl>
                <dl class="xx_dd clearfix md">
                	
                	<dt class="xx_bumen">科技科<i class="xx1"></i></dt>
                	<dt class="dt name">王嘉佳</dt>
                    <dt class="dt">0553-8888888</dt>
                    <dt class="dt">13333333333</dt>
                </dl>
                 --%>
               </div>
        </div>
    </div>
</div>
<div class="txlFoot">
	<div class="copyright">马鞍山公安局交警支队 联系电话：0555-2425010</div>
</div>







</body>

</html>