<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="quiz.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%@include file="Header.jsp"%>
<section>
<h2>Play Quiz</h2>
<div>
<form action="quiz" method="post">
${question.qdesc}<br />

				<br />
					<c:choose>
						<c:when test="${sessionScope.ansMap[question.qid].answer eq  question.opta}">
							<input type="radio" checked="checked" name="ques" value="${question.opta}" />${question.opta}<br />
							<input type="radio" name="ques" value="${question.optb}" />${question.optb}<br />
							<input type="radio" name="ques" value="${question.optc}" />${question.optc}<br />
						</c:when>
						<c:when test="${sessionScope.ansMap[question.qid].answer eq  question.optb }">
							<input type="radio" name="ques" value="${question.opta}" />${question.opta}<br />
							<input type="radio" checked="checked" name="ques" value="${question.optb}" />${question.optb}<br />
							<input type="radio" name="ques" value="${question.optc}" />${question.optc}<br />
						</c:when>
						<c:when test="${sessionScope.ansMap[question.qid].answer eq  question.optc }">
							<input type="radio"  name="ques" value="${question.opta}" />${question.opta}<br />
							<input type="radio" name="ques" value="${question.optb}" />${question.optb}<br />
							<input type="radio" checked="checked" name="ques" value="${question.optc}" />${question.optc}<br />
						</c:when>
						<c:otherwise>
							<input type="radio" name="ques" value="${question.opta}" />${question.opta}<br />
							<input type="radio" name="ques" value="${question.optb}" />${question.optb}<br />
							<input type="radio" name="ques" value="${question.optc}" />${question.optc}<br />
						</c:otherwise>
					</c:choose>

				<input type="hidden" name="quesId" value="${question.qid}" />
<div align="center">

<c:if test = "${sessionScope.curridx gt 0}">
	<input type="submit" name="btn" value="prev"/>
</c:if>

<c:if test = "${sessionScope.curridx < applicationScope.size - 1}">
	<input type="submit" name="btn" value="next" /> 
</c:if>

<c:if test = "${sessionScope.curridx eq applicationScope.size - 1}">
	<input type="submit" name="btn" value="finish" /> 
</c:if>
								
</div>
</form>
</div>
</section>
<%@include file="Footer.jsp"%>
</body>
</html>
