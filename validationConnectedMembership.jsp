<%@page import="salaFitnessPackage.Achizitie"%>
<%@ page import="salaFitnessPackage.Abonament" %>
<%@ page import="salaFitnessPackage.Client" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="salaFitnessPackage.TipClient" %>
<%@ page import="java.util.List"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fa-ti un abonament</title>
<link rel="stylesheet" href="design.css">
<style>
	.showNewMembership{
		color: orange;
		border: 1px outset orange;
		width: 200px;
		height: 260px;
		padding: 60px;
		position: absolute;
		top: 23%;
		left: 38%;
		background: rgba(0, 0, 0, 0.9);
	}
</style>
</head>
<body>
<%
	float price = 0;
	float finalPrice = 0;
	float discount = 0;	
	int durationMemb = 0;
	String idClient = null;
	String codClient = null;
	String membership = null;
	
	String emailCurrentClient = (String)session.getAttribute("emailCurrentClient");
	String codMemb = request.getParameter("membershipName");
	String startMembDate = request.getParameter("startMembershipDate");
	
	Date parsedStartMembDate = null;
	Date endDate = null;
	Date formatEndDate = null;
	SimpleDateFormat formatX = new SimpleDateFormat("yyyy-MM-dd");		
	try
	{
		parsedStartMembDate = formatX.parse(startMembDate);
	}
	catch(Exception er)
	{
		er.printStackTrace();
	}		
			
	Sala sala = new Sala();
	List<Abonament> membershipList = sala.getAllAbonamenteLista();
	List<TipClient> typeClientList = sala.getAllTipClientiLista();
	List<Client> clientList = sala.getAllClientiLista();
	
	for(Abonament m : membershipList)
	{
		if(Integer.toString(m.getCod_abonament()).equals(codMemb))
		{
			membership = m.getDenumire();
			price = m.getPret();
			durationMemb = m.getDurataAbonament();
		}
	}	
	
	for(Client client : clientList)
	{
		if(client.getEmail().equals(emailCurrentClient))
		{
			idClient = client.getId_client();
			codClient = Integer.toString(client.getCodTipClient());
		}
	}
	
	for(TipClient type : typeClientList)
	{
		if(Integer.toString(type.getCodTipClient()).equals(codClient))
		{
			discount = type.getDiscount();					
		}
	}
	
	String endDateFormat = null;
	Calendar calendar = Calendar.getInstance(); 
	calendar.setTime(parsedStartMembDate); 
	calendar.add(Calendar.MONTH, durationMemb);
	endDate = calendar.getTime();
	try
	{
		endDateFormat = formatX.format(endDate);
	}
	catch(Exception er)
	{
		er.printStackTrace();
	}	
	
	finalPrice = price - discount * price;
	
	List<Achizitie> achizitieList = sala.getAllAchizitiiLista();
	int verificareAbonament = 0;
	for(Achizitie achizitie : achizitieList)
	{
		if(achizitie.getIdClient() == Integer.parseInt(idClient) && achizitie.getCodAbonament() == Integer.parseInt(codMemb) && parsedStartMembDate.before(achizitie.getDataSfarsitAbo()))
		{
			verificareAbonament = 1;	
		}
	}
	
	if(verificareAbonament == 0)
	{
		%>
		<div class="showNewMembership">
		<form action="saveNewMembership.jsp">		
				<p>Abonamentul: <%=membership %></p>
				<p>Data de inceput: <%=startMembDate %></p>
				<p>Data de sfarsit: <%=endDateFormat %></p>
				<p>Pret fara discount: <%=price %></p>
				<p>Pret final: <%=finalPrice %></p>
				<input type="submit" value="Salveaza">
		<p><a href="homePageConnectedClient.jsp">Renunta</a></p>
		</form>
		</div>
		<%
	}
	else
	{
		%><p style="color:orange;">Aveti acest abonament inca activ!</p>
		<p><a href="homePageConnectedClient.jsp">Inapoi la pagina principala</a></p>
		<%	
	}
	
	if(codMemb != null){
	session.setAttribute("codMemb", codMemb);
	}
	if(idClient != null){
	session.setAttribute("idClient", idClient);
	}
	if(finalPrice != 0){
	session.setAttribute("finalPrice", finalPrice);
	}
	if(startMembDate != null){
	session.setAttribute("startMembDate", startMembDate);
	}
	if(endDate != null){
	session.setAttribute("endDate", endDateFormat);
	}
%>
</body>
</html>