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
		minWidth  : '300px',
        minHeight : '300px',
        autoScale : false
      });
	$('.table_add').fancybox({
		minWidth  : '300px',
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
		var userName = $("#userName").val();
        var telNum = $("#telNum").val();
		window.location.href="<%=basePath%>user/index/${pId}/${currentId}?currentPage="+currentPage+"&userName="+userName+"&telNum="+telNum;
	}
	//只能输入数字
	$("#telNum").keypress(function(event) {  
        var keyCode = event.which;  
        if (keyCode == 46 || (keyCode >= 48 && keyCode <=57) || keyCode == 8)//8是删除键  
            return true;  
        else  
            return false;  
    }).focus(function() {  
        this.style.imeMode='disabled';  
    }); 
	
});
</script>
<title>用户列表</title>
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
        <form id="searchUser" action="<%=basePath%>user/index/${pId}/${currentId}" method="post">
            <ul class="search_main">
                <li>用户名<input type="text" class="text" id="userName" name="userName" value="${userName }" /></li>
                <li>联系电话<input type="text" class="text" id="telNum" name="telNum" value="${telNum }"/></li>
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
                <a href="<%=basePath %>user/editeShow/${pId }/${currentId}"  class="table_add fancybox.ajax">添加</a>
            </caption>
            <thead>
                <tr>
                     <th>用户名</th>
	                 <th>中文显示</th>
	                 <th>联系电话</th>
	                 <th>Email</th>
	                 <th>描述</th>
	                 <th>操作</th>
                    
                </tr>
            </thead>
            <tbody>
               <c:forEach var="uu" items="${searchResults.result }" varStatus="rs">
	            <tr align="center" <c:if test="${(rs.index+1)%2==0 }">class="gray_bg"</c:if>>
	                <td>${uu.userName }</td>
	                 <td>${uu.loginName }</td>
	                 <td>${uu.info.tel }</td>
	                 <td>${uu.info.email }</td>
	                 <td>${uu.userDesc }</td>
	                 <td >
	                     <div class="opeator">
	                     <a href="<%=basePath %>user/editeShow/${pId }/${currentId}?userId=${uu.id}" class="table_edit fancybox.ajax" >编辑</a>
	                     <c:if test="${user.id ne uu.id }">
	                     	<a href="#" onclick="doDelete('<%=basePath %>user/delete/${pId}/${currentId}?userId=${uu.id}')" class="table_del ">删除</a>
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