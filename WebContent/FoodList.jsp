<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootLink/link.jsp"/>
<!--------------------------음식 리스트 ------------------------------------>
</head>

<body>
<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div class="col-sm-4">
    	<a href="module/MenuClickList/koreanRestaurant.jsp">
      		<img src="img/FoodListImg/hansik.PNG" class="img-responsive margin" style="width:100%" alt="Image">
      		<button class="btn" data-toggle="modal" data-target="#myModal">한식</button></a>
    </div>
    <div class="col-sm-4"> 
    	<a href="module/MenuClickList/snackbarRestaurant.jsp">
      <img src="img/FoodListImg/bunsik.PNG" class="img-responsive margin" style="width:100%" alt="Image">
      <button class="btn" data-toggle="modal" data-target="#myModal">분식</button>
    </div>
    <div class="col-sm-4"> 
    	<a href="module/MenuClickList/chineseRestaurant.jsp">
      <img src="img/FoodListImg/jungsik.PNG" class="img-responsive margin" style="width:100%" alt="Image">
      <button class="btn" data-toggle="modal" data-target="#myModal">중식</button>
    </div>
  </div>
  
  <div class="row">
    <div class="col-sm-4">
    	<a href="module/MenuClickList/sushiRestaurant.jsp">
      <img src="img/FoodListImg/ilsik.PNG" class="img-responsive margin" style="width:100%" alt="Image">
      <button class="btn" data-toggle="modal" data-target="#myModal">일식</button>
    </div>
    <div class="col-sm-4">
    	<a href="module/MenuClickList/desertRestaurant.jsp"> 
      <img src="img/FoodListImg/Cafe.PNG" class="img-responsive margin" style="width:100%" alt="Image">
 	  <button class="btn" data-toggle="modal" data-target="#myModal">카페, 디저트</button>
    </div>
    <div class="col-sm-4"> 
    	<a href="module/MenuClickList/fastfoodRestaurant.jsp">
     		<img src="img/FoodListImg/fastfood.PNG" class="img-responsive margin" style="width:100%" alt="Image">
     		<button class="btn" data-toggle="modal" data-target="#myModal">패스트푸드</button></a>
    </div>
  </div>
</div>


</body>
</html>