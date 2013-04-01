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
<title>用户编辑和添加</title>
<style type="text/css">
input {
font-family:'Verdana';
}
</style>
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
                //异步提交刷新
                $.ajax({
                    type:'post',
                    url:'<%=basePath%>user/editeSave',
                    data:$('#baseUser').serialize(),
                    dataType:'json',
                    success:function(root){
                        if(root){
                        	alert("恭喜，成功了");
                            window.location.href="<%=basePath%>user/index/${pId}/${currentId}";
                        } else {
                            alert("已经含有该用户名，请更换");
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
    	
	});
    
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
						<td align="right">用户名：</td>
						<td><input type="text" name="userName"
							value="${baseUser.userName }" />
						</td>
					</tr>
					<tr>
						<td align="right">密码：</td>
						<td><input type="password" name="password"
							value="${baseUser.password }" /> 
							<input type="hidden" name="pwd" value="${pwd }" >
						</td>
					</tr>
					<tr>
						<td align="right">显示名称：</td>
						<td><input type="text" name="loginName"
							value="${baseUser.loginName }" />
						</td>
					</tr>
					<tr>
						<td align="right">电话：</td>
						<td><input type="text" name="info.tel"
							value="${baseUser.info.tel }" class="phone"  /> 
						</td>
					</tr>
					<tr>
						<td align="right">email：</td>
						<td><input type="text" name="info.email"
							value="${baseUser.info.email }" class="email" title="请输入指定格式email" /> </td>
					</tr>
					<tr>
						<td align="right">描述：</td>
						<td><input type="text" name="userDesc"
							value="${baseUser.userDesc }"/></td>
					</tr>
					<tr>
						<td align="right">角色：</td>
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
						<td colspan="2" align="right"><input type="submit"
							id="submit" value="确定" class="button"  />
							<input type="button" class="button" onclick="javascript:$.fancybox.close();" value="取消"/>
							</td>
					</tr>
				</tbody>

			</table>
		</form>
	</div>
</body>
</html>