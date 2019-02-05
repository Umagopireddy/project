<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp"/>

 <div class="container">
 <c:url value="/admin/addcategory" var="caturl" />
<form:form action="${caturl}"  method="post">
 
    <h1>Category Details</h1>
    
    <div class="form-group row">

    
    <form:hidden path="category_id"  class="form-control" placeholder=" " name="Category_id"/><br>
</div>

<div class="form-group row">
    <form:label path="category_name"><b>Category_name</b></form:label>
    <form:input path="category_name"  class="form-control" placeholder=" " name="category_name" required="true"/><br>
    <form:errors path="category_name"></form:errors>
    </div>
    
    
<div class="form-group row">
    <form:label path="category_description"><b>Category_description</b></form:label>
    <form:input path="category_description"  class="form-control" placeholder=" " name="category_description" required="true"/><br>
    <form:errors path="category_description"></form:errors>
    </div>



   
   
      <button type="submit" >Submit</button>
      
      
 
</form:form>
 </div>

</body>
</html>