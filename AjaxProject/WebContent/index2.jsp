<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function register() {
		var $mobile = $("#mobile").val();
		/*
		$.ajax({
			url:"MobileServlet?mobile="+$mobile,
			type:"get",
			success:function(result,testStatus){
				if(result == "true"){
					alert("已存在！注册失败")
				}else {
					alert("注册成功！")
				}
			},
			error:function(xhr,errorMessage,e){
				alert("系统异常")
			}
					
		});
		 */
		/*
		$.post(
			"MobileServlet",
			"mobile="+$mobile,
			function(result){
				if(result == "true"){
					alert("已存在！注册失败")
				}else {
					alert("注册成功！")
				}
			},
			"text"
		);
		 */
		/*
		$.get(
				"MobileServlet?mobile="+$mobile,
				function(result){
					if(result == "true"){
						alert("已存在！注册失败")
					}else {
						alert("注册成功！")
					}
				}
			);
		 */
		/*
		$("#result").load(
				"MobileServlet", 
				"mobile=" + $mobile
			);
		 */
	    //复习json
		//var student = {"name":"zs", "age":23};
		//alert(student.name+"--"+student.age);
		//var students = [
		//		{"name":"zs", "age":23},
		//		{"name":"ls", "age":24},
		//		{"name":"22", "age":27}
		//]
		//alert(students[1].name+"--"+students[1].age);
	
		$.getJSON(
				"MobileServlet",
				{"mobile":$mobile},
				function(result){
					if(result.msg == "true"){
						alert("已存在！注册失败")
					}else {
						alert("注册成功！")
					}
				}
			);
	}
</script>

<title>Ajax on js</title>
</head>
<body>
	手机：
	<input id="mobile" />
	<br />
	<input type="button" value="注册" onclick="register();" />
	<div id="result" boder="1px"></div>
</body>
</html>