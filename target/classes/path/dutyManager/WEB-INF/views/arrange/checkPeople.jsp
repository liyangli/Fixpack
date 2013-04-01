<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择人员</title>
</head>
<body>
    <form action="<%=basePath %>arrange/checkPeopleIndex">
        <table>
            <tr>
                <td>请选择人员</td>
            </tr>
            <tr>
                <td>
                <c:forEach var="people" items="users" varStatus="peo">
                    <input type="checkbox" name="peoId" value="${people.id }"/>${people.loginName } &npbs;
                    <c:if test="${(peo.index+1)%5==0 }">
                        </td></tr><tr><td>
                    </c:if>
                </c:forEach>
                </td>
            </tr>
        </table>
        <input type="submit" value="submit"/>
    </form>
</body>
</html>