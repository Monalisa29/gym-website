<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import="salaFitnessPackage.Antrenor" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page language ="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adauga antrenor</title>
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
	String cnp = request.getParameter("cnp");
	String lName = request.getParameter("lname");
	String fName = request.getParameter("fname");
	String email = request.getParameter("email");
	String telephNo = request.getParameter("teleph");
	String sex = request.getParameter("sex");
	String employmentDate = request.getParameter("employmentDate");
	String stare = request.getParameter("stare");
	int stareint = Integer.parseInt(stare);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date parsed = null;
	try{
		parsed = format.parse(employmentDate);
	}
	catch(Exception er)
	{
		er.printStackTrace();
	}	
	
	Sala sala = new Sala();
	Antrenor trainer = new Antrenor();
	
	if(cnp.length() == 13 && email.endsWith("@yahoo.com") && sex != null)
	{
		trainer.setCnp(cnp);
		trainer.setNume(lName);
		trainer.setPrenume(fName);
		trainer.setEmail(email);
		trainer.setNr_telefon(telephNo);
		trainer.setSex(sex);
		trainer.setData_angajarii(parsed);
		trainer.setCodStare(stareint);
		sala.insertAntrenor(trainer);
		%> <p>Adaugare reusita!</p> <%
	}
	else
	{
		%> <p>Adaugare nereusita!</p> <%
	}
	
%>
<p><a href="addTrainerPage.jsp">Inapoi la pagina de adaugare</a></p>
</body>
</html>