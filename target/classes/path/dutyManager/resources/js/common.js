/**
 * 验证数字
 * 
 * @param oNum
 * @return
 */
function isNumber(oNum) {
	if (!oNum)
		return false;
	var strP = /^\d+(\.\d+)?$/;
	if (!strP.test(oNum))
		return false;
	try {
		if (parseFloat(oNum) != oNum)
			return false;
	} catch (ex) {
		return false;
	}
	return true;
}
/**
 * 验证IP,可带端口
 * 
 * @param str
 * @return
 */
function isIP(str){
	//不带端口
	var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g 
	if(re.test(str)) 
	{ 
	  if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256) 
		  return true; 
	} 
	//带端口
	re=/^(\d+)\.(\d+)\.(\d+)\.(\d+):(\d+)$/g 
	if(re.test(str)) 
	{ 
	  if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256 && RegExp.$5<65536) 
		  return true;
	}	
	return false;   
}

/**
 * 去除空格
 * 
 */
String.prototype.Trim = function() 
{ 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
} 
String.prototype.LTrim = function() 
{ 
	return this.replace(/(^\s*)/g, ""); 
} 
String.prototype.RTrim = function() 
{ 
	return this.replace(/(\s*$)/g, ""); 
}


Date.prototype.addDay=function(day)
{
    var date=this;
    date.setDate(date.getDate()+(day));
    return date;
}
Date.prototype.format = function(format)   
{   
   var o = {   
     "M+" : this.getMonth()+1, //month   
     "d+" : this.getDate(),    //day   
     "h+" : this.getHours(),   //hour   
     "m+" : this.getMinutes(), //minute   
     "s+" : this.getSeconds(), //second   
     "q+" : Math.floor((this.getMonth()+3)/3), //quarter   
     "S" : this.getMilliseconds() //millisecond   
   }   
   if(/(y+)/.test(format)) format=format.replace(RegExp.$1,   
     (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
   for(var k in o)if(new RegExp("("+ k +")").test(format))   
     format = format.replace(RegExp.$1,   
       RegExp.$1.length==1 ? o[k] :    
         ("00"+ o[k]).substr((""+ o[k]).length));   
   return format;   
}
