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
$(function(){
    
    //分层显示
    $('.table_edit').fancybox({
        minWidth  : '500px',
        minHeight : '300px',
        autoScale : false
      });
    $('.table_add').fancybox({
        minWidth  : '500px',
        minHeight : '300px',
        autoScale : false
      });
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
        //进行跳转
        var roleName = $("#roleName").val();
        window.location.href="<%=basePath%>role/index/${pId}/${currentId}?currentPage="+currentPage+"&roleName="+roleName;
    }
});
</script>
<title>角色列表</title>
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
        <form id="searchUser" action="<%=basePath%>role/index/${pId}/${currentId}" method="post">
            <ul class="search_main">
                <li>角色名<input type="text" class="text" id="roleName" name="roleName" value="${roleName }" /></li>
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
            <caption class="thead_function">
                <a href="<%=basePath %>role/editeShow/${pId }/${currentId}"  class="table_add fancybox.ajax">添加</a>
            </caption>
            <thead>
                <tr>
                     <th>角色名</th>
                     <th>描述</th>
                     <th>操作</th>
                    
                </tr>
            </thead>
            <tbody>
                
                <c:forEach var="role" items="${searchResults.result }" varStatus="rs">
		            <tr align="center" <c:if test="${(rs.index+1)%2==0 }">class="gray_bg"</c:if>>
		                <td>${role.roleName }</td>
		                 <td>${role.roleDesc }</td>
		                  <td >
	                         <div class="opeator">
	                         <c:if test="${role.id eq 1 }">&nbsp;&nbsp;&nbsp;
	                         	<span class="span_edit">编辑</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span  class="span_del ">删除</span> 
	                         </c:if>
	                         <c:if test="${role.id ne 1 }">
	                         	<a href="<%=basePath %>role/editeShow/${pId }/${currentId}?roleId=${role.id}" class="table_edit fancybox.ajax" >编辑</a>
	                         	<a href="#" onclick="doDelete('<%=basePath %>role/delete/${pId}/${currentId}?roleId=${role.id}')" class="table_del ">删除</a>
	                         </c:if>
	                         </div>
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
<!--main end-->
</body>
</html>