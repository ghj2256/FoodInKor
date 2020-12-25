<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.RestaurantBean" %>
<%@ page import="review.ReviewBean" %>
<%@ page import="java.io.PrintWriter" %>
<%
	String login = (String)session.getAttribute("login");
%>
<jsp:useBean id="foodMgr" class="admin.RestaurantMgr" />
<jsp:useBean id="reviewMgr" class="review.ReviewMgr" />
<!DOCTYPE html>

<!-- ---------------------------- 가게 이름 클릭시 나오는 페이지 --------------- -->
<html>
<head>
<meta charset="utf-8">

  <jsp:include page="../bootLink/link.jsp"/>


<title>Insert title here</title>
<style>
	#map {
		background: #00ff00;
	}
	.font-weight-bold mb-1 {
		font-size: 50px;	
	}
</style>
</head>
<body>
<section>
		<jsp:include page="/module/navBar.jsp"/>
</section>

<%
	RestaurantBean Restaurant= foodMgr.getRestaurant(request.getParameter("no"));
%>
<%
	if(login!=null){
%>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="row p-5">
                        <div class="col-md-6">
                            <img src="<%=request.getContextPath()%>/data/<%=Restaurant.getImage()%>" width="200" height="200">
                        </div>
                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-1"><%=Restaurant.getName()%></p>
                            <p class="text-muted">등록날짜 : <%=Restaurant.getDate()%></p>
                        </div>
                    </div>

                    <hr class="my-5">
	                    <div class="row pb-5 p-5">
	                        <div class="col-md-6">
	                            <p class="font-weight-bold mb-4">소개</p>
	                            <p class="mb-1"><%=Restaurant.getDetail() %></p>
	                        </div>
	                    </div>
                    <hr class="my-5">

                    <div class="row pb-5 p-5">
                        <div class="col-md-6">
                            <p class="font-weight-bold mb-4">업체 정보</p>
                            <p class="mb-1">영업 시간 : <%=Restaurant.getOpenhour() %></p>
                            <p class="mb-1">홈페이지 : <a href=<%= Restaurant.getHomepage()%> target="_blank"><%=Restaurant.getHomepage() %></a></p>
                            <p class="mb-1">주소 : <%=Restaurant.getAddress()%></p>
                            <p class="mb-1">번호 : <%=Restaurant.getTel()%></p>
                            <p class="mb-1">음식 종류 : <%=Restaurant.getType()%></p>
                            <p class="mb-1">가격대 : <%=Restaurant.getPrice() %></p>
                        </div>
                        <div id="map" style="width:500px;height:400px;"></div>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dac642a385d7172a4e782726a1b9d547&libraries=services"></script>
                    </div>

                    <div class="row p-5">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold">ID</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">내용</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">날짜</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">평점</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%	
                                		Vector vResult = reviewMgr.getReviewList(); 
                                	
                                		int reviewCount = vResult.size();
                                	%>       
                                	<%
                                	
                                		for(int i=0; i<vResult.size(); i++){
                                			ReviewBean review = (ReviewBean)vResult.get(i);

                                				
                                			if(review.getRestaurantNo().equals((String)request.getParameter("no"))){
												--reviewCount;
                                	%>
                                    
                                    <tr>
                                        <td><%=review.getReviewUserID() %></td>
                                        <td><%=review.getReviewContents() %></td>
                                        <td><%=review.getReviewDate() %></td>
                                        <% 
                                        		String rating = "";
                                        		for(int j = 0; j < Integer.parseInt(review.getReviewRating()); j++){
                                        			rating += "★";
                                        		}
                                        %>
                                        <td><%=rating %></td>
                                    </tr>
                                    
                                    <%
                                			}                                			
                                			
                                		}
                                		
                                		if(vResult.size() == reviewCount){
                                	%>
                                		
                                		<tr>
                                        <td>등록된 리뷰가 없습니다.</td>
                                  		</tr>	
                                			
                                	<%	       
                                		}
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                    	<div class="container">
  						<h5>한줄평</h5>
 							 <form action="ReviewProc.jsp">
  							  <div class="form-group">
  							  		<input type=hidden name = "restaurantNo" value="<%=(String)request.getParameter("no")%>">
  							  		<input type=hidden name = "reviewUserID" value="<%=(String)session.getAttribute("name") %>">
  							  		<tr> 
									<td align="center">평점 </td>
									<td align="left">
									<select name="Rating">
									<option value="5">★★★★★
									<option value="4">★★★★	
									<option value="3">★★★
									<option value="2">★★
									<option value="1">★
									</select>
									</tr>
  				   					<input type="text" class="form-control" id="usr" name="Comment">
  				 			 </div>
 		 		  		<button type="submit" class="btn btn-primary">Submit</button>
 					 </form>
				</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="text-light mt-5 mb-5 text-center small">by : <a class="text-light" target="_blank" href="http://totoprayogo.com">totoprayogo.com</a></div>

</div>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.53465, 126.99482), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var address = "<%=Restaurant.getAddress() %>"
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=Restaurant.getName()%></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) { 
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
</body>

<footer>
		<jsp:include page="/module/footer.jsp"/>
</footer>

</html>
<% } else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 후 볼 수 있습니다!')");
	script.println("location.href ='login.jsp'");
	script.println("</script>");
}
%>