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
<script type="text/javascript">

</script>
<title>联系人列表</title>
<link href="<%=basePath%>resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/master.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>

<div class="main">

    <div class="table_main margin_top">
        <table class="thead tbody">
            <thead>
                <tr>
                     <th>名称</th>
                     <th>公司</th>
                     <th>联系电话</th>
                     <th>传真</th>
                     <th>Email</th>
                     <th>描述</th>
                    
                </tr>
            </thead>
            <tbody>
               <c:forEach var="uu" items="${contactsList }" varStatus="rs">
                <tr align="center" <c:if test="${(rs.index+1)%2==0 }">class="gray_bg"</c:if>>
                    <td>${uu.name }</td>
	                 <td>${uu.info.tel }</td>
	                 <td>${uu.company }</td>
	                 <td>${uu.info.email }</td>
	                 <td>${uu.fax }</td>
	                 <td>${uu.contactDesc }</td>
                </c:forEach>
            </tbody>
            
        </table>
        </div>
    </div>
<!--main end-->
</body>
</html>