<%@page import="java.time.LocalDateTime"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.time.ZoneId"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import="salaFitnessPackage.Achizitie" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cumpara abonament</title>
<link rel="stylesheet" href="design.css">
<style>
	body{
		color: orange;
	}
</style>
</head>
<body>
<%

String codMemb = (String)session.getAttribute("codMemb");
String idClient = (String)session.getAttribute("idClient");
String startMembDate = (String)session.getAttribute("startMembDate");
String endDate = null;
float finPrice = 0;

Date in = new Date();
LocalDateTime ldt = LocalDateTime.ofInstant(in.toInstant(), ZoneId.systemDefault());
Date o = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());

Date parsedStartDate = null;
Date parsedEndDate = null;
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

try{
	endDate = (String)session.getAttribute("endDate");
}
catch(Exception e)
{
	e.printStackTrace();
}
try
{
	finPrice= Float.parseFloat((String)session.getAttribute("finalPrice"));
}
catch(Exception e)
{
	e.printStackTrace();
}

try
{
	parsedStartDate = format.parse(startMembDate);
}
catch(Exception er)
{
	er.printStackTrace();
}
try
{
	parsedEndDate = format.parse(endDate);
}
catch(Exception er)
{
	er.printStackTrace();
}

Sala sala = new Sala();
Achizitie achizitie = new Achizitie();

try
{
	achizitie.setCodAbonament(Integer.parseInt(codMemb));
	achizitie.setIdClient(Integer.parseInt(idClient));
	achizitie.setPretFinal(finPrice);
	achizitie.setDataInceputAbo(parsedStartDate);
	achizitie.setDataSfarsitAbo(parsedEndDate);
	achizitie.setAchizitie(o);
	
	sala.insertAchizitie(achizitie);
	
	%> <p>Achizitia a fost realizata!</p><%
}
catch(Exception e)
{
	%> <p>Achizitia nu s-a putut realiza!</p><%
}

request.getSession().removeAttribute("codMemb");
request.getSession().removeAttribute("idClient");
request.getSession().removeAttribute("finalPrice");
request.getSession().removeAttribute("startMembDate");
request.getSession().removeAttribute("endDate");
%>
<p><a href="homePageConnectedClient.jsp">Inapoi la pagina principala</a></p>
</body>
</html>