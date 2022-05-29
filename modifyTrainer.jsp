<%@page import="salaFitnessPackage.Stare"%>
<%@ page import="salaFitnessPackage.Antrenor" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifica antrenor</title>
<style>
	.modify-form{
		color: orange;
		border: 1px outset orange;
		width: 300px;
		height: 450px;
		padding: 35px;
		position: absolute;
		top: 18%;
		left: 35%;
		background: rgba(0, 0, 0, 0.9);
	}
</style>
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

<div class="modify-form">
	<form action="modifyTrainer2.jsp">
	<%	
	Sala sala = new Sala();
	List<Antrenor> trainerList = sala.getAllAntrenoriLista();
	List<Stare> stareList = sala.getAllStareLista();
	String sex;
	int id = 0;
	
	try
	{
		 id = Integer.parseInt(request.getParameter("trainerId"));
	}
	catch(Exception er)
	{
		er.printStackTrace();
	}
	
	for(Antrenor antrenor : trainerList)
	{ 
		if(antrenor.getId_antrenor() == id)
		{
			sex = antrenor.getSex();
	%>
  <input type="hidden" id="id" name="id" value="<%=antrenor.getId_antrenor()%>"><br><br>

  <label for="cnp">CNP</label>
  <input type="text" id="cnp" name="cnp" value="<%=antrenor.getCnp()%>"><br><br>
  
  <label for="lname">Nume</label>
  <input type="text" id="lname" name="lname" value="<%=antrenor.getNume()%>"><br><br>
  
  <label for="fname">Prenume</label>
  <input type="text" id="fname" name="fname" value="<%=antrenor.getPrenume()%>"><br><br>
  
  <label for="email">Email</label>
  <input type="text" id="email" name="email" value="<%=antrenor.getEmail()%>"><br><br>
  
  <label for="telph">Numar de telefon</label>
  <input type="text" id="teleph" name="teleph" value="<%=antrenor.getNr_telefon()%>"><br><br>
  
  <p>Gen</p>
  <input type="radio" id="fem" name="sex" value="F" <%if(sex.equals("F")){%>checked="checked"<%} %>>
  <label for="fem">Feminin</label><br>

  <input type="radio" id="masc" name="sex" value="M" <%if(sex.equals("M")){%>checked="checked"<%}%>>
  <label for="masc">Masculin</label><br>

  <label for="employmentDate">Data angajarii</label>
  <input type="date" id="employmentDate" name="employmentDate" value="<%=antrenor.getData_angajarii()%>"><br> 
    
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
<br>
<%	}
    } %>
  <input type="submit" value="Modifica">
</form>
</div>
</body>
</html>