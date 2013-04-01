<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>排班管理</title>
<script language="javascript" type='text/javascript'
	src="<%=basePath%>resources/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
var havePeoples = "";//选择人员name
var havePeopleIds = "";//选择人员id
$(function(){
	//进行人员选择
	$('#searchPeople').fancybox({
            width  : '400px',
            height : '300px',
            autoSize:false,
            autoScale : false,
            href:'#showUser'
    });
	doSearchPeope();//进行初始化数据
	//自动加载已经选择的项
	
	//增加成功提示
	var msg = $("#msg").val();
	if(msg == 'true'){
		alert("恭喜，操作成功！");
	}
	
	/* $( "#startDate" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        dateFormat:'yy-mm-dd'
    }); */
	
});
//选择人员  设定所有人
function doSearchPeope(){
	var userIds = $(".userId");
	var msg ="";
	var ids ="";
	$.each(userIds,function(i,n){
		
		//选择的人员
		if(n.checked){
			var userName = $(n).attr("showName");
	        msg +=userName+",";
	        
	        var userIds =$(n).val();
	        ids +=$.trim(userIds) +",";
		}
		
	});
	msg = msg.substring(0,msg.length-1);
	ids = ids.substring(0,ids.length-1);
	havePeoples = msg;
	havePeopleIds = ids;
	$("#peoples").val(msg);
	$("#userIds").val(ids);
	//关闭层
	$.fancybox.close();
}

//进行根据分组类型进行页面画
function doCheckType(){
	var type = $("#type").val();
	if(type=="1"){
		//手动
		
		$("#groupType").show();
		$("#contentGroup").html("");
		//进行画组中个人选择
		var groupNum = $("#groupNum").val();
		if(groupNum == '' || groupNum==0){
			alert("请输入组个数");
			$("#type").val("0");
			return;
		}
		for(var i=1;i<=groupNum;i++){
			 $("#contentGroup").html($("#contentGroup").html()+"第"+i+"组:<input type='text' name='groupNames' class=\"text\" readonly=\"readonly\" id=\"groupNames_"+i+"\"/>"+
					"<input type='hidden' name='groupsPeoples' id=\"groupIds_"+i+"\"/>"+
				    "<input type=\"button\" class=\"button\" value='选择' id=\"groupSearchPeople\" onclick='doSearchGroupPeople("+i+")'/></br>");
		}
		
	}else{
		//自动  隐藏div
		$("#groupType").hide();
	}
}
//每组中选择人员
function doSearchGroupPeople(index){
	//进行根据选择的总人数进行画出来，然后进行选择
	//根据index进行选择对应属于哪个组对应的人。
	if(havePeoples == ""){
		alert("还没有选择要分组的人员，请选择要分组的人员");
		return;
	}
	//进行设定showGroupUser Div中数据
	var divContent = "<tr id=\"groupUserRm\"><td>";
	
	var haveIds = havePeopleIds.split(",");
	var checkId = $("#groupIds_"+index).val();
	var checkIds = checkId.split(",");
	$.each(havePeoples.split(","),function(i,n){
		//进行循环增加对应显示数据
		var num = $.inArray(haveIds[i],checkIds);
		var input = "";
		if(num >-1){
			input = "<input type=\"checkbox\" class='groupUserCheck' checked='checked' showName='"+n+"' value='"+haveIds[i]+"'/>";
		}else{
			input = "<input type=\"checkbox\" class='groupUserCheck' showName='"+n+"' value='"+haveIds[i]+"'/>";
		}
		
		divContent += input+n+"&nbsp;";
		if((i+1)%5==0){
			divContent += "</td></tr><tr id=\"groupUserRm\"><td>"
		}
	});
	divContent +="</td></tr><tr id=\"groupUserRm\"><td colspan='5' align=\"right\">";
	divContent +="<input type=\"button\" class=\"button\"  value=\"确认\" onclick=\"doSearchGroupPeope("+index+");\"/></td></tr>";
	//进行删除之前设定项
	$("#groupUserTD").empty();
	$("#groupUserTD").append(divContent);
	
	$.fancybox({
        width  : '400',
        height : '300',
        autoSize:false,
        autoScale : false,
        href:'#showGroupUser'
      });
}
//每组选择的人员
function doSearchGroupPeope(index){
	//需要判断已经选择的进行从总数中进行删除，目前不做
	var groupUser = $(".groupUserCheck");
	var ids="";
	var msg = "";
	$.each(groupUser,function(i,n){
		//选择的人员
        if(n.checked){
            var userName = $(n).attr("showName");
            msg +=userName+",";
            
            var userIds =$(n).val();
            ids +=$.trim(userIds) +",";
        }
	});
	msg = msg.substring(0,msg.length-1);
    ids = ids.substring(0,ids.length-1);
	$("#groupNames_"+index).val(msg);
	$("#groupIds_"+index).val(ids);
	//关闭层
    $.fancybox.close();
}


//每天值班日志个数
function doDutyNum(){
	var dutyNum = $("select[name='dutyNum']").val();
	//移除所有设定的日期
	$("#dayDuty").empty();
	var msg = "";
	for(var i=0;i<dutyNum;i++){
		msg +="<input type=\"text\" onclick=\"WdatePicker({dateFmt:'HH:mm',isShowClear:false})\" name=\"startTime\"/>至"+
        "<input type=\"text\" onclick=\"WdatePicker({dateFmt:'HH:mm',isShowClear:false})\" name=\"endTime\" /><br/>";
	}
	$("#dayDuty").append(msg);
}

//全选所有用户
function doCheck(check){
	if($(check).attr("checked")){
		//选中
		$(".userId").each(function(){
			$(this).attr("checked",true);
		});
	}else{
		//全部取消
		$(".userId").each(function(){
			$(this).attr("checked",false);
		});
	}
}
//进行提交时验证
function doAnnange(){
	var peopleNum = $("input[name='peopleNum']").val();
	if($.trim(peopleNum) == ""){
		alert("组人员个数不能为空");
		return false;
	}
	var groupNum =$("#groupNum").val();
	if($.trim(groupNum) == ""){
		alert("组个数不能为空");
		return false;
	}
	
	var userIds = $("#userIds").val();
	var uids = userIds.split(",");
	
	var len = uids.length;
	if(len < (parseInt(peopleNum)*parseInt(groupNum))){
		//选中的成绩必须小于总人数
		alert("选中组和每组人员个数乘积必须小于总人数");
		return false;
	}
	
	
	var type = $("#type").val();
	var flag = true;
	if(type=="1"){
		//如果是手动方式必须每组选中对应人员
		$("input[name='groupNames']").each(function(){
			if($.trim($(this).val())==""){
				flag = false;
				return flag;
			}
		});
		if(!flag){
			alert("手动方式进行设定，所有组不能为空");
			return false;
		}
	}
	
	//值班日期进行判断
	var startDate = $("#startDate").val();
	if($.trim(startDate) == ""){
		alert("请选择开始执行日期");
		return false;
	}
	
	
	var dutyNum = $("select[name='dutyNum']").val();
	if($.trim(dutyNum)=="0"){
		alert("请选择每天排班设定个数");
		return false;
	}
	
	//判断是否选中了安装指定时间，如果选中了，必须验证对应段中时间均不能为空
	$("input[name='startTime']").each(function(){
		//开始时间均不能为空	
		if($.trim($(this).val()) == ""){
			flag = false;
			return false;
		}
	});
	if(!flag){
		alert("每天排班中，不能含有空的开始时间");
		return false;
	}
	$("input[name='endTime']").each(function(){
		//接受时间均不能为空
		if($.trim($(this).val()) == ""){
			flag = false;
			return false;
		}
	});
	if(!flag){
		alert("每天排班中，不能含有空的结束时间");
		return false;
	}
	return true;
}
</script>
</head>
<body>
    <div class="table_main margin_top">
        <input type="hidden" id="msg" value="${msg }"/>
        <form id="baseUser" action="<%=basePath %>arrange/saveDuty/${pId}/${currentId}" onsubmit="return doAnnange();" method="post">
            <table class="thead tbody" >
                
                <tbody >
                    <tr>
                        <td align="right">选择人员：</td>
                        <td>
                            <input type="hidden" name="userIds" id="userIds" value="${arrange.userIds }" />
                            <input type="text" name="users" id="peoples" value="${arrange.userNames }" class="text" readonly="readonly"/><input type="button" class="button"  value="请选择" id="searchPeople" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">组人员个数：</td>
                        <td>
                            <input type="text" name="peopleNum" value="${arrange.peopleNum }" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onkeypress="this.value=this.value.replace(/[^\d]/g,'') "/> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right">组个数：</td>
                        <td>
                            <input type="text" id="groupNum" name="groupNum" value="${arrange.groupNum }" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onkeypress="this.value=this.value.replace(/[^\d]/g,'') "/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">分组方式：</td>
                        <td>
                            <select name="type" onChange="doCheckType();" id="type" >
					            <option value="0" <c:if test="${arrange.type==0 }">selected="selected"</c:if>>自动</option>
					            <option value="1" <c:if test="${arrange.type==1 }">selected="selected"</c:if>>手动</option>
					        </select>
                        </td>
                    </tr>
                    <tr id="groupType">
                        <td colspan="2" id="contentGroup">
                            <!-- 显示对应组信息 -->
                            <c:forEach var="group" items="${arrange.groups }" varStatus="vs">
                                ${group.groupName }:
                                <c:set var="names"/>
                                <c:set var="ids"/>
                                <c:forEach var="baseUser" items="${group.users }">
                                   <%-- ${baseUser.loginName } &nbsp; --%>
                                   <c:choose>
                                   		<c:when test="${names eq \"\" }">
                                   			<c:set var="names" value="${baseUser.loginName } "/>
                                   			<c:set var="ids" value="${fn:trim(baseUser.id)}"/>
                                   		</c:when>
                                   		<c:otherwise>
                                   			<c:set var="names" value="${names},${baseUser.loginName } "/>
                                   			<c:set var="ids" value="${fn:trim(ids)},${fn:trim(baseUser.id)}"/>
                                   		</c:otherwise>
                                   </c:choose>
                                  <%--  <c:if test="${names eq \"\" }">
                                   		<c:set var="names" value="${baseUser.loginName } "/>
                                   		<c:set var="ids" value="${baseUser.id } "/>
                                   </c:if>
                                   <c:if test="${names ne \"\" }">
                                   		<c:set var="names" value="${names},${baseUser.loginName } "/>
                                   		<c:set var="ids" value="${ids},${baseUser.id } "/>
                                   </c:if> --%>
                                   
                                </c:forEach>
                                <c:set var="len" value="${fn:length(names)} "/>
                                <c:set var="idLen" value="${fn:length(ids)} "/>
                                <input type="text" name='groupNames' value="${names}" class="text" readonly="readonly" id="groupNames_${vs.index }"/>
								<input type='hidden' name='groupsPeoples' value="${ids }" id="groupIds_${vs.index }"/>
                                <input type="button" class="button"  value='选择' id="groupSearchPeople" onclick="doSearchGroupPeople(${vs.index });"/>
                                <br/>
                            </c:forEach>
                            
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="right">每天班次个数：</td>
                        <td>
                            <select name="dutyNum" onchange="doDutyNum();">
                                <option value=0>选择</option>
					            <option value="1" <c:if test="${arrange.dutyNum==1 }">selected="selected"</c:if>>1</option>
					            <option value="2" <c:if test="${arrange.dutyNum==2 }">selected="selected"</c:if>>2</option>
					            <option value="3" <c:if test="${arrange.dutyNum==3 }">selected="selected"</c:if>>3</option>
					            <option value="4" <c:if test="${arrange.dutyNum==4 }">selected="selected"</c:if>>4</option>
					            <option value="5" <c:if test="${arrange.dutyNum==5 }">selected="selected"</c:if>>5</option>
					            <option value="6"<c:if test="${arrange.dutyNum==6 }">selected="selected"</c:if>>6</option>
					        </select>
                         </td>
                    </tr>
                    <tr>
                        <td align="right">开始日期：</td>
                        <td>
                            <%-- <input type="text" id="startDate" name="startDate" value="${arrange.startDate }" readonly="readonly"/> --%>
                            <input type="text" id="startDate" name="startDate" value="${arrange.startDate }"
                             onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false})"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">每天班次:</td>
                        <td id="dayDuty">
                            <c:forEach var="dayDuty" items="${arrange.dayDutys }">
                                 <input type="text" name="startTime" onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false})" value="${dayDuty.startTime }"/>至
                                 <input type="text" name="endTime" onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false})" value="${dayDuty.endTime }"/>
                                 <br/>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" ><pre>
                                                                                                                                             <input type="submit"
                            id="submit" class="button"  value="确定"  /><input type="reset" onclick="window.location.reload();"
                            id="button" class="button"  value="取消"  /></pre>
                            </td>
                    </tr>
                </tbody>

            </table>
        </form>
    </div>
    <!-- 显示所有用户选择 -->
    <div id="showUser" style="display:none">
        <!-- 显示要选择的人员 -->
        <table class="thead tbody">
                <caption class="thead_function">人员选择</caption>
                <tbody>
                    <tr>
                        <td colspan="2">
                        <c:forEach var="baseUser" items="${baseUsers }" varStatus="rs">
                                <c:set var="flag" value="false"/>
                                <c:forEach var="hu" items="${arrange.users }">
                                    <c:if test="${hu.id eq baseUser.id }">
                                        <c:set var="flag" value="true"/>
                                    </c:if>
                                </c:forEach>
                                <input type="checkbox" <c:if test="${flag }">checked="checked"</c:if> name="userId" class="userId" showName="${baseUser.loginName }" value="${baseUser.id }"/>
                                ${baseUser.loginName }
                                <c:if test="${(rs.index+1)%5==0 }">
                                   </td></tr><tr><td colspan="2">
                                </c:if>
                            
                        </c:forEach>
                         </td>
                    </tr>
                    
                    <tr>
                    	
                        <td>
                        <input type="checkbox" onclick="doCheck(this);"/>全选
                        </td>
                        <td align="right">
                        	<input type="button" class="button"  value="确认" onclick="doSearchPeope();"/>
                        </td>
                    </tr>
                </tbody>

            </table>
    </div>
    
    <!-- 显示所有用户选择 -->
    <div id="showGroupUser" style="display:none">
        <!-- 显示要选择的人员 -->
        <table class="thead tbody">
                <caption class="thead_function">人员选择</caption>
                <tbody id="groupUserTD">
                    
                    
                </tbody>

            </table>
    </div>
</body>
</html>