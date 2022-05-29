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
<%if(session.getAttribute("emailAdmin") != null){%>

<div class="nav-bar">
		<ul>
			<li><a href="aboutUs.jsp">Despre noi</a></li>
  			<li><a href="homePage.jsp">Acasa</a></li>
    		<li><a href="trainerPage.jsp">Antrenori</a></li>
		    <li><a href="membershipPage.jsp">Abonamente</a></li>
		    <li><a href="disciplinePage.jsp">Discipline</a></li>
		    <li><a href="programPage.jsp">Program</a></li>
		    <li><a href="logout.jsp">Deconecteaza-te</a></li>
		</ul>
	</div>

<div class="membership-table">
<%
	
	Sala sala = new Sala();
	List<Abonament> membershipList = sala.getAllAbonamenteLista();
	
%>
<a href="addMembershipPage.jsp">Adauga un abonament</a>
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

<%}
else
{
	response.sendRedirect("login.jsp");
}

%>
</body>
</html>