<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        //进行跳转
        window.location.href="<%=basePath %>plugin/index/${pId}/${currentId}?currentPage="+currentPage;
    }
    
    //显示弹出层
   /*  $('.table_install').fancybox({
        minWidth  : '500px',
        minHeight : '400px',
        autoScale : false,
        href:'#installDiv',
        title:'安装'
      }); */
    
});

//显示安装弹出层
function installView(){
	$.openPopupLayer({
        name: "installPopub",
        width:"400",
        target:'installDiv'
    });
}
//关闭层
function closeFrame(){
    $.closePopupLayer(); 
}
//进行通过异步方式进行上传文件
function doInstall(){ 
	//显示加载框
	$.fancybox.showLoading();
	//form表单下所有项不允许操作
	$("input[name='file']").attr("readlony",true);
	//定时进行异步读取日志文件
	
	//在页面上进行显示
	
	//
	
}

function unInstall(pluginId){
	  if(confirm("确定要卸载该插件？"))
	   {
		   $.ajax({
			   url:"<%=basePath%>plugin/unInstall?pluginId="+pluginId,
			   type:"post",
			   dataType:"json",
			   success:function(data){
				   //成功后进行刷新页面
				   if(data){
					   alert("成功卸载");
					   location.reload();
				   }else{
					   alert("卸载出现错误，请联系管理员！");
				   }
			   }
		   });
	   }
}
function stopModel(pluginId){
	if(confirm("确定要停用该模块?")){
		//进行异步方式停止
		 $.ajax({
             url:"<%=basePath%>plugin/stopModel?pluginId="+pluginId,
             type:"post",
             dataType:"json",
             success:function(data){
                 //成功后进行刷新页面
                 if(data){
                	 alert("成功停用");
                     location.reload();
                 }else{
                     alert("停止错误，请联系管理员！");
                 }
             }
         });
	}
}

function startModel(pluginId){
    if(confirm("确定要启用该模块?")){
        //进行异步方式启用
    	 $.ajax({
             url:"<%=basePath%>plugin/startModel?pluginId="+pluginId,
             type:"post",
             dataType:"json",
             success:function(data){
                 //成功后进行刷新页面
                 if(data){
                	 alert("成功启用");
                     location.reload();
                 }else{
                     alert("启动出现错误，请联系管理员！");
                 }
             }
         });
    }
}


  function fileChange(obj,filter){

    var file = obj.value.match(/[^\/\\]+$/gi)[0];
    var rx = new RegExp('\\.(' + (filter?filter:'') + ')$','gi');
    if(filter&&file&&!file.match(rx)){
      alert("只能选择"+filter);
      obj.outerHTML = obj.outerHTML;
    }
  }


</script>
<style type="text/css">
    #popupLayer_installPopub {
        background-color: white;
    }
    #installDiv{display: none;}
</style>
<title>插件管理</title>
</head>
<body>
    
    
    <!--main start-->
<div class="main">
    <div class="table_main margin_top">
        <table class="thead tbody">
            <caption class="thead_function">
                <a href="#"  onclick="installView();">安装</a>
            </caption>
            <thead>
                <tr>
                     <th>名称</th>
	                 <th>作者</th>
	                 <th>创建时间</th>
	                 <th>操作</th>
                    
                </tr>
            </thead>
            <tbody>
               <c:forEach var="plugin" items="${searchResults.result }">
            <tr align="center" <c:if test="${(rs.index+1)%2==0 }">class="gray_bg"</c:if>>
                <td>${plugin.name }</td>
                 <td>${plugin.author }</td>
                 <td>${plugin.updateTime }</td>
                 <td>
                 <a href="#" onclick="unInstall('${plugin.id}');">卸载</a>
                 <a href="#" onclick="stopModel('${plugin.id}');">停用</a>
                 <a href="#" onclick="startModel('${plugin.id}');">启用</a>
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
        <div id="installDiv">
            <form action="<%=basePath %>plugin/ajaxUpload/${pId}/${currentId}" enctype="multipart/form-data" method="post">
            <table class="thead tbody">
            <caption class="thead_function">
                                              安装
            </caption>
            <tbody>
                <tr>
                   <td>
                        文件：
                   </td>
                   <td>
                        <input type="file" name="file"  onchange="fileChange(this,'zip')"/>
                   </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" class="button" value="确定" onclick="doInstall();"/>
                        <input type="reset" class="button" value="取消" onclick="closeFrame();"/>
                    </td>
                </tr>
            </tbody>
            
        </table>
        </form>
        </div>
    </div>
<!--main end-->
</body>
</html>