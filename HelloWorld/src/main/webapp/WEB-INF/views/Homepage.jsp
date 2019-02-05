<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 70%;
    margin: auto;
  }
  </style>

</head>
<body>
<jsp:include page="navbar.jsp"/>

 

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
      <li data-target="#myCarousel" data-slide-to="7"></li>
      <li data-target="#myCarousel" data-slide-to="8"></li>
      <li data-target="#myCarousel" data-slide-to="9"></li>
      <li data-target="#myCarousel" data-slide-to="10"></li>
      <li data-target="#myCarousel" data-slide-to="11"></li>
      
     
    </ol>
    
   
    

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src=<c:url value="/resources/images/pic1.jpg"/> alt=""> 
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src=<c:url value="/resources/images/pic2.jpg"/> alt="" >
        <div class="carousel-caption">
        <p>Shop now...2 days moree</p>
          </div>
      </div>
    
      <div class="item">
        <img src=<c:url value="/resources/images/pic3.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic4.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic5.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic6.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic7.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic8.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic9.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic10.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic11.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        <div class="item">
        <img src=<c:url value="/resources/images/pic12.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        
        
        
        
      <div class="carousel-inner" role="listbox">

           
       
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


<div class="row">
 <c:forEach items="${productlist}" var="p">
 <div class="col-md-4" style="margin-top:50px;">
 <security:authorize access="hasRole('ROLE_USER')">
<form action="<c:url value='/viewproduct/${p.id}'></c:url>" >
    <img src="<c:url value="/resources/images/${p.id}.jpg"></c:url>" />
    <br/>
   <center>
    ${p.productname}
    <br/>
    Stock:${p.quantity}
    <br/>
    Price:Rs. ${p.price}/-
    <br/>
    <button type="submit" class="btn btn-warning">View Product</button>
    </center>
    
 
</form>
</security:authorize>
   </div>
 </c:forEach>
</div>


 <!-- <div id="myCarousel1" class="carousel slide" data-ride="carousel">
    Indicators
    <ol class="carousel-indicators">
      <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel1" data-slide-to="1"></li>
      <li data-target="#myCarousel1" data-slide-to="2"></li>
      <li data-target="#myCarousel1" data-slide-to="3"></li>
      <li data-target="#myCarousel1" data-slide-to="4"></li>
    </ol>
    
   
    

    Wrapper for slides
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src=<c:url value="/resources/images/watch1.jpg"/> alt=""> 
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src=<c:url value="/resources/images/watch2.jpg"/> alt="" >
        <div class="carousel-caption">
        <p>Shop now...2 days moree</p>
          </div>
      </div>
    
      <div class="item">
        <img src=<c:url value="/resources/images/watch3.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        <div class="item">
        <img src=<c:url value="/resources/images/watch4.jpg"/> alt="Flower" >
        <div class="carousel-caption">
          <h3>Offers</h3>
          <p>Mega offers online in different categories.</p>
        </div>
      </div>
      
      <div class="item">
        <img src=<c:url value="/resources/images/watch5.jpg"/> alt="Flower" >
        <div class="carousel-caption">
          <h3>Offers</h3>
          <p>Mega offers online in different categories.</p>
        </div>
      </div>
      
      <div class="carousel-inner" role="listbox">
      </div>

    Left and right controls
    <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> -->
      
      
      
      <%-- <div class="row">
 <c:forEach items="${productlist}" var="p">
 <div class="col-md-4">
 <security:authorize access="hasRole('ROLE_USER')">
<form action="<c:url value='/viewproduct/${p.id}'></c:url>" >
    <img src="<c:url value="/resources/images/${p.id}.jpg"></c:url>" />
    <br/>
   <center>
    ${p.productname}
    <br/>
    Stock:${p.quantity}
    <br/>
    Price:Rs. ${p.price}/-
    <br/>
    <button type="submit" class="btn btn-warning">View Product</button>
    </center>
    
 
</form>
</security:authorize>
   </div>
 </c:forEach>
</div> --%>
      
     <!--  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    Indicators
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    
   
    

    Wrapper for slides
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src=<c:url value="/resources/images/bed1.jpg"/> alt=""> 
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src=<c:url value="/resources/images/bed2.jpg"/> alt="" >
        <div class="carousel-caption">
        <p>Shop now...2 days moree</p>
          </div>
      </div>
    
      <div class="item">
        <img src=<c:url value="/resources/images/bed3.jpg"/> alt="Flower" >
        <div class="carousel-caption">
        </div>
        </div>
        
        <div class="item">
        <img src=<c:url value="/resources/images/bed4.jpg"/> alt="Flower" >
        <div class="carousel-caption">
          <h3>Offers</h3>
          <p>Mega offers online in different categories.</p>
        </div>
      </div>
      
      <div class="item">
        <img src=<c:url value="/resources/images/bed5.jpg"/> alt="Flower" >
        <div class="carousel-caption">
          <h3>Offers</h3>
          <p>Mega offers online in different categories.</p>
        </div>
      </div>

           <div class="carousel-inner" role="listbox">
       
    </div>

    Left and right controls
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> -->







      
 
</body>
</html>