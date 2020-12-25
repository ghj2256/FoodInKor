<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="foodMgr" class="admin.RestaurantMgr" />
  <meta charset="utf-8">

<!-------------------------- 맛집관리에서 상세보기 눌렀을 때 ------------------------------>

<html>
<head>
<title>FoodInKor Admin</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %>
	
	<%
			RestaurantBean Restaurant= foodMgr.getRestaurant(request.getParameter("no"));
		%>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="3" align="center"><font color="#FFFFFF"><%=Restaurant.getName()%></font></td>
		</tr>
		<tr> 
		<td width="20%">
		<img src="<%=request.getContextPath()%>/data/<%=Restaurant.getImage()%>" width="200" height="200">
		</td>
		<td width="30%" valign="top">

			<table border="1" width="100%" heigth="100%">
			<tr>
			<td><b>맛집이름 : </b><%=Restaurant.getName()%></td>
			</tr>			
			<tr>
			<td><b>음식종류 : </b><%=Restaurant.getType()%></td>
			</tr>
			<tr>
			<td><b>등록날짜 : </b><%=Restaurant.getDate()%></td>
			</tr>
			<tr>
			<td><b>주     소 : </b><%=Restaurant.getAddress()%></td>
			</tr>
			</table>
		
		</td>
		<td width="50%" valign="top"><b>상세설명</b><br><pre><%=Restaurant.getDetail()%></pre></td>
		</tr>
		<tr> 
		<td colspan="3" align="center">
		<a href="javascript:restaurantUpdate('<%=Restaurant.getNo()%>')">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:restaurantDelete('<%=Restaurant.getNo()%>')">삭제하기</a>
		</td>
		</tr>
		</table>

	</td>
	</tr>
	</table>

	<%@ include file="Bottom.jsp" %>

	<form name="update" method="post" action="RestaurantUpdate.jsp">
	<input type=hidden name=no>
	</form>
	
	<form name="del" method="post" action="RestaurantProc.jsp?flag=delete">
	<input type=hidden name=no>
	</form>


</body>
</html>


