<%@ page import = "java.security.MessageDigest" %>
<%@page import="salaFitnessPackage.Cont"%>
<%@page import="java.text.ParseException"%>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Conecteaza-te</title>
<link rel="stylesheet" href="design.css">
<style>
	body{
		color: orange;
	}
</style>
</head>
<body>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("pass");
	Sala sala = new Sala();
	List<Cont> accountList = sala.getAllConturiLista();
	int verificare = 0;
	
	//criptare parola
	MessageDigest messageDigest = MessageDigest.getInstance("MD5");
	messageDigest.update(password.getBytes());
	byte[] resultBytePass = messageDigest.digest();
	StringBuilder sbPass = new StringBuilder();
	for(byte b : resultBytePass)
	{
		sbPass.append(String.format("%02x", b));
	}
	
	for(Cont account : accountList)
	{
		if(account.getEmail().equals(email) && account.getParola().equals(password) && account.getTipUtilizator().equals("admin"))
		{
			String emailAdmin = request.getParameter("email");
			if(emailAdmin != null){
				session.setAttribute("emailAdmin", emailAdmin);
			}
			%><p><meta http-equiv="refresh" content="0; url=homePage.jsp"></p><%
		}
		else if(account.getEmail().equals(email) && account.getParola().equals(sbPass.toString()) && account.getTipUtilizator().equals("user") && account.getCodStare() == 1)
		{		
			String emailCurrentClient = request.getParameter("email");
			if(emailCurrentClient != null){
				session.setAttribute("emailCurrentClient", emailCurrentClient);
			}
			%><p><meta http-equiv="refresh" content="0; url=homePageConnectedClient.jsp"></p><%
		}
		else
		{			
			verificare = 1;
		}
	}

	if(verificare == 1)
	{
		%><p>Date de conectare invalide!</p>
		  <a href="login.jsp">Inapoi la pagina de conectare</a><% 
    }
	
%>
</body>
</html>