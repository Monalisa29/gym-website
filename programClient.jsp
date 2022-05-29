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
<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
<meta charset="ISO-8859-1">
<title>Program</title>
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="designTable.css">
<style>
	.program{
		color: orange;
	}
</style>
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
	List<Sedinta> sedintaList = sala.getAllSedinteLista();	
	List<Disciplina> disciplineList = sala.getAllDisciplineLista();
	List<Antrenor> trainerList = sala.getAllAntrenoriLista();
%>
<div class="program">
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
</body>
</html>