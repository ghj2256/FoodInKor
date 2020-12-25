<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join</title>
		<jsp:include page="bootLink/link.jsp"/>
	  	<style>
	  		footer {
	  			position: relative;
	  			left : 0px;
	  			bottom : 0px;
	  			width : 100%
	  		}
	  		section {
	  			background-image: url('img/IndexImg/cake.jpg');
	  			background-size: cover;
    			background-repeat: no-repeat;
    			background-position: center center;
    			padding: 20px;
	  		}
	  		section > div {
	  			width: 100%;
	  			height: 1000px;
	  			background-color: rgba( 255, 255, 255, 0.5 );
	  			border: 2px soild;
	  			border-radius: 5px;
	  			text-align: center;
	  		}
	  		.joinForm {
	  			display: inline-block;
	  			width: 80%;
	  			background-color: #ffffff;
	  			opacity: 1.0;
	  			margin-top: 10%;
	  			padding: 5px;
	  			border: 2px solid black;
	  			border-radius: 10px;
	  		}
	  	</style>
	</head>
	<body>
		<nav>
			<jsp:include page="module/navBar.jsp"/>
		</nav>
		<section>
			<div>
				<div class="joinForm">
					<jsp:include page="module/joinForm.jsp"/>
				</div>
			</div>
		</section>
		<footer>
			<jsp:include page="module/footer.jsp"/>
		</footer>
	</body>
</html>