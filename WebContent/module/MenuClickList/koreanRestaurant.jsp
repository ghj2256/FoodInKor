<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,admin.*"%>
<%@ page import="review.ReviewBean" %>

<script type="text/javascript" src="script.js"></script>

<jsp:useBean id="foodMgr" class="admin.RestaurantMgr" />
<jsp:useBean id="reviewMgr" class="review.ReviewMgr" />
   <meta charset="utf-8"> 
<!DOCTYPE html>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
 <jsp:include page="../../bootLink/link.jsp"/>
  <style>
  	.container {
  		margin-top: 20px;
  	}
  	footer {
  		position: absolute;
  		left: 0px;
  		bottom: 0px;
  		width:100%; 
  	}
  </style>
<nav>
		<jsp:include page="/module/navBar.jsp"/>
	</nav>

 <!-------------------------------- 인기 메뉴 눌렀을 때 나오는 가게리스트 ----------------------------->
<div class="container">
  
 	<%
 		// vResult에 가게 리스트를 대입
		Vector vResult= foodMgr.getKoreanRestaurantList();
  		
 		// 아무 가게도 등록이 안되어있으면
 		if(vResult.size() ==0){
	%>
	
	
		<!-- 아무 가게도 등록이 안되어 있을 때에 대한 코드 입력 하면 됨 -->
	
	<%
		// 가게가 등록되어 있으면
		}else{
			// 가게 2개씩 찍어주는 for문
			for(int i=0; i<vResult.size(); i+=2){
	%>
  <div class="media">
  
  	<%
				 // 가게 2개씩 찍어주는 for문
  				for(int j=i; j <= i+1; ++j){
  					if(vResult.size() <= j)
  					{
  						break;
  					}
  					// j번째 가게의 정보를 restaurant에 대입
  					RestaurantBean restaurant = (RestaurantBean)vResult.get(j);
  	%>
  	
  <!--------------------------가게 찍어주는 부분-------------------- -->
    <div class="media-left">
      <img src="<%=request.getContextPath()%>/data/<%=restaurant.getImage()%>" class="media-object" style="width:100px">
    </div>
    
    <div class="media-body">
      <a href="javascript:restaurantDetail('<%=restaurant.getNo()%>')"><h2 class="media-heading"><%=restaurant.getName()%></h2></a>
      <h4><%=restaurant.getType() %></h4>
      <p><%=restaurant.getAddress() %></p>
            <%
      		// 리뷰 몽땅 가져오기
      		Vector vReviewResult = reviewMgr.getReviewList();
      		
      		//리뷰 카운트 찍을 변수
      		int reviewCount = 0;
      		
      		// DB에 리뷰 갯수만큼 돌리는데
      		for(int m=0; m<vReviewResult.size(); m++){
      			ReviewBean review = (ReviewBean)vReviewResult.get(m);
      			
      			// 리뷰DB에 있는 restaurantNo과 실제 레스토랑의 No이 같으면 Count에 1을 더함
      			if(Integer.parseInt(review.getRestaurantNo()) == restaurant.getNo()){
      				reviewCount += 1;
      			}
      		}
      		%>
      <p>리뷰 <%= reviewCount%></p>      
    </div>
    
    
     <!------------------------------------------------------------------- -->
    <%
  				}
    %>  
  </div>
   <hr>
   	<%		
   			
			}
		}
	%>

</div>
<footer>
	<jsp:include page="/module/footer.jsp"/>
</footer>

<form name="detail" method="post" action="/FoodInKorProject/module/RestaurantDetail.jsp" >
<input type="hidden" name="no">
</form>