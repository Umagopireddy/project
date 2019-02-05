<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

</head>
<body>

<jsp:include page="navbar.jsp"/>
<div class="container">
<c:url value="/admin/addsupplier" var="supurl" />
<form:form action="${supurl}"  method="post">
 
    <h1>Supplier Details</h1>
    
    <div class="form-group row">

    
    <form:hidden path="supplier_id" class="form-control" placeholder=" " name="Supplier_id"/><br>
</div>

<div class="form-group row">
    <form:label path="supplier_name"><b>Supplier_name</b></form:label>
    <form:input path="supplier_name"  class="form-control" placeholder=" " name="supplier_name" required="true"/><br>
    <form:errors path="supplier_name"></form:errors>
    </div>
    
    <button type="submit" >Submit</button>
      
      
 
</form:form>
 </div>

</body>
</html>