<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.btn-round-lg{

border-radius: 22.5px;
}
.btn-round{
border-radius: 17px;
}
.btn-round-sm{
border-radius: 15px;
}
.btn-round-xs{
border-radius: 11px;
padding-left: 10px;
padding-right: 10px;
}


.button4 {border-radius: 12px;}

</style>
<body>
<div style = "background-image:url(images/adminlogin.jpg);margin:0 auto;max-width:100%;max-height:100%;height:754px; width:1003px;">
	<div style="margin-left:140px;">
	
	<input type = "text" name="name" id = "name" class="name" required="" placeholder = "Username" style = "height:30px;width:330px;background-color:white;margin-top:298px;border-style:hidden;"></br></br>
	<input type = "password" name="password" id = "pass" class="pass" required="" placeholder = "Password" style = "height:25px;width:330px;background-color:white;border-style:hidden;">
	<br><br>
	<input type = "checkbox" name = "show" style = "height:19px;width:19px;margin-top:5px;">
	<br>
	<br>
	<!-- <img src = "images/submit.jpg" style="height:52px;width:263px; margin:20px" /> -->
	<button type="button" onclick = "s()" style="background: url(images/submit.jpg) no-repeat; background-size: 100% 100%;  border:none;height:52px;width:263px; margin:20px;" class="btn btn-primary btn-round-sm btn-sm"></button>
	<script>
	function s()
	{
		var name = document.getElementById("name").value;
		var password = document.getElementById("pass").value;
		window.location="loginCheck.jsp?name="+name+"&password="+password;
	}
	</script>
	</div>
</div>
</body>
</html>