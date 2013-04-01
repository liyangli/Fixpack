<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>排班查询</title>
<%-- <script src="<%=basePath%>resources/plugin/ui/ui/jquery.ui.datepicker.js"></script> --%>
<script language="javascript" type='text/javascript'
	src="<%=basePath%>resources/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
    if(${pageModel.totalPages} >1){
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
            onChange:loadData
        });
    }
    
    //异步获取数据
    function loadData(){
        var currentPage = $('.jPag-current').text();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        //分页后处理
        window.location.href="<%=basePath%>arrange/groupUserList/${pId}/${currentId}?startTime="+startTime+"&endTime="+endTime+"&currrentPage="+currentPage;
    } 
    
});
//提交进行验证结束是否为空
function doSubmit(){
	var endTime = $("#endTime").val();
	if(endTime == ""){
		alert("请选择结束时间");
		return false;
	}
	return true;
}

</script>
</head>
<body>
   
<!--main start-->
<div class="main">
    <!-- search start -->
    <div class="search_con">
        <div class="round_conner">
            <b class="b1"></b>
            <b class="b2"></b>
            <b class="b3"></b>
            <b class="b4"></b>
            <b class="b4"></b>
        </div>
        
        <div class="round_con">
        <form id="searchGroup" action="<%=basePath %>arrange/groupUserList/${pId}/${currentId}" onsubmit="return doSubmit();">
            <ul class="search_main">
                <li>开始时间：<input type="text" id="startTime" name="startTime"  value="${startTime }" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',dateFmt:'yyyy-MM-dd',isShowClear:false})"/></li>
                <li>结束时间：<input type="text" id="endTime" readonly="readonly" name="endTime" value="${endTime }" onclick="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}',dateFmt:'yyyy-MM-dd',isShowClear:false})"/></li>
                <li><input type="submit" class="button" value="查询" /></li>
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
    <!-- search end -->
    <div class="table_main margin_top">
        <table class="thead tbody">
            <thead>
                <tr>
                       <th> 组名</th>
			           <th>值班日期</th>
			           <th>值班时间</th>
			           <th>值班人</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="groupUser" items="${groupUsers }">
		           <tr>
		              <td>${groupUser.group.groupName }</td>
		              <td><fmt:formatDate value="${groupUser.dutyDate }" pattern="yyyy-MM-dd"/></td>
		              <td>${groupUser.dayDutyDate }</td>
		              <td>
		                   <c:forEach var="buser" items="${groupUser.user }">
		                       ${buser.loginName } &nbsp;
		                   </c:forEach>
		              </td>
		           </tr>
		       </c:forEach>
                <tr>
                   <td colspan="6">
                       <div id="pageView"></div>
                   </td>
                </tr>
            </tbody>
            
        </table>
        </div>
    </div>
    <div id="showError"></div>
<!--main end-->   
</body>
</html>