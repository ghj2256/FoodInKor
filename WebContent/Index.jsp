<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>index</title>
	  	<meta charset="utf-8">
	  	<jsp:include page="bootLink/link.jsp"/>
	  	<style>
	  		nav {
	  			padding: 0;
	  		}
	  		section {
	  			margin-top: 20px;
	  		}
	  		section > h3 {
	  			margin-left: 20px;
	  			font-style: bold;
	  		}
	  	</style>
	</head>
	<body>
	<nav>
		<jsp:include page="module/navBar.jsp"/>
	</nav>
	<header>
		<jsp:include page="module/header.jsp"/>
	</header>
	<section>
		<h3>카테고리</h3>
		<hr>
		<jsp:include page="FoodList.jsp"/>
	</section>
	<footer>
		<hr>
		<jsp:include page="module/footer.jsp"/>
	</footer>
	</body>
</html>