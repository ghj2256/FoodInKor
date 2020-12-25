<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,admin.*"%>

<jsp:useBean id="foodMgr" class="admin.RestaurantMgr" />
  <meta charset="utf-8">

<!-- ------------------- 관리자페이지의 맛집 리스트 ------------------------ -->

<html>
<head>
<title>FoodInKor Admin</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
 
<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %>


	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
 
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td align="center"><font color="#FFFFFF">맛집 이름</font></td>
		<td align="center"><font color="#FFFFFF">종류</font></td>
		<td align="center"><font color="#FFFFFF">날짜</font></td>
		<td align="center"><font color="#FFFFFF">가격대</td>
		<td align="center">&nbsp;</font></td>
		</tr>
		<%
		Vector vResult= foodMgr.getRestaurantList();
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">등록된 상품이 없습니다.</td>
		</tr>
		<%
			}else{
			for(int i=0; i<vResult.size(); i++){
			RestaurantBean restaurant = (RestaurantBean)vResult.get(i);
		%>
		<tr> 
		<td align="center"><%=restaurant.getName()%></td>
		<td align="center"><%=restaurant.getType()%></td>
		<td align="center"><%=restaurant.getDate()%></td>
		<td align="center"><%=restaurant.getPrice()%></td>
		<td align="center"><a href="javascript:restaurantDetail('<%=restaurant.getNo()%>')">상세보기</a></td>
		</tr>
		<%}
		}%>
		<tr>
		<td colspan="5" align="center"><a href="RestaurantInsert.jsp">맛집등록</a></td>
		</tr>
		</table>
		
	</td>
	</tr>
	</table>

	<%@ include file="Bottom.jsp" %>
	
	<form name="detail" method="post" action="RestaurantDetail.jsp" >
	<input type="hidden" name="no">
	</form>

</body>
</html>
   