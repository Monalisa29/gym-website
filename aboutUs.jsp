<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym</title>
<style>	
	.description-text {
		position: absolute;
		left: 100px;
		top: 300px;
		width: 400px;
		height: 320px;
		font-family: sans-serif;
		font-weight: 500;
		font-size: 20px;
		border: 3px solid orange;
		color: orange;
		padding: 25px;	
		text-indent: 50px;
		background-color: black;
		opacity: 0.8;
		line-height: 26px;
	}	
</style>
<link rel="stylesheet" href="design.css">
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
	<div class="description-text">
		<p>Gym este un brand cu o viziune inovatoare asupra serviciilor de Fitness. Cu activitati inedite si peste 20 programe de fitness, 
		în cadrul caruia totul corespunde standardelor internationale. La demararea proiectului au fost implicati specialisti din fitness consulting, care au reusit sa implementeze în MaxFitness noile tendinte 
în domeniul fitness-ului. Ideea prioritara a fost imbinarea rationala a vietii de bussines, odihnei active si perfectionarii fizice.</p>
	</div>
	<%}
else
{
	response.sendRedirect("login.jsp");
}

%>
</body>
</html>