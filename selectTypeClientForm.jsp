<%@ page import="salaFitnessPackage.TipClient" %>
<%@ page import="salaFitnessPackage.Cont" %>
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
.personalData-membership{
	color: orange;
}
.client-data{
	color: orange;
}
.type-client{
	color: orange;
	border: 1px outset orange;
	width: 300px;
	height: 100px;
	padding: 60px;
	position: absolute;
	top: 25%;
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

	String cnp = request.getParameter("cnp");
	String lname = request.getParameter("lname");
	String fname = request.getParameter("fname");
	String email = request.getParameter("email");
	String pass = request.getParameter("password");
	String teleph = request.getParameter("teleph");
	String sex = request.getParameter("sex");
	String birthDate = request.getParameter("birthDate");
	
	int verificareContDublu = 0;
	Sala sala = new Sala();
	List<Cont> contList = sala.getAllConturiLista();
	for(Cont cont : contList)
	{
		if(cont.getEmail().toString().equals(email))
		{
			verificareContDublu = 1;
		}
	}
	
	if(verificareContDublu == 1)
	{
		%><p style="color:orange;">Acest email este deja inregistrat!</p>
		  <a href="clientFormPage.jsp">Inapoi</a>
		<%
	}
	else
	{
	if(cnp != null){
	session.setAttribute("cnp", cnp);
	}
	if(lname != null){
	session.setAttribute("lname", lname);
	}
	if(fname != null){
	session.setAttribute("fname", fname);
	}
	if(email != null){
	session.setAttribute("email", email);
	}
	if(pass != null){
	session.setAttribute("password", pass);
	}
	if(teleph != null){
	session.setAttribute("teleph", teleph);
	}
	if(sex != null){
	session.setAttribute("sex", sex);
	}
	if(cnp != birthDate){
	session.setAttribute("birthDate", birthDate);
	}
%>	

<div class="type-client">
<form action="membershipValidation.jsp">
	<% 	
 	 List<TipClient> typeClientList = sala.getAllTipClientiLista(); %>	 
 	 
  <label for="typeClient">Tip client</label>
  <select name="typeClient" id="typeClient">
	  <%	  
	  for(TipClient typeClient : typeClientList)
	  {
		  %><option value="<%=typeClient.getCodTipClient()%>"><%=typeClient.getDenumire()%></option><%
	  }
	  %>
  </select>
<br><br><br>
	<a href="clientFormPage.jsp">Inapoi</a>
  	<input type="submit" value="Continua">
</form>
</div>
<%} %>
</body>
</html>