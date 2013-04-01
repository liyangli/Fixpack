<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        	<form id= "searchFrm" action="<%=basePath %>inspectLog/showInspectLog/${pId }/${currentId}" method="post">
            <ul class="search_main">
                <li>巡检时间&nbsp;从&nbsp;<input type="text" class="Wdate text" name="inspectBeginTime" id="inspectBeginTime" value="${inspectBeginTime}" 
                	onclick="WdatePicker({maxDate:'#F{$dp.$D(\'inspectEndTime\')}',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false})" /></li>
                <li>至<input type="text" name="inspectEndTime" class="Wdate text"  id="inspectEndTime" value="${inspectEndTime}" 
					onclick="WdatePicker({minDate:'#F{$dp.$D(\'inspectBeginTime\')}',maxDate:'2020-10-01',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false})" /></li>
                <li>巡检人&nbsp;&nbsp;<input type="text" name="inspector" class="text" id="inspector" value="${inspector}"/></li>
                <input type="hidden" name="currentPage" id="currentPage" value="" />
                <li><input type="button" class="button" onclick="searchByWhere();" value="查询" /></li>
            </ul>
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
    <div class="margin_top">
    	<ul class="record_con">
    		<c:forEach var="inspectLog" items="${inspectLogList.result}" step="1" varStatus="i">
    			<li>
            	<table class="thead tbody">
                	<col width="70%"></col> <col></col>
                    <thead>
                    	<tr>
                        	<th><fmt:formatDate value="${inspectLog.inspectTime}" pattern="yyyy-MM-dd"/></th>
                            <th><fmt:formatDate value="${inspectLog.inspectTime}" pattern="HH:mm:ss"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="inspectLogLink" items="${inspectLog.links}" step="1" varStatus="j">
                    		<tr>
                    			<td>${inspectLogLink.inspect }</td>
                    			<td>
                    			<c:choose>
                    				<c:when test="${inspectLogLink.state == true}">
                    					<input type="checkbox" readonly="readonly" checked="checked"/>
                    				</c:when>
                    				<c:otherwise>
                    					<input type="checkbox" readonly="readonly" />
                    				</c:otherwise>
                    			</c:choose>
                    			</td>
                    		</tr>
                    	</c:forEach>
                        <tr>
                        	<td>备注</td>
                            <td>${inspectLog.insLogdesc}</td>
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
<!-- 分页 -->

	<div id="pageView" ></div>
</body>
</html>
