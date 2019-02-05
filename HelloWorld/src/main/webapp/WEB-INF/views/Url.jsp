<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
<a href="<c:url value='/admin/Productpage'></c:url>" ><button type="button"class="btn btn-success" >Add Products</button></a>
<a href="<c:url value='/admin/Categorypage'></c:url>" ><button type="button"class="btn btn-success" >Add Categories</button></a>
<a href="<c:url value='/admin/Supplierpage'></c:url>" ><button type="button"class="btn btn-success" >Add Suppliers</button></a>
<a href="<c:url value='/productlist'></c:url>" ><button type="button"class="btn btn-success" >Manage Productlist</button></a>
<a href="<c:url value='/admin/categorylist'></c:url>" ><button type="button"class="btn btn-success" >Manage Categorylist</button></a>
<a href="<c:url value='/admin/supplierlist'></c:url>" ><button type="button"class="btn btn-success" >Manage Supplierlist</button></a>
</div>

</body>
</html>