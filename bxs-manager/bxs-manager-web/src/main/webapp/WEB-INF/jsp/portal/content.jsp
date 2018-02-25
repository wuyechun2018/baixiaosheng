<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="icon">                        
<LINK href="${ctx}/resources/portal/images/logo.ico" type="image/x-icon" rel="shortcut icon"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${articleInfoVo.articleTitle}-${articleInfoVo.topicName}-马鞍山市交警支队</title>
<link href="${ctx}/resources/portal/css/css.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/nei.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.bcat.bgswitcher.js"></script>
<style type="text/css">
input:-webkit-autofill, 
textarea:-webkit-autofill, 
select:-webkit-autofill { 
       -webkit-box-shadow: 0 0 0 1000px white inset; 
}
input[type=text]:focus, input[type=password]:focus, textarea:focus {
      -webkit-box-shadow: 0 0 0 1000px white inset; 
}

</style>

</head>

<!--[if lt IE 9]>
  <script src="${ctx}/resources/portal/js/html5.min.js"></script>
  <script src="${ctx}/resources/portal/jsrespond.min.js"></script>
<![endif]-->
<!--[if lt IE 10]>
    <script type="text/javascript"src="${ctx}/resources/portal/js/placeholder.min.js" charset="utf-8"></script>
<![endif]-->




<div class=" top_body">
	<div id="bg-body"></div>
    <script type="text/javascript">
    var ctx = "${ctx}";    
    var srcBgArray = [ctx+"/resources/portal/images/banner1.jpg",ctx+"/resources/portal/images/banner2.jpg",ctx+"/resources/portal/images/banner3.jpg"];

$(document).ready(function() {
  $('#bg-body').bcatBGSwitcher({
    urls: srcBgArray,
    alt: 'Full screen background image'
  });
});

//签收操作
function doSign(){
	var articleId='${articleInfoVo.id}';
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/sign/signArticle',
		data:{
			articleId:articleId,
			signContent:''
		},
		async: false,
	    error: function(request) {
	        
	    },
	    success: function(data) {
	    	if(data.success==true){
	    		alert(data.msg);
	    	}else{
	    		alert(data.msg);
	    	}
	    	location.reload();
	    	
	    }
	})
}

//登录&&签收
function doLoginAndSign(){
	var articleId='${articleInfoVo.id}';
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/sign/loginAndSign',
		data:{
			articleId:articleId,
			signContent:'',
			loginName:$('#loginName').val(),
			loginPassword:$('#loginPassword').val()
		},
		async: false,
	    error: function(request) {
	        
	    },
	    success: function(data) {
	    	if(data.success==true){
	    		alert(data.msg);
	    		location.reload();
	    	}else{
	    		alert(data.msg);
	    	}
	    }
	})
}


//提交反馈信息
function submitFeedback(){
	var articleId='${articleInfoVo.id}';
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/sign/submitFeedback',
		data:{
			articleId:articleId,
			signContent:$('#message').val()
		},
		async: false,
	    error: function(request) {
	        
	    },
	    success: function(data) {
	    	if(data.success==true){
	    		alert(data.msg);
	    		location.reload();
	    	}else{
	    		alert(data.msg);
	    	}
	    }
	})
}



</script><!--end of bg-body script-->
<div class="container">
	<div class="header">
    	<div class="h_logo"><a href="#"><img src="${ctx}/resources/portal/images/logo.png" /></a></div>
    </div>
    
     <div class="navbox ">
    	<ul>
        	<li>
            	<dl>
            		<dt class="n_1"><a href="${ctx}/portal/index"><span>首页</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=ZHYW">综合要闻</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=LDDT">领导动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=TZ">通知公告</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=HYTZ">会议通知</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_2"><a href="#"><span>动态</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=GZDT">工作动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=XWGC">新闻观察</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=YJYP">预警研判</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=JWGC">警务观察</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_3"><a href="#"><span>阅览</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=ZDWJ">支队文件</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=ZDBB">值带班表</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=SJWJ">上级文件</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=XXBS">信息报送</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_4"><a href="#"><span>警务</span></a></dt>
                	<dd><a href="${ctx}/portal/list?topicCode=JWSP">警务视频</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=DCYJ">调查研究</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=YQDT">舆情动态</a></dd>
                    <dd><a href="${ctx}/portal/list?topicCode=GZJB">工作简报</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    
    <div class="nav-path">
        <div class="dqwz">当前网站位置：<a href="${ctx}/portal/index"  title="首页" class="CurrChnlCls">首页</a>&nbsp;&gt;&nbsp;<a href="${ctx}/portal/list?topicCode=${articleInfoVo.topicCode}"  title="${articleInfoVo.topicName}" class="CurrChnlCls">${articleInfoVo.topicName}</a></div>
    </div>
	
</div>
</div>

<div class="newsContent" id="newsContent">
	<div class="c_Box">
    	<h3 class="sp_title">${articleInfoVo.articleTitle}</h3>
        <div class="sp_time">
		 <span>投稿部门：${articleInfoVo.publishDeptName}</span>
		 <span>发布时间：<fmt:formatDate value="${articleInfoVo.createDate}"  pattern="yyyy-MM-dd HH:mm"/></span>
		 <span>【字体：<a href="javascript:doZoom(20)">大</a><a href="javascript:doZoom(16)">中</a><a href="javascript:doZoom(12)">小</a>】</span>
		</div>
        <div class="content" id="zoom">
			${articleInfoVo.articleContent}
		</div>
		<div class="content" style="text-align: center;">
			<img src="${articleInfoVo.articleImageUrl }" />
		</div>
        
        <div class="clearfix" style="margin:0 38px;">
    		<div class="chare">
    			<%----%>
				<div class="chare-left">
				信息来源：${articleInfoVo.newsfrom}&nbsp;&nbsp;&nbsp;&nbsp;责任编辑：${articleInfoVo.author}
				</div>
				 
                <div class="chare-right">	
                    <span><a href="javascript:printme()" class="dy">打印</a></span>
                    
                    <span><a href="javascript:window.close()" class="close">关闭页面</a></span>
                </div>
            </div>
       </div>
       
       <c:if test="${articleInfoVo.articleType=='5'||articleInfoVo.articleType=='6'}">
        <!--登陆签收-->
       <div class="clearfix" style="margin:20px 38px;">
       	<div class="denglu_k clearfix">
          <!--未登录状态-->
          
         <c:choose> 
			  <c:when test="${empty userInfo}">   
			   	 <div class="denglu1 clearfix" id="denglu1">
		              <form action="#" method="post" autocomplete="off" onsubmit="return checkdl('denglu1')">
		              <div class="n_in fl"><input type="text" name="name" id="loginName" class="qs_in" placeholder="请输入账号" /></div>
		              <div class="n_in fl"><input type="password" name="password" id="loginPassword"  class="qs_in"    placeholder="请输入密码" /></div>
		              <div class="n_in fl"><input type="button" onclick="doLoginAndSign()" class="ss_sub" value="签 收" /></div>
		              </form>
         		 </div>
			  </c:when> 
			  <c:otherwise>
			  	 <div class="denglu2 clearfix">
		              <span>${userInfo.deptName}</span>-${userInfo.userName},您好，欢迎登录马鞍山公安局交警支队。
		              <%--判断是否为签收部门用户,如果不是，则不需签收 --%>
		              <c:choose> 
			              <c:when test="${empty needSign}">   
			             	 <a href="javascript:void(0)" class="a_buxuqianhsou">无需签收</a>
			              </c:when> 
				 		  <c:otherwise>
				 		  	 <c:choose> 
			  						<c:when test="${empty hasSigned}"> 
			  							 <a href="javascript:void(0)"  onclick="doSign()"  class="a_qianhsou">签收</a>
			  							 <%-- 反馈信息显示反馈输入框 --%>
			  							 <c:if test="${articleInfoVo.articleType=='6'}">
					  							<div class="n_fankui" id="n_fankui">
									              	  <form action="#" method="post" autocomplete="off" onsubmit="return checkfk('n_fankui')">
									                      <div class="n_in fl">
									                      	<textarea name="message" id="message" class="message" placeholder="填写的反馈信息">${signConent}</textarea>
									                      </div>
									                      <div class="n_in fl"><input type="button" onclick="submitFeedback()" class="ss_sub" value="提交反馈" /></div>
									                  </form>
		              							</div>
	              						  </c:if>	
			  						</c:when>
			  						<c:otherwise>
			  							 <a href="javascript:void(0)"  class="a_yiqianhsou">已签收</a>
			  							 <%-- 反馈信息显示反馈输入框 --%>
			  							 <c:if test="${articleInfoVo.articleType=='6'}">
				  							 <div class="n_fankui" id="n_fankui">
								              	  <form action="#" method="post" autocomplete="off" onsubmit="return checkfk('n_fankui')">
								                      <div class="n_in fl">
								                      	<textarea name="message" id="message" class="message" placeholder="填写的反馈信息">${signConent}</textarea>
								                      </div>
								                      <div class="n_in fl"><input type="button" onclick="submitFeedback()" class="ss_sub" value="提交反馈" /></div>
								                  </form>
	              							</div>
              							</c:if>
			  						</c:otherwise>
			  				</c:choose>  
				 		   </c:otherwise>
			 		   </c:choose>
          		 </div>
			  </c:otherwise>
		</c:choose>
          
         
        </div>
       </div>
       
         <div class="clearfix" style="margin:20px 38px;">
			<div class="qianshou_box">
            	<div class="qs_h clearfix">
                	<ul>
                    	<li class="qs_bumen">部门</li>
                        <li class="qs_time">签收时间</li>
                        <li class="qs_zt">签收状态</li>
                    </ul>
                </div>
                
                <c:forEach items="${signList}" var="sign">
            		<div class="qs_td clearfix">
	                	<ul>
	                    	<li class="qs_bumen">${sign.signDeptName}</li>
	                    	<c:choose> 
								  <c:when test="${sign.signState=='0'}">   
								   	<li class="qs_time">-</li>
								   	<li class="qs_zt"><font class="n_wqs">未签收</font></li>
								  </c:when> 
								  <c:otherwise>   
								    <li class="qs_time"><fmt:formatDate value="${sign.signDate}"  pattern="yyyy-MM-dd HH:mm"/></li>
								  	<li class="qs_zt"><font class="n_qs">已签收</font></li>
								  </c:otherwise> 
							</c:choose>
	                    </ul>
                	</div>
        		</c:forEach>
            </div>
       </div>
        
       </c:if> 
    </div>
</div>

<!--底部-->
<div class="footer mar10">
	<div class="container">
    	<div class="f_nav">
            <a href="javascript:void(0);" onclick="SetHome(this,'#');">加入收藏</a>
            <a href="javascript:void(0);" onclick="AddFavorite('我的网站',location.href)">设为首页</a>
             <a href="#">信息报送</a>
            <a href="#">旧版</a>
            <span>建议分辨率为1440*960</span>
            <span>浏览器IE8以上版本</span>
        </div>
        <div class="f_logo"></div>
        
        <div class="f_copyright">
        	联系电话：0555-2425010   邮编：243000     技术支持：山河网络
        </div>
    </div>
</div>

</body>
</html>