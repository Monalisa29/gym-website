<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="salaFitnessPackage.Sedinta" %>
<%@ page import="salaFitnessPackage.Antrenor" %>
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
<title>Program</title>
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="designTable.css">
<style>
	.program-table
	{
		color: orange;
	}	
</style>
<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
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
<%
	
	Sala sala = new Sala();
	List<Sedinta> sedintaList = sala.getAllSedinteLista();	
	List<Disciplina> disciplineList = sala.getAllDisciplineLista();
	List<Antrenor> trainerList = sala.getAllAntrenoriLista();
%>
<div class="program-table">
	<table class = "sortable">
		<tr>
		    <th>Numar sala</th>
		    <th>Disciplina</th>
		    <th>Antrenor</th>
		    <th>Ziua</th>
		    <th>Ora</th>
  		</tr>
  		<%for(Sedinta sedinta : sedintaList){ %>
  		<tr>
		    <td><%=sedinta.getCodSala()%></td>
		    <%for(Disciplina discipline : disciplineList){ 
		    	if(Integer.parseInt(discipline.getCod_clasa()) == sedinta.getCodDisciplina()){
				    %><td><%=discipline.getDenumire_clasa()%></td>
			<%	}} %>
			 <%for(Antrenor trainer : trainerList){ 
		    	if(trainer.getId_antrenor() == sedinta.getIdAntrenor()){
				    %><td><%=trainer.getNume() + " " + trainer.getPrenume()%></td>
			<%	}} %>
				    <td><%=sedinta.getZiua()%></td>	
				    <td><%=sedinta.getOra()%></td>				    		    	  		
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