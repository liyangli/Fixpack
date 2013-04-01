<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统参数设置--值班管理安装向导</title>
<link href="img/style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
	function formSubmit() {
		if (document.getElementById('dbPassword').value == '') {
			alert("密码不能为空");
			return false;
		}
		document.getElementById('beforeSubmit').style.display = "none";
		document.getElementById('afterSubmit').style.display = "";
	}
	
	function init(){
		var error = document.getElementById("error").value;
		if(error == "true"){
			alert("请核对连接数据库信息，或者联系管理员");
		}
	}
</script>
</head>

<body onload="init();">
<form action="<%=basePath %>/install/install_setup.svl" method="post"
	onsubmit="return formSubmit();">
	<input type="hidden" value="${error }" id="error"/>
	<div class="main">
  <table width="980" border="0" align="center" cellpadding="0" cellspacing="0" class="rg-tbg">
    <tr>
      <td height="76" align="center"><h2>2、系统参数设置（环境要求：jdk1.6或以上、tomcat6.0或以上、oracle11g或以上）</h2>
	  <span style="color:#016dd0;">请设置系统相关参数</span></td>
    </tr>
    <tr>
      <td>
	  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0"
	>
	
	<tr>
		<td align="center" valign="top">
		  <table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" style="border:1px solid #b5b5b5;">
			<tr>
				<td width="30%" height="30" align="right">数据库主机：</td>
				<td width="22%" align="left"><input name="dbHost" type="text"
					class="input" id="dbHost" value="127.0.0.1" /></td>
				<td align="left">数据库的ip地址，如果是本机无需改动</td>
			</tr>
			<tr>
				<td width="30%" height="30" align="right">数据库端口号：</td>
				<td width="22%" align="left"><input name="dbPort" type="text"
					class="input" id="dbPort" value="1521" /></td>
				<td align="left">数据库的端口号，一般无需改动</td>
			</tr>
			<tr>
				<td height="30" align="right">数据库名称：</td>
				<td align="left"><input name="dbName" type="text" class="input"
					id="dbName" value="orcl" /></td>
				<td align="left">&nbsp;</td>
			</tr>
			<tr>
				<td height="30" align="right">数据库用户：</td>
				<td align="left"><input name="dbUser" type="text" class="input"
					id="dbUser" value="duty" /></td>
				<td align="left">&nbsp;</td>
			</tr>
			<tr>
				<td height="30" align="right">数据库密码：</td>
				<td align="left"><input name="dbPassword" type="text"
					class="input" id="dbPassword" /></td>
				<td align="left">安装数据库时输入的密码</td>
			</tr>
			<tr>
				<td height="30" align="right">是否创建表：</td>
				<td align="left"><input type="radio" name="isCreateTable"
					value="true" checked="checked" />是 <input type="radio"
					name="isCreateTable" value="false" />否</td>
				<td align="left">如果您自己手工创建了表，请选否</td>
			</tr>
			<tr>
				<td height="30" align="right">是否初始化数据：</td>
				<td align="left"><input type="radio" name="isInitData"
					value="true" checked="checked" />是 <input type="radio"
					name="isInitData" value="false" />否</td>
				<td align="left">如果您自己手工初始化了数据，请选否</td>
			</tr>
		</table>	  </td>
	</tr>
	<tr>
		<td height="30" align="center"><span
			id="beforeSubmit">
		  <input type="submit" class="regist-submit"
			value=" 提 交 " />
</span> <span id="afterSubmit"
			style="display: none; color: red;">安装需要十几秒的时间，请您耐心等待...</span></td>
	</tr>
</table>
	  </td>
    </tr>
  </table>
</div>

<input type="hidden" name="dbFileName"
	value="/install/db/dutyManagerDB.sql" /> <input type="hidden"
	name="initFileName" value="/install/db/dutyManagerinit.sql" />
</form>
</body>
</html>
