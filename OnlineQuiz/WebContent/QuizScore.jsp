<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz Result</title>
<link href="quiz.css" rel="stylesheet">
</head>
<body>
<%@include file="Header.jsp" %>
<section>
<div>
	<h3>You have scored ${score} answers right</h3>
	<h3>and your percentage is ${score/applicationScope.size * 100}</h3>
	<table>
		<tr>
			<th>Q.No</th>
			<th>Question</th>
			<th>Right Answer</th>
			<th>Your Answer</th>
		</tr>
	<tbody>
	<c:forEach items="${sessionScope.quesList}" var="q" varStatus="i">
		<tr>
			<td>${i.count}</td>
			<td>${q.qdesc}</td>
			<td>${q.answer}</td>
			<td>
			<c:if test="${sessionScope.ansMap[q.qid].answer eq q.answer}">
				<span style="color:blue">${sessionScope.ansMap[q.qid].answer}</span>
			</c:if>
			<c:if test="${sessionScope.ansMap[q.qid].answer ne q.answer}">
				<span style="color:red">${sessionScope.ansMap[q.qid].answer}</span>
			</c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</div>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>