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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
<table class="table">
  <tr>
    <th>Supplier id</th>
    <th>Supplier name</th>
    
  </tr>
  <c:forEach items="${suplist}" var="s" >
  <tr>
    <td>${s.supplier_id}</td>
    <td>${s.supplier_name}</td>
    <td><a href="supplierupdate/${s.supplier_id}">Update</a></td>
    <td><a href="deletesupplier/${s.supplier_id}">Delete</a></td>
   
    
    
  </tr>
  </c:forEach>
  
    
</table>
</div>

</body>
</html>