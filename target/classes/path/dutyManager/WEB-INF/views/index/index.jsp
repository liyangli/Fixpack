<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>首页</title>

<script type="text/javascript">
$(document).ready(function(){
	$('.showNotice').fancybox({
		minWidth  : '550px',
        minHeight : '300px',
        autoScale : false
      });
});

</script>
</head>
<body>
<!--main start-->
<div class="main">
	<div class="notice_con">
    	<h2 class="title"><span class="notice_icon">公告</span></h2>
        <ul class="notice_list">
        	<c:forEach	var="notice" items="${noticeList }" step="1" varStatus="i">
        		<li><span class="float_l" ><a class="showNotice fancybox.iframe" href="<%=basePath%>notice/findNoticeById?noticeId=${notice.id}"><c:choose><c:when test='${fn:length(notice.title) >= 75}'>${fn:substring(notice.title,0,75)}...</c:when><c:otherwise>${notice.title}</c:otherwise></c:choose></a></span><span class="float_r"><fmt:formatDate value="${notice.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span></li>
        	</c:forEach>
        </ul>
    </div>
    <div class="log_con margin_top">
    	<h2 class="title"><span class="log_icon">日志</span></h2>
        <ul class="log_list">
        	<c:forEach	var="dutyLog" items="${dutyLogList }">
        		<li><span class="float_l" ><a class='showNotice fancybox.iframe' href= "<%=basePath%>dutyLog/showDutyLogById?id=${dutyLog.id}"><c:choose><c:when test='${fn:length(dutyLog.content) >= 75}'>${fn:substring(dutyLog.content,0,75)}...</c:when><c:otherwise>${dutyLog.content}</c:otherwise></c:choose></a></span><span class="float_r"><fmt:formatDate value="${dutyLog.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></li>
        	</c:forEach>
        </ul>
    </div>
</div>
<!--main end-->

</body>
</html>