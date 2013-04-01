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
        //进行异步提交
        $("#inspect").validate({
            errorElement: "em",
            success: function(em) {
               // em.text("ok").addClass("success");//验证通过的动态CSS
            },
            submitHandler:function() {
                // ajaxSubmitForm();
                //异步提交刷新
                $.ajax({
                    type:'post',
                    url:'<%=basePath %>inspect/editeSave/${pId}/${currentId}',
                    data:$('#inspect').serialize(),
                    success:function(root){
                        //判断成功或者失败
                        if(root){
                            window.location.href="<%=basePath%>inspect/index/${pId}/${currentId}";
                        } else {
                            alert("失败了，请联系管理员");
                        }

                    }
                });
            },
            rules: {
                title: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: "巡检项不能为空"
                }
            }
        });
        
    });
    
</script>
</head>
<body>
<div class="table_main margin_top">
        <form id="inspect" onsubmit="return false;">
            <input type="hidden" name="id" value="${inspect.id }"/>
            <table class="thead tbody">
                <caption class="thead_function">编辑和添加</caption>
                <tbody>
                    <tr>
                        <td align="right">巡检项：</td>
                        <td><input type="text" name="title" value="${inspect.title }"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">内容：</td>
                        <td><input type="text" name="insdesc" value="${inspect.insdesc }"/> 
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><input type="submit"
                            id="submit" value="确定"  class="button" />
                            <input type="button" class="button" onclick="javascript:$.fancybox.close();" value="取消"/>
                            </td>
                    </tr>
                </tbody>

            </table>
        </form>
    </div>        
        
        
        
        
        
        
        
        
</body>
</html>