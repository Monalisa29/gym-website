<%@ page import="salaFitnessPackage.Antrenor" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="salaFitnessPackage.Stare" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
<meta charset="ISO-8859-1">
<title>Antrenori</title>
<style>	
	.trainers-table {
		color: orange;
	}	
</style>
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="designTable.css">
<script>
	function deleteFunction(id){
		var result = confirm("Sigur doriti sa stergeti acest antrenor?");
		if(result == true){
			document.formular.trainerId.value = id;
			document.formular.action = "deleteTrainer.jsp";
			document.formular.submit();			
		}		
		else
		{
			return false;
		}
	}
	function modifyFunction(id){
			document.formular.trainerId.value = id;
			document.formular.action = "modifyTrainer.jsp";
			document.formular.submit();	
	}

</script>
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

<div class="trainers-table">
<form name = "formular">
<%
	
	Sala sala = new Sala();
	List<Antrenor> trainerList = sala.getAllAntrenoriLista();	
	List<Stare> stareList = sala.getAllStareLista();
	
%>
<a href="addTrainerPage.jsp">Adauga un antrenor</a>
	<table class = "sortable">
		<tr>
		    <th>Nume</th>
		    <th>Email</th>
		    <th>Numar de telefon</th>
		    <th>Stare antrenor</th>
		    <th>Modificare</th>
		    <th>Stergere</th>	    
  		</tr>
  		<%for(Antrenor antrenor : trainerList){ %>
  		<tr>  		
		    <td><%=antrenor.getNume()%></td>
		    <td><%=antrenor.getEmail()%></td>
		    <td><%=antrenor.getNr_telefon()%></td>	
		    <%
		    	for(Stare stare : stareList)
		    	{
		    		if(stare.getCodStare() == antrenor.getCodStare())
		    		{
		    			%><td><%=stare.getDenumire()%></td><%
		    		}
		    	}
		    %>		    
		    <td><input value="Modifica" type="button" onclick="modifyFunction('<%=antrenor.getId_antrenor()%>')"></td>		    
		    <td><input value="Sterge" type="button" onclick="deleteFunction('<%=antrenor.getId_antrenor()%>')" ></td>			    	
		    <%
  			}
		 %>	
		 
 		 </tr>  		 
  	</table>	
  	<input type="hidden" id="trainerId" name="trainerId" value=""> 
</form>
</div>
<%}
else
{
	response.sendRedirect("login.jsp");
}

%>	
</body>
</html>