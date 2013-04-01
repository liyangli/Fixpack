<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>编辑和添加</title>
<script type="text/javascript">
    $(function(){
        jQuery.validator.addMethod("isPhone", function(value, element) {
            var tel = /^(\d{3,4}-?)?\d{7,9}(-?\d{1,4})?$/;   
            return this.optional(element) || (tel.test(value));   
        }, "请正确填写您的电话号码");
        //进行异步提交
        $("#contact").validate({
            errorElement: "em",
            success: function(em) {
                em.text("ok").addClass("success");//验证通过的动态CSS
            },
            submitHandler:function() {
                //异步验证用户名是否重复
                
                
                // ajaxSubmitForm();
                //异步提交刷新
                $.ajax({
                    type:'post',
                    url:'<%=basePath%>contact/editeSave/${pId}/${currentId}',
                    data:$('#contact').serialize(),
                    success:function(root){
                        //判断成功或者失败
                        if(root){
                        	alert("恭喜，成功了");
                            window.location.href="<%=basePath%>contact/index/${pId}/${currentId}";
                        } else {
                            alert("失败了，请联系管理员");
                        }

                    }
                });
            },
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                email: {
                    email:true
                }
            },
            messages: {
            	name: {
                    required: "姓名不能为空",
                    minlength: "姓名长度必须大于2个字符"
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
        <form id="contact" onsubmit="return false;">
            <input type="hidden" name="id" value="${contact.id }"/>
            <table class="thead tbody">
                <caption class="thead_function">添加或者修改</caption>
                <tbody>
                    <tr>
                        <td align="right">姓名：</td>
                        <td><input type="text" name="name" value="${contact.name }"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">公司：</td>
                        <td><input type="text" name="company" value="${contact.company }"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">传真：</td>
                        <td><input type="text" name="fax" value="${contact.fax }"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">电话：</td>
                        <td><input type="text" name="info.tel" value="${contact.info.tel }" class="phone"/> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right">email：</td>
                        <td>
                            <input type="text" name="info.email" value="${contact.info.email }" class="email" title="请输入指定格式email"/>    
                         </td>
                    </tr>
                    <tr>
                        <td align="right">描述：</td>
                        <td><input type="text" name="contactDesc" value="${contact.contactDesc }"/></td>
                    </tr>
                   
                    <tr>
                        <td colspan="2" align="right"><input type="submit"
                            id="submit" value="确定" class="button" />
                            <input type="button" class="button" onclick="javascript:$.fancybox.close();" value="取消"/>
                            
                            </td>
                    </tr>
                </tbody>

            </table>
        </form>
    </div>    
</body>
</html>