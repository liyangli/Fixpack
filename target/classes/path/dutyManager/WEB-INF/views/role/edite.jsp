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
    $(function(){
        //进行异步提交
        $("#baseRole").validate({
            errorElement: "em",
            success: function(em) {
                em.text("ok").addClass("success");//验证通过的动态CSS
            },
            submitHandler:function() {
            	//进行显示进度条
            	showLoading("努力加载中……");
                //异步提交刷新
                $.ajax({
                    type:'post',
                    url:'<%=basePath%>role/editeSave/${pId}/${currentId}',
                    data:$('#baseRole').serialize(),
                    success:function(root){
                        //判断成功或者失败
                        if(root){
                        	alert("恭喜，成功了");
                            window.location.href="<%=basePath%>role/index/${pId}/${currentId}";
                        } else {
                            alert("失败了，请联系管理员");
                        }

                    }
                });
            },
            rules: {
            	roleName: {
                    required: true
                }
            },
            messages: {
            	roleName: {
                    required: "模块名称不能为空",
                }
            }
        });
        //页面加载后应该进行盘点是否进行选中
       /*  var topModels = $('.topModels');
        $.each(topModels,function(index,topModel){
        	 var flag = topModel.checked;
        	 var seconds = $(".second_"+index);
             $.each(seconds,function(i,second){
                 if(flag){
                     $(second).attr("checked",true);
                 }else{
                    $(second).attr("disabled",true);
                 }
                 
             });
        }); */
        
    });
    //当复选框发生改变时
    function setCheckBox(index,check){
    	//是否选中
        var flag = check.checked;
        var seconds = $(".second_"+index);
        $.each(seconds,function(i,second){
        	if(flag){
        		$(second).attr("disabled",false);
        		$(second).attr("checked",true);
        	}else{
        		$(second).attr("disabled",true);
        		$(second).attr("checked",false);
        	}
            
        });
    }
    /**
     * 显示loading画面
     * @param desc
     * @return
     */
    function showLoading(desc) {
    	
    	$("body").append("<div id=\"processingdiv\" style=\"display:none;\"><div class=\"popup\"> <div class=\"popup-body\"><div class=\"loading\"><span>"+desc+"</span></div></div></div></div>");

    }

    /**
     * 关闭loading画面
     * @param desc
     * @return
     */
    function hideLoading() {
    $.closePopupLayer('processing');
    $("#processingdiv").remove();
    }
</script>
</head>
<body>
   <div class="table_main margin_top">
        <form id="baseRole" onsubmit="return false;">
            <input type="hidden" name="id" value="${role.id }"/>
            <table class="thead tbody">
                <caption class="thead_function">添加或者修改</caption>
                <tbody>
                    <tr>
                        <td align="right">角色名：</td>
                        <td><input type="text" name="roleName"
                            value="${role.roleName }" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">描述：</td>
                        <td><input type="text" name="roleDesc"
                            value="${role.roleDesc }"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">权限</td>
                    </tr>
                    <tr>
                        <td>一级导航</td>
                        <td>二级导航</td>
                    </tr>
                    <c:forEach var="topModel" items="${topModels }" varStatus="rs">
                        <tr>
                            <td><c:set var="flag" value="false" />
			                    <c:forEach var="haveModel"
			                            items="${haveModels}">
			                            <c:if test="${haveModel.id eq topModel.id}">
			                                <c:set var="flag" value="true" />
			                            </c:if>
			                    </c:forEach> 
			                    <input type="checkbox" class="topModels" id="topModel_${rs.index }" onclick="setCheckBox('${rs.index}',this)"  <c:if test="${flag}">checked=checked</c:if> name="checkModels"  value="${topModel.id }" />${topModel.name } 
                            </td>
                            <td>
                                <c:forEach var="secondModel" items="${topModel.baseModels }">
                                    <c:if test="${secondModel.visible eq false }">
                                    	<c:set var="flag" value="false" />
		                                <c:forEach var="haveModel"
		                                        items="${haveModels}">
		                                        <c:if test="${haveModel.id eq secondModel.id}">
		                                            <c:set var="flag" value="true" />
		                                        </c:if>
		                                </c:forEach> 
		                                <input type="checkbox" class="second_${rs.index}"  id="second_${rs.index}" <c:if test="${flag}">checked=checked</c:if> name="checkModels"  value="${secondModel.id }" />${secondModel.name }
                                    </c:if>
                                    
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2" align="right"><input type="submit"
                            id="submit" value="确定"  class="button"/>
                            <input type="button" class="button" onclick="javascript:$.fancybox.close();" value="取消"/>
                            </td>
                    </tr>
                </tbody>

            </table>
        </form>
    </div>     
</body>
</html>