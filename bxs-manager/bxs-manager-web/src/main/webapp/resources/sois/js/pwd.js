layui.use(['form','layer','laydate','table','laytpl'],function(){
        var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

    //添加验证规则
    form.verify({
        oldPwd : function(value, item){
        	 
           
        },
        newPwd : function(value, item){
            if(value.length < 6){
                return "密码长度不能小于6位";
            }
        },
        confirmPwd : function(value, item){
            if(!new RegExp($("#newPwd").val()).test(value)){
                return "两次输入密码不一致，请重新输入！";
            }
        }
    })
    
    //修改密码
    form.on("submit(changePwd)",function(data){
        var index = layer.msg('提交中，请稍候',{icon: 16,time:false,shade:0.8});
        $.ajax({
			cache: true,
			type: "POST",
			url:ctx+'/user/changePwd',
			data:{
				oldPwd:$('#oldPwd').val(),
				newPwd:$('#newPwd').val()
			},
			async: false,
		    error: function(request) {
		        
		    },
		    success: function(data) {
		    	layer.close(index);
		    	if(data.success!=true){
		    		layer.msg(data.msg);
		    	}else{
		    		layer.msg(data.msg);
		    		setTimeout(function(){
		    			  //location.reload();
		            },2000);
		    		
		    		
		    	}
		    }
		})
		//阻止表单跳转。如果需要表单跳转，去掉这段即可。
		return false;
    })
    

})