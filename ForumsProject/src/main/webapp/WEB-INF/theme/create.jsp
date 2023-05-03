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
    <title>Title</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container">
   		 <h3>Create Theme </h3>
    <form:form method="POST" action="/createTheme" modelAttribute="newTheme">
        <div class="mb-3">
                <form:label class="form-label" path="themeName">Name</form:label>
                <form:input class="form-control" path="themeName" />
                <form:errors path="themeName" class="text-danger" />
            </div>
            <div class="mb-3">
                <form:label class="form-label" path="image">Image</form:label>
                <form:input class="form-control" path="image"/>
                <form:errors path="image" class="text-danger" />
            </div>
            <div class="mb-3">
             <form:label class="form-label" path="description">Description</form:label>
                <form:textarea class="form-control" path="description" />
                <form:errors path="description" class="text-danger" />
            </div>
            <div class="d-grid gap-2">
                <input type="submit" value="Create" class="btn btn-primary"/>
</div>
    </form:form>
 	</div>
</body>
</html>