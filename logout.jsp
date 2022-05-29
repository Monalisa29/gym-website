<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deconecteaza-te</title>
</head>
<body>

<p><meta http-equiv="refresh" content="0; url=login.jsp"></p>
<%
	request.getSession().removeAttribute("emailAdmin");
	request.getSession().removeAttribute("emailCurrentClient");
%>

</body>
</html>