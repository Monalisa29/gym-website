<%@ page import="salaFitnessPackage.Antrenor" %>
<%@ page import="salaFitnessPackage.ConexiuneDB" %>
<%@ page import="salaFitnessPackage.Sala" %>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sterge antrenor</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("trainerId"));
	Sala sala = new Sala();
	Antrenor trainer = new Antrenor();
	List<Antrenor> trainerList = sala.getAllAntrenoriLista();
	
	for(Antrenor t : trainerList)
	{
		if(t.getId_antrenor() == id)
		{
			trainer.setId_antrenor(id);
			trainer.setCnp(t.getCnp());
			trainer.setNume(t.getNume());
			trainer.setPrenume(t.getPrenume());
			trainer.setEmail(t.getEmail());
			trainer.setNr_telefon(t.getNr_telefon());
			trainer.setSex(t.getSex());
			trainer.setData_angajarii(t.getData_angajarii());
			trainer.setCodStare(2);
			sala.updateAntrenor(trainer);
			response.sendRedirect("trainerPage.jsp");
		}
	}
%>
</body>
</html>