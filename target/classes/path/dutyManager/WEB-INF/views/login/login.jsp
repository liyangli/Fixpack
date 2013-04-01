<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>登录</title>

<link href="<%=basePath%>resources/css/reset.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>resources/css/layout.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>resources/css/blue.css" rel="stylesheet"
	type="text/css" />
<style>
html {
	width: 100%;
	height: 100%;
}

body {
	background: #82bbd8 url(<%=basePath%>resources/images/login.png)
		no-repeat center center;
}
</style>

<script type="text/javascript"
	src="<%=basePath%>resources/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/jquery.cookie.js"></script>
<script type="text/javascript">
    $(function(){
    	var dutyManager = $.cookie('dutyManager'); 
        if(dutyManager != null) {  
           //alert(username); 
           var ups = dutyManager.split(":");
           $("#name").val(ups[0]); 
           $("#pwd").val(ups[1]);
           $('#rmUser').attr('checked', true);    
        }
        
        $("input").keypress(function (e) { 
	    	var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode; 
	    	if (keyCode == 13){ 
	    		var userName = $('#name').val();
	    		if($.trim(userName)==''){
	    			$('#name').focus();
	    			return ;
	    		}
	    		var pwd = $("#pwd").val();
	    		if($.trim(pwd)==""){
	    			$("#pwd").focus();
	    			return;
	    		}
	    		//进行提交表单
	    		$(".login_button").click();
	    	}
	    }); 
    });
    
    function doSubmit(){
    	var name = $("#name").val();
    	var pwd = $("#pwd").val();
    	if(name == ""){
    		alert("用户名不能为空");
    		return false;
    	}
    	if(pwd == ""){
    		alert("密码不能为空");
    		return false;
    	}
 		var flag = document.getElementById("rmUser").checked;
        var duty = name+":"+pwd;
    	if(flag){  
            $.cookie('dutyManager',duty, {expires:7});
        }else{    
            $.cookie('dutyManager', null,{expires:-1});
        } 
    	
    	//进行异步验证是否正确
    	//通过异步方式进行验证用户名和密码是否正确
        $.ajax({
            url:"<%=basePath%>login/validate?userName=" + name + "&password="+ pwd,
			type : "post",
			dataType : "json",
			success : function(flag) {
				if (flag) {
					//进行提交form
					$("#doIndex").submit();
				} else {
					alert("您输入的用户名或者密码不正确");
				}
			}

		});
	}
</script>


</head>

<body>

	<div class="login_con">
		<h2 class="login_logo">值班管理系统</h2>
		<form id="doIndex" action="<%=basePath%>login/doIndex" method="post">
			<ul class="login_list">
				<li><span>用户名</span><input name="name" id="name" type="text"
					class="login_text" /></li>
				<li><span>密码</span><input name="password" id="pwd"
					type="password" class="login_text" /></li>
				<li class="padding_checkbox"><input type="checkbox" id="rmUser" class="rmUser" />记住密码</li>
				<li style="height: 36px;"><input type="button"
					class="login_button" value="" onclick="doSubmit();" /></li>
			</ul>
		</form>
	</div>

</body>
</html>
