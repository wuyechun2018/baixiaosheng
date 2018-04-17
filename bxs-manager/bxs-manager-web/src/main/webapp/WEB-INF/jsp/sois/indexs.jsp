<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui-v2.jsp" %>
<link href="${ctx}/resources/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" media="screen">
<title>信息报送</title>

<script type="text/javascript">

//加载左边菜单树
function loadMenu(){
	$.ajax({
		cache: true,
		type: "POST",
		url : '${ctx}/sysmenu/getListByPid?pid=0',
		data:{
			
		},
		async: false,
	    error: function(request) {
	       
	    },
	    success: function(data) {
	    	var html="";
	    	for(var i=0;i<data.length;i++){
	    		var menuId=data[i].id;
	    		html='<div style="padding:6px"><ul id="mtree'+menuId+'"></ul></div>';
	    		$('#menuDiv').accordion('add', {
		    		title: data[i].text,
		    		content: html,
		    		selected: i==0?true:false
		    	});
	    		
	    		var id='mtree'+menuId
	    		$('#'+id).tree({      
	    		     url: "${ctx}/sysmenu/getListByPid?pid="+menuId,
	    		      method:'get', 
	    		      onClick:function(node){
	    		    	  var param=new Object();
	    		    	  param.url=ctx+node.attributes.menuAddr;
	    		    	  param.title=node.text;
	    		    	  addTab(param);
	    		    	  //折叠右边内容
	    		    	  //$('#ilayout').layout('collapse','east');
	    		      }
	    				      
	    			}); 
	    	}
	    }
	})
}

function nodeClick(node){
	 var param=new Object();
	  param.url=ctx+node.attributes.menuAddr;
	  param.title=node.text;
	  addTab(param);
}

//添加Tab
function addTab(params) {
	var iframe = '<iframe src="' + params.url + '" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>';
	var mainTab = $('#mainTabs');
	var opts = {
		title : params.title,
		closable : true,
		iconCls : params.iconCls,
		content : iframe,
		border : false,
		fit : true
	};
	if (mainTab.tabs('exists', opts.title)) {
		mainTab.tabs('select', opts.title);
	} else {
		mainTab.tabs('add', opts);
	}
}

//关闭Tab页面
function closeTab(menu, type) {
    var allTabs = $("#mainTabs").tabs("tabs");
    var len = allTabs.length;
    var index = $(menu).data("index");
    if ("cur" == type) {
        $("#mainTabs").tabs("close", index);
    } else if ("all" == type) {
        for (var i = 0; i < len; i++) {
            $("#mainTabs").tabs("close", 0);
        }
    } else if ("oth" == type) {
        for (var i = 0; i < len; i++) {
            if (index > i) {
                $("#mainTabs").tabs("close", 0);
            } else {
                $("#mainTabs").tabs("close", 1);
            }
        }
    }
}

//打开默认Tab
function addDefault(){
	 var param=new Object();
	 //param.url=ctx+'/manager/sysinfo?version'+Math.random();
	 param.url=ctx+'/sois/add';
	 param.title='系统信息';
	 addTab(param);
}


$(function(){
	   //加载左边菜单树
	   loadMenu();
	   
	   //Tab事件注册
	   $('#mainTabs').tabs({
		  	 onClose:function(title,index){
		    	  if(index==0){
		    		  addDefault();
		    	  }
		    	  //if(index==2){
		    		//展开右边
		    		// $('#ilayout').layout('expand','east');
		    	  //}
		    	  
		      },
		      onContextMenu: function(e, title, index){
		    	  	e.preventDefault();
		             $('#mm').menu('show', {
		                 left: e.pageX,
		                 top: e.pageY
		             }).data("index", index);
		             $("#mm").menu({
		                    onClick : function (item) {
		                        closeTab(this, item.name);
		                    }
		                });
		      }
		     });
	
	   //打开默认Tab
	   addDefault();  
})

</script>



</head>
<body class="welcome_body">

<%--右键菜单 --%>
<div id="mm" class="easyui-menu" style="display: none;">
  <div id="mm-tabclose" data-options="iconCls:'Application'" name="cur">关闭当前</div>
        <div id="mm-tabcloseall" data-options="iconCls:'Applicationcascade'" name="all">关闭全部</div>
        <div id="mm-tabcloseother" data-options="iconCls:'Applicationdouble'" name="oth">关闭其他</div>
 </div>

<div class="easyui-layout" fit="true"  id="ilayout">
		<%--页面头部 --%>
		<div data-options="region:'north'" style="height:62px">
			<div id="topbar" class="top-bar">
                <div class="top-bar-left">
                    <div style="margin-left: 15px; color: #000;height: 52px;">
                    	<%--
                    	<img style="vertical-align:middle;"  src="${ctx}/resources/images/logo40.png">
                    	 --%>
                    	<span style="vertical-align:middle;font-family: 华文细黑;font-size:30px;height:52px;line-height: 55px;color:#fff">会员系统</span>
                    </div>
                </div>
                
                <div class="top-bar-right">
                
                	<span class="top-bar-info-s" >
                		<i class="fa fa-check-square" aria-hidden="true"></i>
                  		<a style="vertical-align:middle;color:#fff;font-size:14px;text-decoration: none;"  target="_blank" href="${ctx}/sois/showSignList" >我的签收</a>
                  		<span class="layui-badge-dot-s"></span>
                  	</span>
                	<span class="top-bar-info" >
                		<i class="fa fa-gift" aria-hidden="true"></i>
                  		<a style="vertical-align:middle;color:#fff;font-size:14px;text-decoration: none;"  target="_blank" href="${ctx}/sois/showFeedbackList" >我的反馈</a>
                  		<span class="layui-badge-dot"></span>
                  	</span>
                  	<span class="top-bar-exit">
                  		<%--
                  		<img style="vertical-align:middle;" alt="退出" src="${ctx}/resources/images/exit.png">
                  		 --%>
                  		 <i class="fa fa-sign-out" aria-hidden="true"></i>
                  		<a style="vertical-align:middle;color:#fff;font-size:14px;text-decoration: none;"  href="${ctx}/sois/loginout" >安全退出</a>
                  	</span>
                </div>
                
            </div>
		</div>
		
		<%--页面底部 --%>
		<div data-options="region:'south',split:false,border:false" style="height:30px;" class="ibackgroud">
			<div class="south-bottom">2017 ©马鞍山公安局交警支队 技术支持：芜湖山河网络科技有限公司</div>
		</div>
		
	
		
		<%--页面左边，菜单栏--%>
		<div data-options="region:'west',split:true, border: true,iconCls: 'Userstar'" title="<span style='font-size:14px;color:#000;margin-left:8px;'>${SESSION_USER_INFO.userName}</span>" style="width:200px;font-family: Microsoft YaHei;" >
			<div class="easyui-accordion" data-options="fit:true,border:false" id="menuDivs">
				<div title="会员信息" data-options="iconCls:'Information'" style="padding:10px;">
					<ul class="easyui-tree" data-options="method:'get',url:'${ctx}/resources/sois/json/nav-0.json',onClick:function(node){nodeClick(node)}"></ul>
				</div>
				<div title="文章信息报送管理" data-options="iconCls:'Applicationformadd'" style="padding:10px;">
					<ul class="easyui-tree" data-options="method:'get',url:'${ctx}/resources/sois/json/nav-1.json',onClick:function(node){nodeClick(node)}"></ul>
				</div>
				<div title="签收信息报送管理" data-options="iconCls:'Imageadd'" style="padding:10px;">
					<ul class="easyui-tree" data-options="method:'get',url:'${ctx}/resources/sois/json/nav-2.json',onClick:function(node){nodeClick(node)}"></ul>
				</div>
				<div title="反馈信息报送管理" data-options="iconCls:'Feedadd'" style="padding:10px;">
					<ul class="easyui-tree" data-options="method:'get',url:'${ctx}/resources/sois/json/nav-3.json',onClick:function(node){nodeClick(node)}"></ul>
				</div>
				<div title="警务视频管理" data-options="iconCls:'Dvdadd'" style="padding:10px;">
					<ul class="easyui-tree" data-options="method:'get',url:'${ctx}/resources/sois/json/nav-4.json',onClick:function(node){nodeClick(node)}"></ul>
				</div>
			</div>
		</div>
		
		<%--页面中心区域--%>
		<div data-options="region:'center'">
			<div id="mainTabs"  data-options="fit:true,border:false,plain:true">
			</div>
		</div>
	</div>
</body>
</html>