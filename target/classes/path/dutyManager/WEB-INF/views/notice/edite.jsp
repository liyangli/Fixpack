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
        $("#notice").validate({
            errorElement: "em",
            success: function(em) {
               // em.text("ok").addClass("success");//验证通过的动态CSS
            },
            submitHandler:function() {
                // ajaxSubmitForm();
                //异步提交刷新
                $.ajax({
                    type:'post',
                    url:'<%=basePath %>notice/editeSave/${pId}/${currentId}',
                    data:$('#notice').serialize(),
                    success:function(root){
                        //判断成功或者失败
                        if(root){
                        	alert("恭喜，成功了");
                            window.location.href="<%=basePath%>notice/index/${pId}/${currentId}";
                        } else {
                            alert("失败了，请联系管理员");
                        }

                    }
                });
            },
            rules: {
            	title: {
                    required: true
                },
                content: {
                    required: true
                }
            },
            messages: {
            	title: {
                    required: "标题不能为空"
                },
                content: {
                    required: "内容不能为空"
                }
            }
        });
        
    });
    
</script>
</head>
<body>
<div class="table_main margin_top">
        <form id="notice" onsubmit="return false;">
            <input type="hidden" name="id" value="${notice.id }"/>
            <table class="thead tbody">
                <caption class="thead_function">编辑和添加</caption>
                <tbody>
                    <tr>
                        <td width="10%" align="right">标题：</td>
                        <td><input type="text" name="title" value="${notice.title }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="10%" align="right" class="textFont">内容：</td>
                        <td>
                        <textarea rows="10" cols="90" name="content" >${notice.content }</textarea>
                        </td>
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