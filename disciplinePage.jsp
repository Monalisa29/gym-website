<%@ page import="salaFitnessPackage.Disciplina" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym</title>
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="designTable.css">
<style>
	.discipline-table{
		color: orange;
	}
</style>
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
<div class="discipline-table">
<%
	
	Sala sala = new Sala();
	List<Disciplina> disciplineList = sala.getAllDisciplineLista();	
	
%>
<a href="addDiscipline.jsp">Adauga disciplina</a>
	<table>
		<tr>
		    <th>Denumire disciplina</th>
		    <th>Descriere disciplina</th>
		    	    
  		</tr>
  		<%for(Disciplina discipline : disciplineList){ %>
  		<tr>
		    <td><%=discipline.getDenumire_clasa()%></td>
		    <% if(discipline.getDescriere() != null) 
		    {
		    	%><td><%=discipline.getDescriere()%></td><% 
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