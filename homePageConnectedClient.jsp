<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym</title>
</head>
<style>	
	.text-wrapper {
		position: absolute;
		font-style: italic;
		left: 220px;
		top: 550px;
		color: orange;
		font-family: sans-serif;
		font-weight: 700;
		font-size: 40px;
	}
	.contact{
		color: orange;
		position: relative;
		padding-top: 38%;
		padding-left: 88%;
	}
	
	.social-iconFb{
		color: orange;
		position: relative;
		padding-top: 38%;
		padding-left: 96%;
		font-size: 32px;
	}
</style>
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="iconsStyle.css">
<body>
<%if(session.getAttribute("emailCurrentClient") != null){%>
<div class="nav-bar">
		<ul>
			<li><a href="aboutUsConnected.jsp">Despre noi</a></li>
  			<li><a href="homePageConnectedClient.jsp">Acasa</a></li>
  			<li><a href="programClientConn.jsp">Program</a></li>
  			<li><a href="membershipsConnected.jsp">Abonamente</a></li>
  			<li><a href="buyMembershipConnected.jsp">Fa-ti un abonament</a></li>	
  			<li><a href="contClient.jsp">Abonamentele mele</a></li>  
  			<li><a href="logout.jsp">Deconecteaza-te</a></li>  				
		</ul>
	</div>
	<div class="text-wrapper">
		<p>"Don't wish for it,<br> work for it"</p>
	</div>
	
<%}
else
{
	response.sendRedirect("login.jsp");
}
%>
	<p class="contact">Contact us: 0747654321</p>
	<a class="social-iconFb" href="https://www.facebook.com/ONEGYMGalati" target="_blank"><ion-icon name="logo-facebook"></ion-icon></a>
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>