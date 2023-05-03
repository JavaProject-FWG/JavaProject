<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container">
		<c:out value="${theme.themeName }"></c:out>
		<img alt="${theme.themeName }" src="${theme.image }"
			style="width: 50px; height: 50px;">
		<c:forEach items="${theme.topics}" var="oneTopic">



			<a href="/topics/${oneTopic.id }"> <c:out
					value="${oneTopic.topicName }" /></a>
			<c:out value="${oneTopic.topicPostedBy.userName }"></c:out>
			<c:out value="${oneTopic.joinedUsers.size() }"></c:out>



		</c:forEach>
	</div>
</body>
</html>