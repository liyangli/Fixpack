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
<title>值班日志</title>
<link href="<%=basePath%>resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/master.css" rel="stylesheet" type="text/css" />

<!-- 弹出层 插件 -->
<link
	href="<%=basePath%>resources/plugin/facybox/css/jquery.fancybox.css"
	rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.9.0.min.js"></script>
<!-- 弹出层插件 -->
<script type="text/javascript"
	src="<%=basePath%>resources/plugin/facybox/js/jquery.fancybox.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var hidMsg = $("#hidMsg").val();
		if("" != hidMsg){
			parent.$.fancybox.close();
		}
		
		$('#receivebtn').fancybox({
            width  : '400px',
            height : '220px',
            autoScale : true,
            href:'#showUser'
    	});
	});
	function frameClose(){
		parent.$.fancybox.close();
	}
	
	function frameClose2(){
		parent.parent.$.fancybox.close();
	}
	function receiveJob(){
		var userNP ="";
		var username = "";
		var count = 0;
		var arrPwd=$("input[name='pwdtxt']");
	    $(arrPwd).each(function(){
	    	if("" != this.value){
	    		count++;
	    		username = $(this).parent().parent().children('td').eq(0).text();
	    		userNP +=username+","+ this.value+"@";
	    	}
	    }); 
	    if("" != $("#username_z").val()){
	    	if("" != $("#pwd_z").val()){
	    		userNP +=$("#username_z").val()+","+ $("#pwd_z").val()+"@";
	    	}else{
	    		alert("请输入"+$("#username_z").val()+"的密码！");
	    		return;
	    	}
	    }else{
	    	if("" == username){
	    		alert("没有有效接班人员，请重新操作！");
		    	return;
	    	}
	    }


	    
	    $.ajax({
			type: "POST",
			url: "<%=basePath%>index/receiveJob",
			dataType: "json",
			async : false,
	        data: {
	        	"Rnd":  Math.random(),
	        	"userNP":userNP
	        	},
	        error : function() {
			},
	        success: function(json) {
	        	 var msg = eval(json);
	        	 if(msg.flag){
	        		 alert(msg.inn);
	        		 frameClose();
	        	 }else{
	        		 alert("输入的密码有误，请重新输入！");
	        	 }
	        },
			complete: function (XHR, TS) { 
				XHR = null;TS = null;
				try{CollectGarbage();}catch(e){};}  
		});
	}
	
</script>
</head>
<body>
<input type="hidden" name="hidMsg" id="hidMsg" value="${msgShow}"/>
   	
   	<div class="table_main margin_top">
   		<table class="thead tbody">
   		<caption class="thead_function">接班处理</caption>
    	<tr>
    		<td width="65px" align="right" class="textFont">值班内容:</td>
    		<td style="white-space:normal;">
	    		<textarea rows="8" cols="88" readonly="readonly" style="overflow-y:auto;color:gray;">${dutyLog.content }</textarea>
	    	</td>
    	</tr>
    	<tr>
    		<td align="right" class="textFont">电话记录:</td>
    		<td style="white-space:normal;">
	    		<textarea rows="6" cols="88" readonly="readonly" style="overflow-y:auto;color:gray;">${dutyLog.telContent }</textarea>
	    	</td>
    	</tr>
    	
    	<tr>
    		<td align="right" >已确认用户:</td>
    		<td><c:forEach items="${realUserList}" var="user" >${user.loginName }  
			</c:forEach></td>
    	</tr>
    	<tr>
    		<td colspan="2" align="right">
    		<input type="hidden" name="dutyLogId" id="dutyLogId" value="${dutyLog.id }" />
    		<button id= "receivebtn" class="button_max" ><span><em>确认接班</em></span></button>&nbsp;&nbsp;&nbsp;
    		<input type="button" class="button" value="取消" name="btn2" onclick="frameClose();" id="btn2"/></td>
    	</tr>
    </table>
    </div>
    
    <div id="showUser" style="display:none;">
	   	
	   	<div class="table_main margin_top">
	   		<table class="thead tbody" id="userTab" width="300px">
	   		<caption class="thead_function">当前值班组</caption>
	   		<tr>
	             <th width="162px">用户名</th>
	             <th width="173px">密码</th>
	         </tr>
	         <tbody >
	         <tr>
	         	<td colspan="2">
	         		 <div style="height:100px;overflow-x:hidden;overflow-y:auto;">
			         <table >
			         <c:forEach var="user" items="${newCurrentUserList}" step="1" varStatus="i">
			         	<tr>
				    		<td width="162px" >${user.userName }</td>
				    		<td ><input type="password" name="pwdtxt" id="pwd_${i.index }" value="" /></td>
				    	</tr>
			         </c:forEach>
			         <tr>
			         	   <td width="162px"><input type="text" name="usernametxt" id="username_z" value="" /></td>
				    	   <td><input type="password" name="pwdtxt_z" id="pwd_z" value="" /></td>
			         </tr>
			         </table>
			         </div>
	         	</td>
	         </tr>
	        
	         
	    	</tbody>
	    	<tfoot>
	    	<tr>
	    		<td colspan="2" align="right">
	    		<input type="hidden" name="dutyLogId" id="dutyLogId" value="${dutyLog.id }" />
	    		<input type="button" class="button" name="btn1" id="btn1" onclick="receiveJob();" value="确认"/>
	    		<input type="button" class="button" value="取消" name="btn2" onclick="frameClose2();" id="btn2"/>
	    		</td>
	    	</tr>
	    	</tfoot>
	    </table>
	    </div>
    </div>
</body>
</html>