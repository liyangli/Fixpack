<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>值班值日</title>
<script type="text/javascript">
    $('#inspectAdd').fancybox({
		width  : '30%',
	    height : '300px',
	    autoSize : false,
	    autoScale : true
	}); 
    
</script>
</head>
<body >

	<!--main start-->
<div class="main">
    <div class="margin_top">
   		<div class="table_main margin_top">
    	<table class="thead tbody" style="word-break : break-all;">
    		<caption class="thead_function">
    	<%-- 	<a class='table_add addInspectLog fancybox.iframe' href= "<%=basePath%>inspectLog/initInspectLogAdd" >添加</a> --%>
    			<c:if test="${!flag }">
    				<a class='table_add addInspectLog fancybox.iframe' id="inspectAdd" href= "<%=basePath %>/inspectLog/editeShow/${pId}/${currentId}"  >添加</a>
    			</c:if>
            </caption>
         </table>
         </div>   
    	<ul class="record_con">
    		<c:forEach var="inspectLog" items="${inspectLogList.result}" step="1" varStatus="i">
    			<li>
            	<table class="thead tbody">
                    <thead>
                    	<tr>
                        	<th><fmt:formatDate value="${inspectLog.inspectTime}" pattern="yyyy-MM-dd"/></th>
                            <th><fmt:formatDate value="${inspectLog.inspectTime}" pattern="HH:mm:ss"/></th>
                        </tr>
                    </thead>
                    <tbody align="center">
                    	<c:forEach var="inspectLogLink" items="${inspectLog.links}" step="1" varStatus="j">
                    		<tr>
                    			<td>${inspectLogLink.inspect }</td>
                    			<td>
                    			<c:choose>
                    				<c:when test="${inspectLogLink.state == true}">
                    					<input type="checkbox" readonly="readonly" disabled="disabled" checked="checked"/>
                    				</c:when>
                    				<c:otherwise>
                    					<input type="checkbox" readonly="readonly" disabled="disabled"/>
                    				</c:otherwise>
                    			</c:choose>
                    			</td>
                    		</tr>
                    	</c:forEach>
                        <tr>
                        	<td>备注</td>
                            <td width="100">${inspectLog.insLogdesc}</td>
                        </tr>
                        <tr>
                        	<td>巡检人</td>
                            <td>${inspectLog.user.loginName}</td>
                        </tr>
                    </tbody>
                </table>
            </li>
		    </c:forEach>
        	
        </ul>
    </div>
   
</div>
<!--main end-->
	
</body>
</html>
