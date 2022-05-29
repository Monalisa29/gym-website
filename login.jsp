<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Conecteaza-te</title>
<link rel="stylesheet" href="design.css">
<style>
	body {
		margin: 0;
		background-image: url("images/gym-picture.jpg");
		background-repeat: no-repeat;
		overflow: hidden;
		height: 100%;
	}
	.login{
		color: orange;
		border: 1px outset orange;
		width: 200px;
		height: 150px;
		padding: 60px;
		position: absolute;
		top: 30%;
		left: 35%;
		background: rgba(0, 0, 0, 0.9);
	}
</style>
<script>
	function verifyLoginData()
	{
		var email = document.getElementById('email').value;
		var password = document.getElementById('pass').value;
		if(email == "")
		{
			alert ("Nu ati introdus emailul!");
			document.loginForm.email.focus();
			return false;
		}
		if(password == "")
		{
			alert ("Nu ati introdus parola!");
			document.loginForm.pass.focus();
			return false;
		}		
		else
		{
			document.loginForm.submit();
		}		
	}
</script>
</head>
<body>
<div class="nav-bar">
		<ul>			
  			<li><a href="homePageClient.jsp">Acasa</a></li>  
		</ul>
	</div>

<div class="login">
	<form name="loginForm" action="verifyLoginData.jsp">
		<label for="email">email</label>
  		<input type="text" id="email" name="email"><br><br>
  
	    <label for="pass">parola</label>
	    <input type="password" id="pass" name="pass"><br><br>
	    
	    <input type="button" value="Conectare" onclick="verifyLoginData()">
	</form>	
</div>
</body>
</html>