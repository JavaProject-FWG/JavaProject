<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<div class="container">
   <h1>Create a Topic 📖</h1>

   <a href="/topics">◀ back</a>
   <a href="/themes">◀ home</a>
   <hr />
 <form:form action="/topics" method="post" modelAttribute="topic">
 	
         <form:errors path="*" class="text-danger"/>     
    <p>
        <form:label path="topicName">Name</form:label>
        <form:input path="topicName"/>
    </p>
    <p>

<form:hidden path="topicPostedBy" value="${userID }"/>
    </p>
     <form:label path="theme">Theme</form:label>
    <form:select path="theme">
    <c:forEach items="${allThemes}" var="theme">
    <form:option value="${theme.id }">${theme.themeName }</form:option>
    </c:forEach>
    </form:select>
    <br />
    <input type="submit" value="Submit" class="btn btn-success"/>
</form:form>    
</div>
</body>
</html>