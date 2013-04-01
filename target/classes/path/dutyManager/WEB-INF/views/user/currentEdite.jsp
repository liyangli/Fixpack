<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>当前用户编辑</title>
<script type="text/javascript">
    $(function(){
    	jQuery.validator.addMethod("isPhone", function(value, element) {
            var tel = /^(\d{3,4}-?)?\d{7,9}(-?\d{1,4})?$/;   
            return this.optional(element) || (tel.test(value));   
        }, "请正确填写您的电话号码");
    	//进行异步提交
		$("#baseUser").validate({
            errorElement: "em",
            success: function(em) {
                em.text("ok").addClass("success");//验证通过的动态CSS
            },
            submitHandler:function() {
                // ajaxSubmitForm();
                var name = $("#name").val();
    			var pwd = $("#oldPwd").val();
            	//通过异步方式进行验证用户名和密码是否正确
                $.ajax({
                    url:"<%=basePath%>login/validate?userName=" + name + "&password="+ pwd,
        			type : "post",
        			dataType : "json",
        			success : function(flag) {
        				if (flag) {
        					//进行提交form
        					doEditeSave();
        				} else {
        					alert("您输入的旧密码不正确");
        				}
        			}

        		});
            },
            rules: {
            	userName: {
                    required: true
                },
                password: {
                    required: true,
                    minlength: 6
                },
                oldPwd: {
                    required: true
                },
                replacePwd: {
                    required: true
                },
                email: {
                	email:true
                }
            },
            messages: {
            	userName: {
                    required: "登录名不能为空"
                },
                password: {
                    required: "密码不能为空",
                    minlength: "密码长度必须大于6个字符"
                },
                oldPwd: {
                	required: "旧密码不能为空"
                },
                replacePwd: {
                	required: "重复新密码不能为空"
                },
                email: "请输入指定格式"
            }
        });
		 //只能输入数字
	    $(".phone").keypress(function(event) {  
	        var keyCode = event.which;  
	        if (keyCode == 46 || (keyCode >= 48 && keyCode <=57) || keyCode == 8)//8是删除键  
	            return true;  
	        else  
	            return false;  
	    }).focus(function() {  
	        this.style.imeMode='disabled';  
	    }); 
		 
		//验证新密码输入是否一致
		$("#replacePwd").bind("blur",function(){
			//进行提示不一致，请输入一致
			if($("#newPwd").val() != $('#replacePwd').val()){
				alert("输入的重复密码必须一致");
				$("#replacePwd").focus();
			}
		});
		$('#newPwd').bind("blur",function(){
			var newPwd = $("#newPwd").val();
			var replacePwd = $("#replacePwd").val();
			if($.trim(replacePwd) != ""){
				if($("#newPwd").val() != $('#replacePwd').val()){
					alert("输入的重复密码必须一致");
					$("#replacePwd").focus();
				}
			}
		});
		
    	
	});
    //进行保存修改
    function doEditeSave(){
    	$.ajax({
            type:'post',
            url:'<%=basePath%>user/save',
            data:$('#baseUser').serialize(),
            dataType:'json',
            success:function(root){
                if(root){
                	alert("恭喜，成功了");
                	window.top.location.reload();
                } else {
                    alert("已经含有该用户名，请更换");
                }

            }
        });
    }
</script>
</head>
<body>
	<div class="table_main margin_top">
		<form id="baseUser" onsubmit="return false;">
		    <input type="hidden" name="id" value="${baseUser.id }"/>
			<table class="thead tbody">
				<caption class="thead_function">用户添加或者修改</caption>
				<tbody>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="userName"
							value="${baseUser.userName }" />
							<input type="hidden" id="name" value="${baseUser.userName }"/>
						</td>
					</tr>
					<tr>
						<td>旧密码：</td>
						<td><input type="password" name="oldPwd" id="oldPwd"
							value="" /> 
						</td>
					</tr>
					<tr>
						<td>新密码：</td>
						<td><input type="password" name="password" id="newPwd"
							value="" /> 
						</td>
					</tr>
					<tr>
						<td>重复新密码：</td>
						<td><input type="password" name="replacePwd" id="replacePwd" 
							value="" /> 
							<input type="hidden" name="pwd" value="${pwd }" >
						</td>
					</tr>
					<tr>
						<td>中文名称：</td>
						<td><input type="text" name="loginName"
							value="${baseUser.loginName }" />
						</td>
					</tr>
					<tr>
						<td>电话：</td>
						<td><input type="text" name="info.tel"
							value="${baseUser.info.tel }" class="phone"  /> 
						</td>
					</tr>
					<tr>
						<td>email：</td>
						<td><input type="text" name="info.email"
							value="${baseUser.info.email }" class="email" title="请输入指定格式email" /> </td>
					</tr>
					<tr>
						<td>描述：</td>
						<td><input type="text" name="userDesc"
							value="${baseUser.userDesc }"/></td>
					</tr>
					<tr>
						<td>角色:</td>
						<td><c:forEach var="role" items="${roles }">
								<c:set var="flag" value="false" />
								<c:set var="id" value="${role.id }" />
								<c:forEach var="haveRole" items="${haveRoles}">
									<c:if test="${haveRole.id eq id}">
										<c:set var="flag" value="true" />
									</c:if>
								</c:forEach>
								<input type="checkbox"
									<c:if test="${flag}">checked=checked</c:if> name="checkRoles"
									value="${role.id }" />${role.roleName }
	                    </c:forEach></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							id="submit" value="确定"  /></td>
					</tr>
				</tbody>

			</table>
		</form>
	</div>
</body>
</html>