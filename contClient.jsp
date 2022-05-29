<%@page import="salaFitnessPackage.Sala"%>
<%@page import="salaFitnessPackage.Abonament"%>
<%@page import="salaFitnessPackage.Client"%>
<%@page import="salaFitnessPackage.Achizitie"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Abonamentele mele</title>
<link rel="stylesheet" href="design.css">
<link rel="stylesheet" href="designTable.css">
<style>
	.abonamente-client{
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
	List<Client> clientList = sala.getAllClientiLista();
	List<Achizitie> achizitieList = sala.getAllAchizitiiLista();
	List<Abonament> abonamentlist = sala.getAllAbonamenteLista();
	
	String emailClient = (String)session.getAttribute("emailCurrentClient");
	int idClient = 0;
	
	for(Client client : clientList)
	{
		if(client.getEmail().equals(emailClient))
		{
			idClient = Integer.parseInt(client.getId_client());
		}
	}
%>

<div class="abonamente-client">
<form>
	<table>
		<tr>
		    <th>Abonament</th>		    
		    <th>Data de inceput a abonamentului</th>
		    <th>Data de sfarsit a abonamentului</th>
		    <th>Pretul la achizitie</th>
		    <th>Data de achizitie a abonamentului</th>
  		</tr>  		 		  	
  			<%for(Achizitie achizitie : achizitieList) {%>
  			<tr>
  				<%if(achizitie.getIdClient() == idClient)
  				{
  					for(Abonament abonament : abonamentlist)
  					{
  						if(abonament.getCod_abonament() == achizitie.getCodAbonament())
  						{
  							%><td><%=abonament.getDenumire() %></td><%
  						}
  					} 					
  					%><td><%=achizitie.getDataInceputAbo()%></td><%
  					%><td><%=achizitie.getDataSfarsitAbo()%></td><%
  					%><td><%=achizitie.getPretFinal()%></td><%
  					%><td><%=achizitie.getAchizitie()%></td><%
  				} 				
  			%></tr>
  			<%}%>			    
	</table>
</form>
</div>

</body>
</html>