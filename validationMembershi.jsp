<%@ page import = "java.util.Date" %>
<%@ page import = "java.security.MessageDigest" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import="salaFitnessPackage.Client" %>
<%@ page import="salaFitnessPackage.Cont" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creare cont</title>
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
			<li><a href="aboutUsForClient.jsp">Despre noi</a></li>
  			<li><a href="homePageClient.jsp">Acasa</a></li>
  			<li><a href="clientFormPage.jsp">Devino membru</a></li>	    
		</ul>
	</div>
<%
	String cnp = (String)session.getAttribute("cnp");
	String lName = (String)session.getAttribute("lname");
	String fName = (String)session.getAttribute("fname");
	String email = (String)session.getAttribute("email");
	String pass = (String)session.getAttribute("password");
	String telephNo = (String)session.getAttribute("teleph");
	String sex = (String)session.getAttribute("sex");
	String birthDate = (String)session.getAttribute("birthDate");
	String typeClient = (String)session.getAttribute("typeClient");
	
	Date parsed = null;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	try
	{
		parsed = format.parse(birthDate);
	}
	catch(Exception er)
	{
		er.fillInStackTrace();
	}
	
	Sala sala = new Sala();
	Client client = new Client();
	Cont acc = new Cont();
	
	//criptare parola
	MessageDigest messageDigest = MessageDigest.getInstance("MD5");
	messageDigest.update(pass.getBytes());
	byte[] resultBytePass = messageDigest.digest();
	StringBuilder sbPass = new StringBuilder();
	for(byte b : resultBytePass)
	{
		sbPass.append(String.format("%02x", b));
	}
			
	if(cnp.length() == 13 && email.endsWith("@yahoo.com") && sex != null)
	{
		acc.setEmail(email);
		acc.setParola(sbPass.toString());
		acc.setTipUtilizator("user");
		acc.setCodStare(1);
		sala.insertCont(acc);
		
		client.setCnp(cnp);
		client.setNume(lName);
		client.setPrenume(fName);
		client.setEmail(email);
		client.setNr_telefon(telephNo);
		client.setSex(sex);
		client.setData_nasterii(parsed);
		client.setCodTipClient(Integer.parseInt(typeClient));
		sala.insertClient(client);		
		
		%> <p>Contul dvs. a fost creat!</p><%
	}
	else
	{
		%> <p>Creare nereusita!</p><%
	}

   request.getSession().removeAttribute("cnp");
   request.getSession().removeAttribute("lname");
   request.getSession().removeAttribute("fname");
   request.getSession().removeAttribute("email");
   request.getSession().removeAttribute("password");
   request.getSession().removeAttribute("teleph");
   request.getSession().removeAttribute("sex");
   request.getSession().removeAttribute("birthDate");
   request.getSession().removeAttribute("typeClient");
%>
<a href="homePageClient.jsp">Inapoi la pagina principala!</a>
</body>
</html>