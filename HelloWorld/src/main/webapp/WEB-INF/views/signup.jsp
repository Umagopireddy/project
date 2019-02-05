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
<c:url value="/adduser" var="userurl"/>
<form:form action="${userurl}"  method="post">
 
    <h1>User Details</h1>
    
    <div class="form-group row">

    <form:label path="email_id"><b>Email_id</b></form:label>
    <form:input path="email_id" type="text" class="form-control" placeholder=" " required="true"/><br>
    <form:errors path="email_id"></form:errors>
</div>

<div class="form-group row">
    <form:label path="user_name"><b>User_name</b></form:label>
    <form:input path="user_name"  class="form-control" placeholder=" " name="user_name" required="true"/><br>
    <form:errors path="user_name"></form:errors>
    </div>
    
    <div class="form-group row">
    <form:label path="contact_number"><b>Contact_number</b></form:label>
    <form:input path="contact_number"  class="form-control" placeholder=" " name="contact_name" required="true"/><br>
    <form:errors path="contact_number" />
    </div>
    
    <div class="form-group row">
    <form:label path="password"><b>Password</b></form:label>
    <form:input path="password"  type="password" class="form-control" placeholder=" " name="password" required="true"/><br>
    <form:errors path="password"></form:errors>
    </div>
    
    <div class="form-group row">
    <form:label path="shipping_address"><b>Shipping_address</b></form:label>
    <form:input path="shipping_address"  class="form-control" placeholder=" " name="shipping_address" required="true"/><br>
    <form:errors path="shipping_address"></form:errors>
    </div>
    
    <div class="form-group row">
    <form:label path="billing_address"><b>Billing_address</b></form:label>
    <form:input path="billing_address"  class="form-control" placeholder=" " name="billing_address" required="true"/><br>
    <form:errors path="billing_address"></form:errors>
    </div>
    
    <form:hidden path="authorities.role"  value="ROLE_USER"/><br>
    <button type="submit" >Submit</button>
      
      
 
</form:form>
 </div>


</body>
</html>