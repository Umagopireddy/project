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
 <c:url value="/admin/addproduct" var="prod"/>
<form:form action="${prod}"  method="post" enctype="multipart/form-data">
 
    <h1>Product Details</h1>
    
    <div class="form-group row">

    
    <form:hidden path="id"  class="form-control" placeholder=" " name="Product_id"/><br>
    
</div>

<div class="form-group row">
    <form:label path="productname"><b>Productname</b></form:label>
    <form:input path="productname"  class="form-control" placeholder=" " name="productname" required="true"/><br>
    <form:errors path="productname"></form:errors>
    </div>
    
    
<div class="form-group row">
    <form:label path="description"><b>Description</b></form:label>
    <form:input path="description"  class="form-control" placeholder=" " name="description" required="true"/><br>
    <form:errors path="description"></form:errors>
    </div>


<div class="form-group row">
    <form:label path="quantity"><b>Quantity</b></form:label>
    <form:input path="quantity"  class="form-control" placeholder=" " name="quantity" required="true"/><br>
    </div>
      
<div class="form-group row">
    <form:label path="price"><b>Price</b></form:label>
    <form:input path="price"  class="form-control" placeholder=" " name="price" required="true"/><br>
    </div>
    <div class="form-group row">
    <label> Select Category   :</label>
  <form:select path="category.category_id">	
<c:forEach items="${categories}" var="c"><%--model.addAttribute("categories",categories), items refers the model attribute categories --%>
<form:option value="${c.category_id }">${c.category_name}</form:option>
</c:forEach>
</form:select>
</div>
<div class="form-group row">
    <label>
Select Supplier   : 
</label>
<form:select path="supplier.supplier_id">	
<c:forEach items="${suppliers}" var="s"><%--model.addAttribute("suppliers",suppliers), items refers the model attribute suppliers --%>
<form:option value="${s.supplier_id }">${s.supplier_name}</form:option>
</c:forEach>
</form:select>
</div>

<div class="form-group row">
    <label>
 Upload image      : </label>
 <form:input path="image" type="file"/>
 </div>
   
      <button type="submit" >Submit</button>
      
 
</form:form>
 </div>
 

</body>
</html>