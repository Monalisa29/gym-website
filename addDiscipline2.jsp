<%@ page import="salaFitnessPackage.Disciplina" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adauga disciplina</title>
<link rel="stylesheet" href="design.css">
<style>
	p{
	color: orange;
	}
</style>
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
	String name = request.getParameter("name");
	String description = null;
	if(request.getParameter("description") != null)
	{
		description = request.getParameter("description");
	}
	
	Sala sala = new Sala();
	Disciplina disciplineInsert = new Disciplina();
	
	try
	{
		disciplineInsert.setDenumire_clasa(name);
		if(description != null)
		{
			disciplineInsert.setDescriere(description);
		}
		sala.insertDisciplina(disciplineInsert);
		%><p>Disciplina a fost adaugata!</p><%
	}
	catch(Exception e)
	{
		%><p>Disciplina nu s-a putut adauga!</p><%
	}
	
%>
<p><a href="addDiscipline.jsp">Inapoi la pagina de adaugare</a></p>
</body>
</html>