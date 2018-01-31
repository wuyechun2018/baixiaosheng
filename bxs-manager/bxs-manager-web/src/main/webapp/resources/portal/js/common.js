function check(e){
	e="#"+e;
	var key=$(e).find("#keys").val();
	
	if(key==""){
	alert("搜索关键词不能为空！");
	return false;
	}

	return true;
}
function checkdl(e){
	e="#"+e;
	var name=$(e).find("#name").val();
	var password=$(e).find("#password").val();
	
	if(name==""){
	alert("请输入用户名！");
	return false;
	}
	if(password==""){
	alert("请输入密码！");
	return false;
	}

	return true;
}

function checkfk(e){
	e="#"+e;
	var message=$(e).find("#message").val();
	
	if(message==""){
	alert("请输入反馈信息！");
	return false;
	}
	

	return true;
}

//设为首页
function SetHome(obj,url){
     try{
         obj.style.behavior='url(#default#homepage)';
         obj.setHomePage(url);
     }catch(e){
         if(window.netscape){
             try{
                 netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
             }catch(e){
                 alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
             }
         }else{
             alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
         }
     }
 }
 //收藏本站
function AddFavorite(title, url) {
     try {
         window.external.addFavorite(url, title);
     }
     catch (e) {
         try {
             window.sidebar.addPanel(title, url, "");
         }
         catch (e) {
             alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
         }
     }
 }
 //字体大中小
function doZoom(size){
    document.getElementById('zoom').style.fontSize=size+'px';
    document.getElementById('zoom').style.lineHeight="165%";
}
//文章内容指定打印
function printme(){
	document.body.innerHTML=document.getElementById('newsContent').innerHTML; 
	window.print(); 
} 

