<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adauga disciplina</title>
<link rel="stylesheet" href="design.css">
<style>
	.add-discipline-form{
		color: orange;
		border: 1px outset orange;
		width: 320px;
		height: 100px;
		padding: 60px;
		position: absolute;
		top: 30%;
		left: 35%;
		background: rgba(0, 0, 0, 0.9);
	}
</style>
<script>
	function validateForm()
	{
		var name = document.getElementById('name').value;
		var description = document.getElementById('description').value;
		if(name == "")
		{
			alert ("Nu ati completat denumirea disciplinei!");
			document.form.lname.focus();
			return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
<div class="nav-bar">
		<ul>
			<li><a href="aboutUs.jsp">Despre noi</a></li>
  			<li><a href="homePage.jsp">Acasa</a></li>
    		<li><a href="trainerPage.jsp">Antrenori</a></li>
		    <li><a href="membershipPage.jsp">Abonamente</a></li>
		    <li><a href="disciplinePage.jsp">Discipline</a></li>
		    <li><a href="programPage.jsp">Program</a></li>
		</ul>
</div>

<div class="add-discipline-form">
	<form name = "form" action="addDiscipline2.jsp">
  <label for="name">Denumire disciplina</label>
  <input type="text" id="name" name="name"><br><br>
  
  <label for="description">Descriere disciplina</label>
  <input type="text" id="description" name="description"><br><br>

  <input type="button" value="Adauga disciplina" onclick="validateForm()">
 
</form>
</div>
</body>
</html>