<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String noticeId = request.getParameter("noticeId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>值班日志</title>
<link href="<%=basePath%>resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/master.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
    var msg = "";
	function frameClose(){
		parent.window.location.href = parent.window.location.href;
		parent.$.fancybox.close();
	}
	
	function handJob(){
		var hidContent = $("#hidContent").val();
		var hidTelContent = $("#hidTelContent").val();
		var dutyLogId = $("#dutyLogId").val();
    	var content = $.trim(hidContent);
    	msg = $.trim(msg);
    	var len = content.length;
    	if(len == msg.length){
    		//还没有增加
    		alert("暂不能交班，值班内容不能为空");
    		return;
    	}
		
		$.ajax({
			type: "POST",
			url: "<%=basePath%>index/handJob",
			dataType: "json",
			async : false,
	        data: {
	        	"Rnd":  Math.random(),
	        	"content":hidContent,
	        	"telContent":hidTelContent,
	        	"dutyLogId":dutyLogId
	        	},
	        error : function() {
			},
	        success: function(json) {
	        	 var msg = eval(json);
	        	 if(msg.flag ){
	        		 frameClose();
	        		 alert(msg.inner);
	        	 }else{
	        		 alert("操作失败");
	        	 }
	        },
			complete: function (XHR, TS) { 
				XHR = null;TS = null;
				try{CollectGarbage();}catch(e){};}  
		});
	}
	
	function wantHandJob(){
		alert("对不起，本组已交班！不能修改。");
	}
	
	//进行异步获取故障数据
    function doAjax(){
		if(!${noGroupFlag}){
			$.ajax({
	    		type:'post',
	            url:'${url}',
	            data:{startTime:'${daydutyDate.startTime}',endTime:'${daydutyDate.endTime}'},
	            success:function(root){
	                //判断成功或者失败
	                //进行追加到日志上

	            }
	    	});
		}
    }
	
  //自动追加内容
    $(function(){
    	//在值班日志中进行默认填充值
    	var content = $("#hidContent").val();
    	if(content == ""){
    		//进行追加内容
    		msg = "值班日志：\n\n";
    		msg +="注意事项：\n\n";
    		msg +="待办事宜：\n\n";
    		msg +="故障处理："
    		$("#hidContent").val(msg);
    	}
    });
</script>
</head>
<body>
   	
   	<div class="table_main margin_top">
   		<table class="thead tbody">
   		<caption class="thead_function">交班处理</caption>
    	<tr>
    		<td class="textFont">值班内容:</td>
    		<td>
	    		<c:choose>
	    			<c:when test="${dutyLog.visible}">${dutyLog.content }</c:when>
	    			<c:otherwise><textarea id="hidContent" name = "hidContent" rows="8" cols="88" >${dutyLog.content }</textarea></c:otherwise>
	    		</c:choose>
    		</td>
    	</tr>
    	
    	<tr>
    	   	<td colspan="2" align="right">
    	   		<c:choose>
	    			<c:when test="${dutyLog.visible}"><button class="button_max" onclick="alert('该值班日志已提交！');"><span><em>${button }</em></span></button></c:when>
	    			<c:otherwise><button id= "receivebtn" class="button_max" onclick="doAjax();"><span><em>${button }</em></span></button></c:otherwise>
	    		</c:choose>
    	   		
    	    </td>
    	</tr>
    	
    	<tr>
    		<td class="textFont">电话记录:</td>
    		<td>
	    		<c:choose>
	    			<c:when test="${dutyLog.visible}">${dutyLog.telContent }</c:when>
	    			<c:otherwise><textarea id="hidTelContent" name = "hidTelContent" rows="8" cols="88" >${dutyLog.telContent }</textarea></c:otherwise>
	    		</c:choose>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" align="right">
    		<input type="hidden" name="dutyLogId" id="dutyLogId" value="${dutyLog.id }" />
    		<c:choose>
    			<c:when test="${dutyLog.visible}"><input type="button" class="button" name="btn1" id="btn1" onclick="wantHandJob();" value="确认"/></c:when>
    			<c:otherwise><input type="button" class="button" name="btn1" id="btn1" onclick="handJob();" value="确认"/></c:otherwise>
    		</c:choose>
    		
    		
    		<input type="button" class="button" value="取消" name="btn2" onclick="frameClose();" id="btn2"/></td>
    	</tr>
    </table>
    </div>
</body>
</html>