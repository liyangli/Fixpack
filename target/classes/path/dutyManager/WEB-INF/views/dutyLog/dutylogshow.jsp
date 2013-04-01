<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css" media=print>
.noprint{display : none }
</style>

<script type="text/javascript">
	function closeFrm(){
		parent.$.fancybox.close();
	}
	
	<%-- function printBtn(){
		var currentId = $("#dutyLogId").val();
		if("" == currentId){
			window.location.href="<%=basePath%>dutyLog/showDutyLog/3/10";
			return;
		}
		$.ajax({
			type: "POST",
			url: "<%=basePath%>dutyLog/printCurrentDutyLog",
			dataType: "json",
			async : false,
	        data: {
	        	"Rnd":  Math.random(),
	        	"currentId":currentId
	        	},
	        error : function() {
			},
	        success: function(json) {
	        	var msg = eval(json);
	        	if(msg.flag){
	        		closeBtn();
	        	}else{
	        		 alert("获取打印内容失败！");
	        	}
	        },
			complete: function (XHR, TS) { 
				XHR = null;TS = null;
				try{CollectGarbage();}catch(e){};}  
		}); 
	}--%>
</script>
</head>
<body>
   	
   	<div class="table_main margin_top">
   		<table class="thead tbody">
   			<caption class="thead_function">值班日志展示：</caption>
	    	<tr>
	    		<td class="textFont">值班内容：</td>
	    		<td style="white-space:normal;">
	    			 <textarea rows="8" cols="88" readonly="readonly" style="overflow-y:auto;color:gray;">${dutyLog.content }</textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="textFont">电话记录：</td>
	    		<td style="white-space:normal;">
	    			<textarea rows="6" cols="88" readonly="readonly" style="overflow-y:auto;color:gray;">${dutyLog.telContent }</textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="noprint" colspan="2" align="right"><input type="button" class="button" id= "btn1" name="closeFrm" onclick="closeFrm();" value="关闭"/>&nbsp;&nbsp;&nbsp;<input type="button" class="button" value="打印" name="printBtn" id="printBtn" onclick="javascript:window.print();"/></td>
	    	</tr>
	    </table>
	    <input type="hidden" name="dutyLogId" id="dutyLogId" value="${dutyLog.id }"/>
	 </div>
</body>
</html>