<%@ page import="salaFitnessPackage.Abonament" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fa-ti un abonament</title>
<link rel="stylesheet" href="design.css">
<style>
.personalData-membership{
	color: orange;
}
.client-data{
	color: orange;
	border: 1px outset orange;
		width: 300px;
		height: 380px;
		padding: 60px;
		position: absolute;
		top: 18%;
		left: 35%;
		background: rgba(0, 0, 0, 0.9);
}
</style>
<script>
	function validateForm(){
		var cnp = document.getElementById('cnp').value;
		var lname = document.getElementById('lname').value;
		var fname = document.getElementById('fname').value;
		var email = document.getElementById('email').value;
		var teleph = document.getElementById('teleph').value;
		var sex = document.getElementsByName('sex').value;
		
		if(cnp.length != 13)
			{
				alert ("CNP-ul trbuie sa aiba 13 cifre!");
				document.form.CNP.focus();
				return false;
			}
		if(lname == "")
			{
				alert ("Nu ati completat numele!");
				document.form.lname.focus();
				return false;
			}
		if(fname == "")
		{
			alert ("Nu ati completat prenumele!");
			document.form.fname.focus();
			return false;
		}
		if(email == "")
		{
			alert ("Nu ati completat email-ul!");
			document.form.email.focus();
			return false;
		}
		if(teleph == "")
		{
			alert ("Nu ati completat numarul de telefon!");
			document.form.teleph.focus();
			return false;
		}
		 if (document.querySelectorAll('input[type="radio"]:checked').length === 0) 
		{
			alert("Nu ati selectat sexul!");
			document.form.teleph.focus();
			return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
<div class="nav-bar">
		<ul>
			<li><a href="aboutUsForClient.jsp">Despre noi</a></li>
  			<li><a href="homePageClient.jsp">Acasa</a></li>
  			<li><a href="programClient.jsp">Program</a></li>
  			<li><a href="membershipsClient.jsp">Abonamente</a></li>
  			<li><a href="clientFormPage.jsp">Devino membru</a></li>	 
  			<li><a href="login.jsp">Esti deja membru?</a></li>   
		</ul>
	</div>
	
<div class="client-data">
<form name="form" action="selectTypeClientForm.jsp">
	<label for="cnp">CNP</label>
  <input type="text" id="cnp" name="cnp" value="<%=session.getAttribute("cnp") != null?session.getAttribute("cnp"):""%>"><br><br>
  
  <label for="lname">Nume</label>
  <input type="text" id="lname" name="lname" value="<%=session.getAttribute("lname")!= null?session.getAttribute("lname"):""%>"><br><br>
  
  <label for="fname">Prenume</label>
  <input type="text" id="fname" name="fname" value="<%=session.getAttribute("fname")!= null?session.getAttribute("fname"):""%>"><br><br>
  
  <label for="email">Email</label>
  <input type="text" id="email" name="email" value="<%=session.getAttribute("email")!= null?session.getAttribute("email"):""%>"><br><br>
  
  <label for="password">Parola</label>
  <input type="password" id="password" name="password" value="<%=session.getAttribute("password")!= null?session.getAttribute("password"):""%>"><br><br>
  
  <label for="teleph">Numar de telefon</label>
  <input type="text" id="teleph" name="teleph" value="<%=session.getAttribute("teleph")!= null?session.getAttribute("teleph"):""%>"><br><br>
  
  <p>Gen</p>
  <input type="radio" id="fem" name="sex" value="F">
  <label for="fem">Feminin</label><br>

  <input type="radio" id="masc" name="sex" value="M">
  <label for="masc">Masculin</label><br>

  <label for="employmentDate">Data nasterii</label>
  <input type="date" id="birthDate" name="birthDate" value="<%=session.getAttribute("birthDate")!= null?session.getAttribute("birthDate"):"2020-01-01"%>"><br>
  
  <input type="button" value="Continua" onclick="validateForm()">
</form>
</div>
</body>
</html>