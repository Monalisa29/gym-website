<%@ page import="salaFitnessPackage.Abonament" %>
<%@ page import="salaFitnessPackage.Disciplina" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adauga un abonament</title>
<style>
.add-form{
	color: orange;
	border: 1px outset orange;
	width: 330px;
	height: 280px;
	padding: 60px;
	position: absolute;
	top: 24%;
	left: 34%;
	background: rgba(0, 0, 0, 0.9);
}
</style>
<link rel="stylesheet" href="design.css">
</head>
<body>
<%if(session.getAttribute("emailAdmin") != null){%>

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
<div class="add-form">
	<form action="addMembershipPage2.jsp">
  <label for="name">Denumire</label>
  <input type="text" id="name" name="name"><br><br>
  
  <label for="price">Pret</label>
  <input type="text" id="price" name="price"><br><br>
  
  <label for="type">Tip abonament</label>
  <input type="text" id="type" name="type"><br><br>
  
  <label for="description">Descriere</label>
  <input type="text" id="description" name="description"><br><br>
  
  <% Sala sala = new Sala();
 	 List<Disciplina> disciplineList = sala.getAllDisciplineLista(); %>	 
  <label for="disciplineName">Denumire disciplina</label>
  <select name="disciplineName" id="disciplineName">
  <%	  
  for(Disciplina disciplina : disciplineList)
  {
	  %><option value="<%=disciplina.getCod_clasa()%>"><%=disciplina.getDenumire_clasa()%></option><%
  }
  %>
  </select>
<br><br>

  <label for="duration">Durata abonamentului</label>
  <input type="text" id="duration" name="duration"><br><br>

  <input type="submit" value="Adauga">
 
</form>
</div>

<%}
else
{
	response.sendRedirect("login.jsp");
}
%>	
</body>
</html>