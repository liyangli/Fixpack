<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>公告展示</title>

<link href="<%=basePath%>resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/master.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
   	
   	<div class="table_main margin_top">
   		<table class="thead tbody">
   			<caption class="thead_function">公告详情展示</caption>
	    	<tr>
	    		<td width="60px">公告标题:</td>
	    		<td>${notice.title }</td>
	    	</tr>
	    	<tr class = "gray_bg">
	    		<td>创建时间：</td>
	    		<td><fmt:formatDate value="${notice.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	</tr>
	    	<tr>
	    		<td class="textFont" >公告内容：</td>
	    		<td style="white-space:normal;">
	    			<textarea rows="11" cols="88" readonly="readonly" style="overflow-y:auto;color:gray;">${notice.content }</textarea>
	    		</td>
	    	</tr>
    	</table>
    </div>
</body>
</html>