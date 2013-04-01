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
        minWidth  : '200px',
        minHeight : '100px',
        autoScale : false
      });
    $('.table_add').fancybox({
        minWidth  : '200px',
        minHeight : '100px',
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
        window.location.href="<%=basePath%>inspect/index/${pId}/${currentId}?currentPage="+currentPage;
    }
    
});
</script>
<title>巡检项管理</title>
</head>
<body>
   <!--main start-->
<div class="main">
    <div class="table_main margin_top">
        <table class="thead tbody">
            <caption class="thead_function">
                <a href="<%=basePath %>inspect/editeShow/${pId }/${currentId}"  class="table_add fancybox.ajax">添加</a>
            </caption>
            <thead>
                <tr align="center">
                    <td>巡检项</td>
                    <td>描述</td>
                    <td>操作</td>
                    
                </tr>
            </thead>
            <tbody>
               <c:forEach var="uu" items="${searchResults.result }" varStatus="rs">
                <tr align="center" <c:if test="${(rs.index+1)%2==0 }">class="gray_bg"</c:if>>
                    <td>${uu.title }</td>
                     <td>${uu.insdesc }</td>
                     <td >
                         <div class="opeator">
                         <a href="<%=basePath %>inspect/editeShow/${pId }/${currentId}?inspectId=${uu.id}" class="table_edit fancybox.ajax" >编辑</a>
                         <a href="#" onclick="doDelete('<%=basePath %>inspect/delete/${pId}/${currentId}?inspectId=${uu.id}');" class="table_del ">删除</a> 
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