<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>许可协议--值班管理安装向导</title>
<link href="img/style.css" type="text/css" rel="stylesheet"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
function formSubmit() {
	if(document.getElementById('license_agree').checked==false){
		alert('请同意我们的协议');
		return false;
	}
	document.getElementById('license_form').submit();
}

function doRestart(){
	window.location.href="<%=basePath%>install/doRestart.do";
}
</script>
</head>

<body>
<div class="main">
  <table width="980" border="0" align="center" cellpadding="0" cellspacing="0" class="rg-tbg">
    <tr>
      <td height="76" align="center"><h2>3、系统安装完成</h2>
	  <span style="color:#016dd0;">安装系统安装完成，请重启TOMCAT服务。</span>
	  <br /><br />
	  <input type="button" value="立即重启" onclick="doRestart();"/>
	  </td>
    </tr>
  </table>
</div>


</body>
</html>