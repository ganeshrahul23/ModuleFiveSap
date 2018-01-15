<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sapient.com" prefix="sap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.pass{
color:blue;
}
.fail{
color:red;
}
</style>
</head>
<body>
<sap:display>Eligible Result</sap:display><hr />
<table cellpadding="10" bgcolor="wheat" style="margin: 0 auto">
	<tr>
		<td>Employee Name</td>
		<td>${param.txtname}</td>
	</tr>

	<tr>
		<td>Age</td>
		<td>${param.txtage}</td>
	</tr>

	<tr>
		<td>Eligible/Not Eligible</td>
		<td>
			<sap:check age="${param.txtage}" var="res">
				${res}
			</sap:check>
		</td>
	</tr>
</table>
</body>
</html>