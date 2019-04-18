<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--放置的位置要特别注意,不能放在第三行,否则会有一些样式问题 --%>
<%@ include file="/WEB-INF/jsp/base/easyui.jsp" %>
<link href="${ctx}/resources/css/base.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" media="screen">
<title>${XTMC}</title>

<script type="text/javascript">

//加载左边菜单树
function loadMenu(){
	$.ajax({
		cache: true,
		type: "POST",
		url : '${ctx}/sysmenu/getListByPidAndUserId?pid=0',
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
	    		     url: "${ctx}/sysmenu/getListByPidAndUserId?pid="+menuId,
	    		      method:'get', 
	    		      onClick:function(node){
	    		    	  var param=new Object();
	    		    	  param.url=ctx+node.attributes.menuAddr;
	    		    	  param.title=node.text;
	    		    	  addTab(param);
	    		    	  //折叠右边内容
	    		    	  $('#ilayout').layout('collapse','east');
	    		      }
	    				      
	    			}); 
	    	}
	    }
	})
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
	 //折叠右边
	 $('#ilayout').layout('collapse','east');
	
	 var param=new Object();
	 //param.url=ctx+'/manager/sysinfo?version'+Math.random();
	 //param.title='系统信息';
	 
	 param.url=ctx+'/eui/ierp/index?version'+Math.random();
	 param.title='统计分析';
	 addTab(param);
}



$(function(){
		//切换主题
		//changeThemes('black');
	   
		//加载左边菜单树
	   loadMenu();
	   
	   //Tab事件注册
	   $('#mainTabs').tabs({
		  	 onClose:function(title,index){
		    	  if(index==0){
		    		  addDefault();
		    	  }
		    	  if(index==2){
		    		//展开右边
		    		 $('#ilayout').layout('expand','east');
		    	  }
		    	  
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
                    	<img style="vertical-align:middle;"  src="${ctx}/resources/images/${LOGO}.png">
                    	<span style="vertical-align:middle;font-family: 华文细黑;font-size:30px;height:52px;line-height: 52px;color:#fff">${XTMC}</span>
                    </div>
                </div>
                
                <div class="top-bar-right">
                	<!-- 
                	<span class="top-bar-info" >
                		<i class="fa fa-th-large" aria-hidden="true"></i>
                  		<a style="vertical-align:middle;color:#fff;font-size:14px;text-decoration: none;"  target="_blank" href="${ctx}/portal/index" >网站首页</a>
                  	</span>
                  	 -->
                  	<span class="top-bar-exit">
                  		<%--
                  		<img style="vertical-align:middle;" alt="退出" src="${ctx}/resources/images/exit.png">
                  		 --%>
                  		 <i class="fa fa-sign-out" aria-hidden="true"></i>
                  		<a style="vertical-align:middle;color:#fff;font-size:14px;text-decoration: none;"  href="${ctx}/user/loginout" >安全退出</a>
                  	</span>
                </div>
                
            </div>
		</div>
		
		<%--页面底部 --%>
		<div data-options="region:'south',split:false,border:false" style="height:30px;" class="ibackgroud">
			<div class="south-bottom">Copyright © 2015 Imark. All Rights Reserved 京ICP备 0001XXX号     建议分辨率:1280*800 |关于我们</div>
		</div>
		
		<%--页面右边，上面展示日历，下面展示"示例树"--%>
		<div id="east" data-options="region:'east',collapsed:false,split:true,border: true,iconCls: 'icon-standard-date'" title="日历" style="width:210px;">
			<div id="eastLayout" class="easyui-layout" data-options="fit: true">
                <div data-options="region: 'north', split: false, border: false" style="height: 220px;">
                    <div class="easyui-calendar" data-options="fit: true, border: false"></div>
                </div>
                
                <div id="linkPanel" data-options="region: 'center', border: false, title: '通知', iconCls: 'icon-hamburg-link', tools: [{ iconCls: 'icon-hamburg-refresh', handler: function () { window.link.reload(); } }]">
                    <%--<ul class="easyui-tree" data-options="url:'${ctx}/resources/data/tree_data.json',method:'get',animate:true,dnd:true"></ul>--%>
                </div> 
            </div>
		</div>
		
		<%--页面左边，菜单栏--%>
		<div data-options="region:'west',split:true, border: true,iconCls: 'Userstar'" title="<span style='font-size:14px;color:#000;margin-left:8px;'>${SESSION_USER_INFO.userName}</span>" style="width:200px;font-family: Microsoft YaHei;" >
			<div class="easyui-accordion" data-options="fit:true,border:false" id="menuDiv">
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