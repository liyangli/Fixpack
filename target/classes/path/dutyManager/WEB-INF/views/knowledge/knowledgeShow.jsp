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
<title>知识库详情展示</title>

</head>
<body>
	<div align="center">
		<h1 style="color:#24618E;">${knowledge.title}</h1>
	   	<hr width="80%"/>
	   	
	</div>
   	<div style="white-space:normal;margin: 0 auto;width:80%;">${knowledge.content}</div>
</body>
</html>