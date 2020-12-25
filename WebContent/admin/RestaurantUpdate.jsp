<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="proMgr" class="admin.RestaurantMgr" />
  <meta charset="utf-8">

<!-- -------------------- 맛집 수정 페이지 ------------------------ -->

<html>
<head>
<title>FoodInKor Admin</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %>
	
	<%RestaurantBean restaurant= proMgr.getRestaurant(request.getParameter("no"));%>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<form method="post" action="RestaurantProc.jsp?flag=update" enctype="multipart/form-data">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center"><font color="#FFFFFF">가게등록</font></td>
		</tr>
		
		
		<tr> 
		<td align="center">맛집 이름</td>
		<td align="left"><input type="text" name="name" value="<%=restaurant.getName()%>"></td>
		</tr>
		
		<tr> 
		<td align="center">주소</td>
		<td align="left"><input type="text" name="address" value="<%=restaurant.getAddress()%>"></td>
		</tr>
		<tr> 
		<tr> 
		<td align="center">전화번호</td>
		<td align="left"><input type="text" name="tel" value="<%=restaurant.getTel()%>"></td>
		</tr>
		
		<tr> 
		<td align="center">음식 종류</td>
		<td align="left">
		<select name="type" value="한식">
		<option value="0">선택하세요.
		<option value="한식" <% if(restaurant.getType().equals("한식")){  %>selected="selected" <% }else {} %>>한식
		<option value="분식" <% if(restaurant.getType().equals("분식")){  %>selected="selected" <% }else {} %>>분식
		<option value="중식" <% if(restaurant.getType().equals("중식")){  %>selected="selected" <% }else {} %>>중식
		<option value="일식" <% if(restaurant.getType().equals("일식")){  %>selected="selected" <% }else {} %>>일식
		<option value="카페,디저트" <% if(restaurant.getType().equals("카페,디저트")){  %>selected="selected" <% }else {} %>>카페,디저트
		<option value="패스트푸드" <% if(restaurant.getType().equals("패스트푸드")){  %>selected="selected" <% }else {} %>>패스트푸드
		</select>
		</tr>
		<tr> 
		<td align="center">가격대</td>
		<td align="left"><input type="text" name="price" value="<%=restaurant.getPrice()%>">원</td>
		</tr>
		<tr> 
		<td align="center">영업 시간</td>
		<td align="left"><input type="text" name="openhour" value="<%=restaurant.getOpenhour()%>"></td>
		</tr>
		<tr> 
		<td align="center">홈페이지 주소</td>
		<td align="left"><input type="text" name="homepage" value="<%=restaurant.getHomepage()%>"></td>
		</tr>
		<td align="center">맛집 소개</td>
		<td><textarea rows="10" cols="45" name="detail"><%=restaurant.getDetail()%></textarea></td>
		</tr>
		<tr> 
		<td align="center">식당 사진</td>
		<td>
		<img src="../data/<%=restaurant.getImage()%>" width="200" height="200">
		<input type="file" name="image"></td>
		</tr>
		
		
		<tr> 
		<td colspan="2" align="center"> 
		<input type="submit" value="수정완료">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="다시쓰기">
		</td>
		</tr>	
		</table>
		<input type=hidden name="no" value="<%=restaurant.getNo()%>">
		</form>

	</td>
	</tr>
	</table>

	<%@ include file="Bottom.jsp" %>


</body>
</html>