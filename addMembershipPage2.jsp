<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import="salaFitnessPackage.Abonament" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page language ="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adauga abonament</title>
<style>
	p{
		color: orange;
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
<%
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	String type = request.getParameter("type");
	String description = request.getParameter("description");
	int disciplineName = Integer.parseInt(request.getParameter("disciplineName"));
	int duration = Integer.parseInt(request.getParameter("duration"));
	
	Sala sala = new Sala();
	Abonament membership = new Abonament();
	
	try
	{
		membership.setDenumire(name);
		membership.setPret(price);
		membership.setTip_abonament(type);
		membership.setDescriere(description);
		membership.setCod_disciplina(disciplineName);
		membership.setDurataAbonament(duration);
		
		sala.insertAbonament(membership);
		%> <p>Adaugare reusita!</p> <%
	}
	catch(Exception e)
	{
		%> <p>Adaugare nereusita!</p> <%
	}
%>
<p><a href="addTrainerPage.jsp">Inapoi la pagina de adaugare</a></p>
</body>
</html>