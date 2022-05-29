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
<title>Fa-ti un abonament</title>
<style>
	.select-membership{
		color: orange;
		border: 1px outset orange;
		width: 330px;
		height: 90px;
		padding: 60px;
		position: absolute;
		top: 35%;
		left: 35%;
		background: rgba(0, 0, 0, 0.9);
	}
</style>
</head>
<link rel="stylesheet" href="design.css">
<body>
<div class="nav-bar">
		<ul>
			<li><a href="aboutUsConnected.jsp">Despre noi</a></li>
  			<li><a href="homePageConnectedClient.jsp">Acasa</a></li>
  			<li><a href="programClientConn.jsp">Program</a></li>
  			<li><a href="membershipsConnected.jsp">Abonamente</a></li>
  			<li><a href="buyMembershipConnected.jsp">Fa-ti un abonament</a></li>	  
  			<li><a href="contClient.jsp">Abonamentele mele</a></li>  
  			<li><a href="logout.jsp">Deconecteaza-te</a></li>    
		</ul>
	</div>
	
<div class="select-membership">
<form action="validationConnectedMembership.jsp">
<% 
	Sala sala = new Sala();
 	List<Abonament> membershipsList = sala.getAllAbonamenteLista(); %>	 
 	 
  <label for="membershipName">Denumire abonament</label>
  <select name="membershipName" id="membershipName">
	  <%	  
	  for(Abonament membership : membershipsList)
	  {
		  %><option value="<%=membership.getCod_abonament()%>"><%=membership.getDenumire()%></option><%
	  }
	  %>
  </select>
  <br>
  <label for="startMembershipDate">Data de inceput a abonamentului</label>
  <input type="date" id="startMembershipDate" name="startMembershipDate" value="2022-05-30"><br> 
  <br>

  <input type="submit" value="Continua">
</form>
</div>

</body>
</html>