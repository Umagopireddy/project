<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="ISO-8859-1">
</head>
<body>

<div class="container">
<nav class="navbar navbar-inverse" id="navcolour">
<div class="navbar-header">
<a class="navbar-brand"><img src="<c:url value="/resources/images/logo.jpg" />" height="35px" width="60px"></a>
</div>

<ul class="nav navbar-nav" id="links">
   <li><a href="<c:url value="/Homepage" />" ><span class="glyphicon glyphicon-user">Home</span></a></li>
   <li class="dropdown">
   <a class="dropdown-toggle" data-toggle="dropdown" href="#">All Categories
   <span class="caret"></span></a>
   <ul class="dropdown-menu">
   <c:forEach items="${categories}" var="c">
   <li><a href="<c:url value="/categorydisplay/${c.category_id}" />" >${c.category_name}</a></li>
   </c:forEach>
     <!--  <li><a href="#"> Electronics</a></li>
      <li><a href="#"> TVs & Appliances</a></li>
      <li><a href="#"> Men</a></li>
      <li><a href="#"> Women</a></li>
      <li><a href="#"> Baby & Kids</a></li>
      <li><a href="#"> Home & Furniture</a></li>
      <li><a href="#"> Sports</a></li> -->
  </ul>

  </li>
  </ul>
  
 
  </ul>
  <ul class="nav navbar-nav navbar-right">
<c:if test="${pageContext.request.userPrincipal.name == 'umaec433@gmail.com'}">
      <li><a href="<c:url value="/admin/adminpage" />" >ADMIN</a></li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name == null }">
      <li><a href="<c:url value="/signup" />" ><span class="glyphicon glyphicon-user">SignUp</span></a></li>
      <li><a href="<c:url value="/signin" />" ><span class="glyphicon glyphicon-log-in"> </span> Sign In</a></li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name != null }">
      <li><a href="<c:url value="/j_spring_security_logout" />" ><span class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name != null }">
      <c:if test="${pageContext.request.userPrincipal.name != 'umaec433@gmail.com'}">
      <li><a href="">Welcome ${pageContext.request.userPrincipal.name }</a></li>
      <li><a href="<c:url value="/cart/getcartitems" />" ><span class="glyphicon glyphicon-shopping-cart"></span>My Cart</a></li>
      </c:if>
      </c:if>
      </ul>
    </nav>
</div>




    </nav>
</div>
</body>
</html>