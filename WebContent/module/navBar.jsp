<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String login = (String)session.getAttribute("login");
	String name = (String)session.getAttribute("name");
%>
  <meta charset="utf-8">
<jsp:include page="../bootLink/link.jsp"/>
<style>
	.form-group{
		margin-left: 20px;
		vertical-align: middle;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <a class="navbar-brand" href="#">FoodInKor</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarNavDropdown">
		    <ul class="navbar-nav">
		      <li class="nav-item active">
		        <a class="nav-link" href="/FoodInKorProject/Index.jsp">Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="/FoodInKorProject/module/RestaurantList.jsp">인기 메뉴</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">핫 플레이스</a>
		      </li>
		      <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">종류</a>
			    <div class="dropdown-menu" style="">
			      <a class="dropdown-item" href="/FoodInKorProject/module/MenuClickList/koreanRestaurant.jsp">한식</a>
			      <a class="dropdown-item" href="/FoodInKorProject/module/MenuClickList/chineseRestaurant.jsp">중식</a>
			      <a class="dropdown-item" href="/FoodInKorProject/module/MenuClickList/sushiRestaurant.jsp">일식</a>
			      <a class="dropdown-item" href="/FoodInKorProject/module/MenuClickList/desertRestaurant.jsp">카페,디저트</a>
			      <a class="dropdown-item" href="/FoodInKorProject/module/MenuClickList/snackbarRestaurant.jsp">패스트푸드</a>
			    </div>
			  </li>
		    </ul>
		    <form class="form-inline my-2 my-lg-0" action="/FoodInKorProject/module/searchResult.jsp" method="get">
			    <div class="form-group">
			      <select class="form-control" id="exampleSelect1" name="searchItem">
			        <option value="상호명">이름</option>
			        <option value="지역명">지역</option>
			      </select>
			    </div>
		      	<input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchContent">
		      	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		  	</form>
		  </div>
		  <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
			  <ul class="navbar-nav ml-md-auto">
			  <% if(login==null){ %>
			    <li class="nav-item">
			   	<!-- 로그인 페이지 넘기는 거 코드 추가 -->
			      <a class="nav-link" href="/FoodInKorProject/module/login.jsp">로그인</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/FoodInKorProject/join.jsp">회원가입</a>
			    </li>
		    </ul>
			    <% } else { %>
		    <span class="navbar-text">
   				<%=name %>님 환영합니다!
			</span>
			<ul class="navbar-nav ml-md-auto">
			    <li class="nav-item">
			      <a class="nav-link" href="/FoodInKorProject/module/logoutAction.jsp">로그아웃</a>
			    </li>
		    <% } %>
		  	</ul>
		  </div>
		</nav>