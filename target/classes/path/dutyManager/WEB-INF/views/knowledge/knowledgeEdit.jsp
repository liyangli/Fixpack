<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>编辑和添加</title>

<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace( 'content', {
		uiColor:'#c5dcf3',
		toolbar: [
			 ['Bold','Italic','Underline','Strike','-','Undo', 'Redo', 
			  '-', 'SelectAll', 'RemoveFormat',
			  '-','NumberedList','BulletedList',
			  '-','Image', 'Flash', 'Table',
			  '-','Styles','Format','Font','FontSize']
		]  
	});
});

function closeFrm(){
	parent.$.fancybox.close();
}
function saveIt(){
	var id = $("#id").val();
	var titleName = $("#titleName").val();
	var content =  CKEDITOR.instances.content.getData();
	if("" == titleName){
		alert("标题不能为空！");
		return;
	}
	if(content.length == 0){
		alert("知识库内容不能为空！");
		return;
	}

	$.ajax({
		type: "POST",
		url: "<%=basePath%>knowledge/updateKnowledge",
		dataType: "json",
		async : false,
        data: {
        	"Rnd":  Math.random(),
        	"id":id,
        	"title":titleName,
        	"content":content
        	},
        error : function() {
		},
        success: function(json) {
        	 var msg = eval(json);
        	 if(msg.flag == "succss"){
        		 alert("操作成功！");
        		 closeFrm();
        		 parent.window.location.reload(); //刷新父窗口
        	 }else{
        		 alert("操作失败！");
        	 }
        },
		complete: function (XHR, TS) { 
			XHR = null;TS = null;
			try{CollectGarbage();}catch(e){};}  
	});
}
</script>

</head>
<body>
   	<div class="table_main margin_top">
		<table class="thead tbody">
			<caption class="thead_function">知识库添加或编辑</caption>
			<tbody>
   			<tr>
				<td>标题:</td>
				<td><input type="text" style="width:300px;" class="text" name="titleName" id="titleName" value="${knowledge.title}"/></td>
			</tr>
			<tr>
				<td class="textFont">内容:</td>
				<td>
				<textarea cols="80" id="content" name="content" rows="40">${knowledge.content}</textarea>
			</tr>
			
			<tr>
				<td colspan="2" align = "right"><input type="hidden" name="id" id="id" value="${knowledge.id}"/><input type="button" class="button" onclick="saveIt();" value="确定" />&nbsp;&nbsp;&nbsp;<input type="button" class="button" value="取消" onclick="closeFrm();"/></td>
			</tr>
			</tbody>
   		</table>
   	</div>
</body>
</html>