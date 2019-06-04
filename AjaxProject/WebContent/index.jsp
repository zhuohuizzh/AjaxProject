<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function registerGet() {
		var mobile = document.getElementById("mobile").value;
		// js知识 ： 变量前面没有var 代表是全局变量
		xmlHttpRequest = new XMLHttpRequest();
		
		//设置xmlHttpRequest对象的回调函数
		xmlHttpRequest.onreadystatechange = callBack;
		xmlHttpRequest.open("get","MobileServlet?mobile="+mobile,true);
		xmlHttpRequest.send(null);//k=v
	}
	function register() {
		var mobile = document.getElementById("mobile").value;
		// js知识 ： 变量前面没有var 代表是全局变量
		xmlHttpRequest = new XMLHttpRequest();
		
		//设置xmlHttpRequest对象的回调函数
		xmlHttpRequest.onreadystatechange = callBack;
		xmlHttpRequest.open("post","MobileServlet",true);
		//设置post方式的头信息
		xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlHttpRequest.send("mobile="+mobile);//k=v
		//alert("发送请求：参数 mobile="+mobile);
	}
	//定义回调函数(接受 服务端的返回值)
	function callBack(){
		var result = document.getElementById("result");
		if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200){
			//接受服务端返回的数据
			var data = xmlHttpRequest.responseText; //服务端返回值为String格式
			if(data == "true"){
				result.innerHTML = "此号码已存在，请更换！";
			}else {
				result.innerHTML = "注册成功";
			}
		}else {
			result.innerHTML = "正在等待响应/响应有误";
		}
		
	}

</script>
<title>Ajax on js</title>
</head>
<body>
	手机：<input id="mobile"/><br/>
	<input type="button" value="注册" onclick="register();" />
	<div id="result" boder="1px"></div>
</body>
</html>