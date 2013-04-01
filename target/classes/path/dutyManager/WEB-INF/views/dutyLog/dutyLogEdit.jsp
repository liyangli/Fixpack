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
<title>值班日志</title>
<script type="text/javascript">
    var msg = "";
    //自动追加内容
    $(function(){
    	//在值班日志中进行默认填充值
    	var content = $("#content").val();
    	if(content == ""){
    		//进行追加内容
    		msg = "值班日志：\n\n";
    		msg +="注意事项：\n\n";
    		msg +="待办事宜：\n\n";
    		msg +="故障处理："
    		$("#content").val(msg);
    	}
    	//进行提示是否添加成功
    	var flag = $("#msg").val();
    	if(flag == 'true'){
    		alert("恭喜你操作成功！");
    	}
    });
    
    
    //进行异步获取故障数据
    function doAjax(){
    	alert("目前还没有与server进行相互结合");
    	/* return false; */
    	/* $.ajax({
    		type:'post',
            url:'${url}',
            data:{startTime:'${daydutyDate.startTime}',endTime:'${daydutyDate.endTime}'},
            success:function(root){
                //判断成功或者失败
                //进行追加到日志上

            }
    	}); */
    }
    
    function doSubmit(){
    	var content = $("#content").val();
    	content = $.trim(content);
    	msg = $.trim(msg);
    	var len = content.length;
    	if(len == msg.length){
    		//还没有增加
    		alert("请添加值班日志");
    		return false;
    	}
    	//进行提交
    	return true;
    }
</script>
</head>
<body>
    <form action="<%=basePath %>dutyLog/save/${pId}/${currentId}" method="post" onsubmit="return doSubmit();">
    <input type="hidden" name="id" value="${dutyLog.id }"/>
    <input type="hidden" id="msg" value="${msg }">
    <table id="tab" style="width:100%">
    	<tr>
    		<td class="textFont" style="width:50px;">值班内容</td><td>
    		<textarea  style="width:100%;height:250px;" name="content" id="content">${dutyLog.content }</textarea></td>
    	</tr>
    	<tr>
    	   <td colspan="2" align="right">
    	   		<button id= "receivebtn" type="button" class="button_max" onclick="doAjax();"><span><em>${button }</em></span></button>
    	    </td>
    	</tr>
    	<tr>
    		<td class="textFont">电话记录</td><td>
    		<textarea  style="width:100%;height:250px;" name="telContent" id="telContent">${dutyLog.telContent }</textarea></td>
    	</tr>
    	<tr>
    		<td colspan="2" align="right">
    			<input type="submit" class="button"  value="确认" />&nbsp;&nbsp;&nbsp;
    		</td>
    	</tr>
    </table>
    </form>
</body>
</html>