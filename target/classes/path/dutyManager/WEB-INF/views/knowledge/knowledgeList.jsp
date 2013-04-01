<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.bohui.duty.entity.BaseUser"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title></title>
<!-- 日期时间控件 -->
<script language="javascript" type='text/javascript'
	src="<%=basePath%>resources/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>resources/plugin/ckeditor/ckeditor.js"></script>
<script language="JavaScript" type="text/javascript">
	$(document).ready(function(){
		
		/* $('.showKnowledge').fancybox({
			minWidth  : '500px',
	        minHeight : '300px',
	        autoScale : true
	      }); */
		$('.addKnowledge').fancybox({
			minWidth  : '700px',
	        minHeight : '500px',
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
			    onChange:submitKnowledge
			});
		}

	});

	function deleteIt(id){
		if(confirm("确定删除该记录？")){
			$.ajax({
				type: "POST",
				url: "<%=basePath%>knowledge/deleteKnowledgeById",
				dataType: "json",
				async : false,
		        data: {
		        	"Rnd":  Math.random(),
		        	"id":id
		        	},
		        error : function() {
				},
		        success: function(json) {
		        	var msg = eval(json);
		        	if(msg.flag){
		        		window.location.reload();
		        	}else{
		        		alert("删除失败！");
		        	}
		        },
				complete: function (XHR, TS) { 
					XHR = null;TS = null;
					try{CollectGarbage();}catch(e){};}  
			});
		}
	}
	function submitKnowledge(){
		$("#currentPage").val($('.jPag-current').text());
		$("#searchFrm").submit();
	}
	
	function tiaozhuanUrl(id){
		var url = "<%=basePath%>knowledge/showKnowledgeById?ran="+Math.random()+"&id="+id;
		window.showModalDialog(url,null,"dialogWidth=1024px;dialogHeight=760px");  
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
        	<form id= "searchFrm" action="<%=basePath %>knowledge/showKnowledgePage/${pId }/${currentId}" method="post">
            <ul class="search_main">
                <li>开始时间:<input id="createBeginTime" name="createBeginTime" type="text" class="Wdate text" value="${createBeginTime }" 
                	onclick="WdatePicker({maxDate:'#F{$dp.$D(\'createEndTime\')}',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false})"  /></li>
                <li>结束时间:<input id="createEndTime" name="createEndTime" type="text" class="Wdate text" value="${createEndTime }" 
                	onclick="WdatePicker({minDate:'#F{$dp.$D(\'createBeginTime\')}',maxDate:'2020-10-01',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false})" /></li>
				<li>创建人:<input type="text" name="editors" id="editors" class="text" value="${editors }"/></li>
				<li>标题:<input type="text" name="title" id="title" class="text" value="${title }"/></li>
                <li><input type="button" id="btn1" value="查询" class="button" onclick="submitKnowledge();"/></li>
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
    		<caption class="thead_function">
    		<a class='table_add addKnowledge fancybox.ajax' href= "<%=basePath%>knowledge/findKnowledgeById?id=" >添加</a>
            </caption>
        	<thead>
                <tr>
                    <th>标题</th>
                    <th width="15%">创建时间</th>
                    <th width="15%">创建人</th>
                    <th width="15%">操作</th>
                </tr>
            </thead>
            <tbody id="tab" align="center">
            	<c:forEach var="knowledge" items="${knowledgeList.result}" step="1" varStatus="i">
		            <tr <c:if test="i.index%2 != 0">class="gray_bg"</c:if>>
		            	<%-- <td><a href="javascript:void(0);" onclick="javascript:tiaozhuanUrl(${knowledge.id });">${knowledge.title }</a></td> --%>
		                		            	<td><a class="showKnowledge fancybox.ajax" href= "<%=basePath%>knowledge/showKnowledgeById?id=${knowledge.id }" target="_blank">${knowledge.title }</a></td>
		                <td><fmt:formatDate value="${knowledge.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                <td>${knowledge.user.loginName }</td>
		                <td >
		                	<div class="opeator"> 
		                		<c:choose>
		                		<c:when test="${sessionScope.user.loginName eq knowledge.user.loginName}">
		                			<a class="table_edit addKnowledge fancybox.ajax" href= "<%=basePath%>knowledge/findKnowledgeById?id=${knowledge.id }" >编辑</a><a class="table_del " href= "#" onclick = 'deleteIt("${knowledge.id }")'>删除</a>  
							    </c:when>  
							     
							    <c:otherwise>
							    	<a class="table_edit" href= "javascript:void(0);" onclick="alert('对不起，你没有该权限！');" >编辑</a><a class="table_del " href= "javascript:void(0);" onclick="alert('对不起，你没有该权限！');" >删除</a>
							    </c:otherwise>  
							    </c:choose>
		                	</div>
		                </td>
		            </tr>
		        </c:forEach>
            </tbody>
            <tfoot>
            	<tr>
	               <td colspan="4">
	                   <div id="pageView"></div>
	               </td>
	            </tr>
            </tfoot>
        </table>
        </div>
</div>
<!--main end-->

</body>
</html>
