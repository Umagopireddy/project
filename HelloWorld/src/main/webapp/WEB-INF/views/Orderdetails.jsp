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

<jsp:include page="navbar.jsp" /> 
<div class="container-wrapper">
    <div class="container">
    
        <div class="row">

 <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

  <div >
    <h1 align="center">My orders</h1>
   </div>
                        
                  
                       

     <div class="row">
     <table class="table table-hover" border="1">
     <thead>
  <tr>
  <td class="text-center">Order Id</td>
                                        
  <td class="text-center">Purchase Date</td>
   <td class="text-center">Grand Total</td>
    </tr>
  </thead>
                                
                              
                                 
    <c:forEach var="od" items="${odlist}">
 <tr>
   <td class="col-md-1" style="text-align: center">${od.orderId}</td>
                                        
  <td class="col-md-1" style="text-align: center">${od.purchaseDate}</td>
 <td class="col-md-1" style="text-align: center">${od.grandTotal}</td>
 </tr>
 </c:forEach>
                          
                                
    </table>
   </div>
   </div>
 </div>
 </div>
  </div>

</body>
</html>