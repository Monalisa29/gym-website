<%@page import="salaFitnessPackage.Sala"%>
<%@page import="salaFitnessPackage.Stare"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym</title>
<style>
	.add-form{
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
<link rel="stylesheet" href="design.css">
</head>
<body>
<div class="nav-bar">
		<ul>
			<li><a href="aboutUs.jsp">Despre noi</a></li>
  			<li><a href="homePage.jsp">Acasa</a></li>
    		<li><a href="trainerPage.jsp">Antrenori</a></li>
		    <li><a href="membershipPage.jsp">Abonamente</a></li>
		    <li><a href="disciplinePage.jsp">Discipline</a></li>
		    <li><a href="programPage.jsp">Program</a></li>
		</ul>
</div>
<%
	Sala sala = new Sala();
	List<Stare> stareList = sala.getAllStareLista();
	%>
<div class="add-form">
	<form name = "form" action="addTrainerPage2.jsp">
  <label for="cnp">CNP</label>
  <input type="text" id="cnp" name="cnp"><br><br>
  
  <label for="lname">Nume</label>
  <input type="text" id="lname" name="lname"><br><br>
  
  <label for="fname">Prenume</label>
  <input type="text" id="fname" name="fname"><br><br>
  
  <label for="email">Email</label>
  <input type="text" id="email" name="email"><br><br>
  
  <label for="telph">Numar de telefon</label>
  <input type="text" id="teleph" name="teleph"><br><br>
  
  <p>Gen</p>
  <input type="radio" id="fem" name="sex" value="F">
  <label for="fem">Feminin</label><br>

  <input type="radio" id="masc" name="sex" value="M">
  <label for="masc">Masculin</label><br>

  <label for="employmentDate">Data angajarii</label>
  <input type="date" id="employmentDate" name="employmentDate" value="2010-01-01"><br>

  <label for="stare">Stare antrenor</label>
  <select name="stare" id="stare">
  <%	  
  for(Stare stare : stareList)
  {
	  %><option value="<%=stare.getCodStare()%>"><%=stare.getDenumire()%></option><%
  }
  %>
  </select>
	<br>

  <input type="button" value="Adauga" onclick="validateForm()">
 
</form>
</div>
</body>
</html>