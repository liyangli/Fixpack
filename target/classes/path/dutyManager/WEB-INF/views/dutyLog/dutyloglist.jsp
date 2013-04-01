<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>值班值日</title>

<!-- 日期时间控件 -->
<script language="javascript" type='text/javascript'
	src="<%=basePath%>resources/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('.showDutyLog').fancybox({
		minWidth  : '500px',
        minHeight : '300px',
        autoScale : true
      });
	if(${pageModel.totalPages} > 1){
		//分页
		$("#pageView").paginate({
		    count       : ${pageModel.totalPages},
		    start       : ${pageModel.currentPage},
		    display     : 5,
		    border                  : false,
		    text_color              : '#888',
		    background_color        : '#EEE',   
		    text_hover_color        : 'black',
		    background_hover_color  : '#CFCFCF',
		    onChange:searchByWhere
		});
	}
	
});
//按条件查询
function searchByWhere(){
	$("#currentPage").val($('.jPag-current').text());
	$("#searchFrm").submit();
}

</script>
</head>
<body >
<!--main start-->
<div class="main">
	<div class="search_con">
    	<div class="round_conner">
            <b class="b1"></b>
            <b class="b2"></b>
            <b class="b3"></b>
            <b class="b4"></b>
            <b class="b4"></b>
        </div>
        <div class="round_con">
        	<form id= "searchFrm" action="<%=basePath %>dutyLog/showDutyLog/${pId }/${currentId}" method="post">
            <ul class="search_main">
                <li>创建时间&nbsp;从&nbsp;<input type="text" class="Wdate text" name="createBeginTime" id="createBeginTime" value="${createBeginTime}" 
                	onclick="WdatePicker({maxDate:'#F{$dp.$D(\'createEndTime\')}',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false})" /></li>
              	<li>  至<input type="text" class="Wdate text" name="createEndTime" id="createEndTime" value="${createEndTime}" 
              		onclick="WdatePicker({minDate:'#F{$dp.$D(\'createBeginTime\')}',maxDate:'2020-10-01',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false})" /></li>
                <li>创建人&nbsp;&nbsp;<input type="text" class="text" name="creator" id="creator" value="${creator }"/></li>
                <li><input type="button" class="button" value="查询" onclick="searchByWhere();"/></li>
            </ul>
            <input type="hidden" name="currentPage" id="currentPage" value="" />
            </form>
        </div>
        <div class="round_conner">
            <b class="b4"></b>
            <b class="b4"></b>
            <b class="b3"></b>
            <b class="b2"></b>
            <b class="b1"></b>
        </div>
    </div>
    <div class="table_main margin_top">
    	<table class="thead tbody">
        	<thead>
                <tr>
                	<th width="10%">创建人</th>
                    <th width="10%">创建时间</th>
                    <th>工作日志</th>
                    <th >电话记录</th>
                    <th width="10%">查看</th>
                </tr>
            </thead>
            <tbody align="center">
            	<c:forEach var="dutyLog" items="${dutyLogList.result}" step="1" varStatus="i">
		            <tr <c:if test="i.index%2 != 0">class="gray_bg"</c:if>>
		            	<td>${dutyLog.creater }</td>
		                <td><fmt:formatDate value="${dutyLog.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                <td><c:choose><c:when test='${fn:length(dutyLog.content) >= 60}'>${fn:substring(dutyLog.content,0,60)}...</c:when><c:otherwise>${dutyLog.content}</c:otherwise></c:choose></td>
		                <td><c:choose><c:when test='${fn:length(dutyLog.telContent) >= 30}'>${fn:substring(dutyLog.telContent,0,30)}...</c:when><c:otherwise>${dutyLog.telContent}</c:otherwise></c:choose></td>
		                <td id='dutyLog_${i.index}'><a class='showDutyLog fancybox.iframe' href= "<%=basePath%>dutyLog/showDutyLogById?id=${dutyLog.id}" >查看</a></td>
		            </tr>
		        </c:forEach>
		        <tr>
	               <td colspan="5">
	                   <div id="pageView"></div>
	               </td>
	            </tr>
            </tbody>
        </table>
    </div>
</div>
<!--main end-->

</body>
</html>
