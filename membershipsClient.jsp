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
<title>Abonamente</title>
<style>
	.membership-table{
	color: orange;
	}
</style>
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="designTable.css">
</head>
<body>
<div class="nav-bar">
		<ul>
			<li><a href="aboutUsForClient.jsp">Despre noi</a></li>
  			<li><a href="homePageClient.jsp">Acasa</a></li> 	
  			<li><a href="programClient.jsp">Program</a></li>		
  			<li><a href="membershipsClient.jsp">Abonamente</a></li>
  			<li><a href="clientFormPage.jsp">Devino membru</a></li>
  			<li><a href="login.jsp">Esti deja membru?</a></li>		    
		</ul>
	</div>
<%
	
	Sala sala = new Sala();
	List<Abonament> membershipList = sala.getAllAbonamenteLista();
%>
<div class="membership-table">
<table>
		<tr>
		    <th>Denumire</th>
		    <th>Pret</th>
		    <th>Tip abonament</th>
		    <th>Descriere abonament</th>
  		</tr>
  		<%for(Abonament abonament : membershipList){ %>
  		<tr>
		    <td><%=abonament.getDenumire()%></td>
		    <td><%=abonament.getPret()%></td>
		    <td><%=abonament.getTip_abonament()%></td>		    
		    <% if(abonament.getDescriere() != null) 
		    {
		    	%><td><%=abonament.getDescriere()%></td><% 
		    }
		    %>	   		    
 		 </tr>
 		 <%
			}
		 %>
  	</table>
</div>
</body>
</html>