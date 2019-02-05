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
    <th>ID</th>
    <th>DESCRIPTION</th>
    <th>PRICE</th>
    <th>PRODUCTNAME</th>
    <th>QUANTITY</th>
    <th>IMAGE</th>
  </tr>
  <c:forEach items="${prodlist}" var="p" >
  <tr>
    <td>${p.id}</td>
    <td>${p.description}</td>
    <td>${p.price}</td>
    <td>${p.productname}</td>
    <td>${p.quantity}</td>
    <td><img src="<c:url value="/resources/images/${p.id}.jpg" />" height="100" width="45" /></td> 
    
  
  <td>
        <a href="<c:url value='/viewproduct/${p.id}'></c:url>"><span class="glyphicon glyphicon-info-sign"></span></a>
        <security:authorize access="hasRole('ROLE_ADMIN')">
        <a href="<c:url value='/admin/deleteproduct/${p.id }'></c:url>"><span class="glyphicon glyphicon-trash"></span></a>
        <a href="<c:url value='/admin/productupdate/${p.id}'></c:url>"><span class="glyphicon glyphicon-pencil"></span></a>
        </security:authorize>
        </td>
        </tr>
  </c:forEach>
  
    
</table>
</div>

</body>
</html>