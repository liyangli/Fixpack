<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	boolean receiveJobFlag = (Boolean)session.getAttribute("receiveJobFlag");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>值班管理系统</title>
<link href="<%=basePath%>resources/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/master.css" rel="stylesheet" type="text/css" />
<!-- 列表分页插件 -->
<link href="<%=basePath%>resources/css/pageStyle.css"
	rel="stylesheet" type="text/css"/>
<!-- 弹出层 插件 -->
<link
	href="<%=basePath%>resources/plugin/facybox/css/jquery.fancybox.css"
	rel="stylesheet" type="text/css"/>


<script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/js/iepngfix_tilebg.js"></script>
<!-- 列表分页插件 -->
<script type="text/javascript"
	src="<%=basePath%>resources/js/jquery.paginate.js"></script>
<!-- 弹出层插件 -->
<script type="text/javascript"
	src="<%=basePath%>resources/plugin/facybox/js/jquery.fancybox.js"></script>
<!-- 验证form -->
<script type="text/javascript"
    src="<%=basePath%>resources/js/jquery.validate.js"></script>

    
<decorator:head />
<script type="text/javascript">
	var receiveJobFlag = <%=receiveJobFlag%>;
	$(document).ready(function(){
		$.ajaxSetup({cache:false});
		$('.handJob').fancybox(
			{
	            minWidth  : '500px',
	            minHeight : '300px',
	            autoScale : false
		    }		
		);
		$('.receiveJob').fancybox({
            minWidth  : '500px',
            minHeight : '300px',
            autoScale : false
    	});
    	$('.linkpeo').fancybox({
            minWidth  : '500px',
            minHeight : '300px',
            autoScale : true
    	});
    	$('.user_edit').fancybox({
    		minWidth  : '500px',
            minHeight : '400px',
            autoScale : false
          });
    	//自动弹窗处理
    	if(receiveJobFlag){
    		doHref();
    	}
	});
	function doExit(){
		var r=confirm("确定要退出本系统?")
		  if (r==true){
			  window.location.href="<%=basePath%>login/doExit";
		   }
	}
	
	function doHref(){
		$("#autoReceive").click();
	    
	}
	function doDelete(urlPath){
		if(confirm("确认要删除？")){
			window.location.href=urlPath;
		}
	}
</script>
</head>
<body>

<!--header start-->
    <div class="header">
        <ul>
            <li class="logo">值班管理系统</li>
            <li class="nav">
                <c:forEach var="topmodel" items="${topModel }" varStatus="mstatus">
                        <span 
                          <c:choose>
                                <c:when test="${topmodel.id==pId }">
                                   class="${topmodel.divClass }_select"
　　                                                                          </c:when>
								<c:otherwise>
								　 class="${topmodel.divClass }"
								</c:otherwise>
                            </c:choose>
                         style="cursor: hand" onclick='window.location.href="<%=basePath %>model/sencondModel/${topmodel.id }"'>
                        ${model.id}
                        <a href="<%=basePath %>model/sencondModel/${topmodel.id }" class="nav_text">${topmodel.name}</a></span>        
                    </c:forEach>
            </li>        
        </ul>
        <div style="top: 10px; position: absolute; right: 8%;">
        	当前登录用户：
        	<a href="<%=basePath %>user/editUserShow/${pId }/${currentId}?userId=${user.id}" class="user_edit fancybox.ajax" >
        	${user.loginName }
        	</a>
        </div>
        <div class="exit"><a href="#" onclick="doExit();">退出</a></div>
        <div class="function">
            <ul>
                 <li class="f_line"><a href="<%=basePath%>/index/showCurrentDutyLog" class="deal handJob fancybox.iframe" title="交班"></a></li>
                <li class="f_line"><a href="<%=basePath%>/index/showLastGroupDutyLog" id="autoReceive" class="receive receiveJob fancybox.iframe" title="接班"></a></li>
                <li><a href="<%=basePath%>/contact/findAllContacts" class="linkmen linkpeo fancybox.iframe" title="常用联系人"></a></li>
            </ul>
        </div>
    </div>
    <div class="subnav">
        <ul>
            <c:forEach var="model" items="${secodModel }">
                        <li><a
                        	<c:choose>
                                <c:when test="${currentId==model.id }">
                                   class="subnav_a"
　　                                                                          </c:when>
								<c:otherwise>
								　  class="subnav_a_none"
								</c:otherwise>
                            </c:choose>
                            href="<%=basePath %>${model.url }"><span>${model.name }</span></a></li>
                    </c:forEach>
        </ul>
    </div>
<!--header end-->

<!--contern start-->
    <div class="content">
        <decorator:body />
    </div>
<!--content end-->

<!--footer start-->
    <div class="footer">北京市博汇科技有限公司 1993-2013 版权所有 软件版本：1.0.0.0</div>
<!--footer end-->

</body>

</html>