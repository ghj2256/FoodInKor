<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="utf-8">
<jsp:include page="../bootLink/link.jsp"/>
<style>
	footer {
		position: absolute;
		left: 0;
    	bottom: 0;
    	width: 100%;
	}
	.container {
		margin-top: 10px;
	}
	
</style>

<nav>
	<jsp:include page="/module/navBar.jsp"/>
</nav>
<!-- 윗부분 필요없는대 이거 어떻게 없애냐 ? 그것좀 해야할듯 계쏙 반복되는 구간인대 이거 계속 따라옴 -->
<div class="container">
	<div class="col-lg-4"></div>
		<div class="jumbotron" style="padding-top: 80px;" style="">
			<form method="post" action="LoginAction.jsp">
				<h3 style="text-align: center;">로그인 화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary from-control" value="로그인">
			</form>
			<a href="/FoodInKorProject/admin/Index.jsp" target="_blank"> 관리자 로그인</a>
		<div class="col-lg-4"></div>			
		</div>
</div>

<footer>
	<jsp:include page="/module/footer.jsp"/>
</footer>
