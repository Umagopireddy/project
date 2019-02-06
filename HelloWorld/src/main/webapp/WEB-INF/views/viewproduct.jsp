<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
<b>Product Details</b>
<pre>
<img src="<c:url value="/resources/images/${product.id }.jpg"></c:url>" height="50px" width="50px" class="img-circle">
<b>Product Name  :</b> ${ product.productname}

<b>Price         :</b>${product.price }

<b>In Stock      :</b>${product.quantity }
<b>Description   :</b>${product.description}
<security:authorize access="hasRole('ROLE_USER')">
<form action="<c:url value='/cart/addtocart/${ product.id}'></c:url>" >
Enter required units<br>
<input type="number" name="requestedQuantity" min="1">
<c:if test="${pageContext.request.userPrincipal.name != 'umaec433@gmail.com'}">
<c:if test="${product.quantity==0}">
<input type="button" disabled class="btn btn-lg btn-danger" value="Out of stock">
</c:if>
<c:if test="${product.quantity!=0}">
<input type="submit" class="btn btn-lg btn-info" value="Add To Cart">
</c:if>
</c:if>
</form> 
</security:authorize>
</pre>
<a href="<c:url value='/Homepage'></c:url>">Home</a>
</div>

</body>
</html>