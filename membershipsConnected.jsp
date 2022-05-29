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
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="designTable.css">
<style>
	.membership-table{
	color: orange;
	}
</style>
</head>
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