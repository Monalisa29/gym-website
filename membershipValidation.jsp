<%@ page import="salaFitnessPackage.TipClient" %>
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
<title>Devino membru</title>
<link rel="stylesheet" href="design.css">
<style>
	.membershipForValidation{
		color: orange;
		border: 1px outset orange;
		width: 260px;
		height: 400px;
		padding: 60px;
		position: absolute;
		top: 14%;
		left: 35%;
		background: rgba(0, 0, 0, 0.9);
	}
</style>
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
	String codTypeClient = request.getParameter("typeClient");
	if(codTypeClient != null)
	{
	 session.setAttribute("typeClient", codTypeClient);
	}
	
	String typeClient = null;
	Sala sala = new Sala();
	List<TipClient> typeClientList = sala.getAllTipClientiLista();
	List<Abonament> membershipList = sala.getAllAbonamenteLista();		
	
	for(TipClient type : typeClientList)
	{
		if(Integer.toString(type.getCodTipClient()).equals(codTypeClient))
		{
			typeClient = type.getDenumire();
		}
	}
	%>
	<div class="membershipForValidation">
	<form action="validationMembershi.jsp">
		<p>Contul</p>
		<p>CNP: <%=session.getAttribute("cnp") %></p>
		<p>Nume: <%=session.getAttribute("fname")%></p>
		<p>Prenume: <%=session.getAttribute("lname")%></p>
		<p>Email: <%=session.getAttribute("email")%></p>
		<p>Numar de telefon: <%=session.getAttribute("teleph")%></p>
		<p>Sex: <%=session.getAttribute("sex")%></p>
		<p>Data nasterii: <%=session.getAttribute("birthDate")%></p>
		<p>Tip client: <%=typeClient%></p>
		
		<input type="submit" value="Creare">
		<br>
		<a href="selectTypeClientForm.jsp">Inapoi</a>	
		<a href="homePageClient.jsp">Anuleaza</a>
		</form>
	</div>
	
</body>
</html>