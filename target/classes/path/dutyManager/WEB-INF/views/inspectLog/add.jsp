<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巡检记录添加</title>
<link href="<%=basePath%>resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/master.css" rel="stylesheet" type="text/css" />
<!-- 弹出层 插件 -->
<link
	href="<%=basePath%>resources/plugin/facybox/css/jquery.fancybox.css"
	rel="stylesheet" type="text/css"/>
<style type="text/css">
input {
font-family:'Verdana';
}
</style>

<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<!-- 弹出层插件 -->
<script type="text/javascript"
	src="<%=basePath%>resources/plugin/facybox/js/jquery.fancybox.js"></script>

<script type="text/javascript">
//进行显示用户名和密码确认框
function addInspect(){
	//判断是否选择的添加巡检项
	var inspectName = $(".inspectTitle");
	var flag = false;
	var msg ="";
	var noCheck = "";
	inspectName.each(function(){
		if(this.checked){
			flag = true;
			msg +=this.value+",";
		}else{
			noCheck +=this.value+",";
		}
	});
    
	if(!flag){
		alert("至少选择一个巡检项");
		return false;
	}
	$("#inspectNames").val(msg);
	$("#noChecks").val(noCheck);
	
	//打开新的层
	$.fancybox({
		height : '150px',
		autoSize : false,
	    autoScale : true,
	    href:"#login"
	});
}

function doInspectLogin(){
	var userName = $("#inspectName").val();
	var password = $("#inspectpwd").val();
	if(userName == ""||password == ""){
		alert("用户名和密码不能为空");
		return ;
	}
    //通过异步方式进行验证用户名和密码是否正确
    $.ajax({
        url:"<%=basePath%>login/validate?userName="+userName+"&password="+password,
        type:"post",
        dataType:"json",
        success:function(flag){
            if(flag){
            	parent.parent.$.fancybox.close();
            	var inspectNames = $("#inspectNames").val();
            	inspectNames = inspectNames.substr(0,inspectNames.length-1)
            	
            	var noChecks = $("#noChecks").val();
            	noChecks = noChecks.substr(0,noChecks.length-1);
            	var inspectDesc =$("#desc").val();
            	
            	$("#userName").val(userName);
            	$("#password").val(password);
            	$("#inspectNames").val(inspectNames);
            	$("#noChecks").val(noChecks);
            	$("#inspectDesc").val(inspectDesc);
            	$("#inspectLogForm").submit();
            	parent.parent.location.reload();
            }else{
            	alert("请核对用户名和密码的正确性");
            }
        }
        
    });
    //正确后进行跳转到controller进行处理添加
} 
</script>
</head>
<body>
        <table class="thead tbody" style="background-color: #fffff">
         <caption class="thead_function">添加巡检记录</caption>
         <tbody>
            <c:forEach var="inspect" items="${inspectList}" step="1" varStatus="i">
                <tr>
                    <td>${inspect.title}</td>
                    <td><input type="checkbox" name="insepctName" class="inspectTitle" value="${inspect.title }" /></td>
                </tr>
            </c:forEach>
             <tr>
                 <td>备注：</td>
                 <td><input type="text" name="desc" id="desc" value=""/></td>
             </tr>
             <tr>
                 <td colspan="2" align="right">
                 <input type="button" class="button" id="btn1" onclick = "addInspect();" value="确定"  />
                 <input type="button" class="button" id="btn2" onclick = "javascript:parent.$.fancybox.close();" value="取消"  /></td>
             </tr>
         </tbody>

     </table>
     
     <div id="login" style="display: none">
       <form action="" id="userLogin">
        <table class="thead tbody">
         <caption class="thead_function">用户确认</caption>
         <tbody>
             <tr>
                 <td width="60">用户名：</td>
                 <td><input type="text" name="inspectName" size="16" id="inspectName" value="${user.userName }" /></td>
             </tr>
             <tr>
                 <td>密码：</td>
                 <td><input type="password" size="16" name="inspectpwd" id="inspectpwd" /></td>
             </tr>
             <tr>
                 <td colspan="2" align="right">
                 <input type="button" class="button" id="btn1" onclick = "doInspectLogin();" value="确定"  />
                 <input type="button" class="button" id="btn2" onclick = "javascript:$.fancybox.close();" value="取消"  /></td>
             </tr>
         </tbody>

     </table>
     </form>
     <form id="inspectLogForm" action="<%=basePath%>inspectLog/addInspectLog/${pId}/${currentId}" method="post">
        <input type="hidden" name="userName" id="userName"/>
        <input type="hidden" name="password" id="password"/>
        <input type="hidden" name="inspectNames" id="inspectNames"/>
        <input type="hidden" name="noChecks" id="noChecks"/>
        <input type="hidden" name="inspectDesc" id="inspectDesc"/>
     </form>
    </div>
</body>
</html>