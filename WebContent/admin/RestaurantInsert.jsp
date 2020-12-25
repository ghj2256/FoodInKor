<%@ page contentType="text/html;charset=UTF-8" %>
  <meta charset="utf-8">

<!-- --------------------------맛집등록 ------------------------- -->

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

		<form method="post" action="RestaurantProc.jsp?flag=insert" enctype="multipart/form-data">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center"><font color="#FFFFFF">맛집 등록</font></td>
		</tr>
		<tr> 
		<td align="center">맛집 이름</td>
		<td align="left"><input type="text" name="name" size="20"></td>
		</tr>
		<tr> 
		<td align="center">주소</td>
		<td align="left"><input type="text" name="address" size="20"></td>
		</tr>
		<tr> 
		<tr> 
		<td align="center">전화번호</td>
		<td align="left"><input type="text" name="tel" size="20"></td>
		</tr>
		<tr> 
		<td align="center">음식 종류</td>
		<td align="left">
		<select name="type">
		<option value="0">선택하세요.
		<option value="한식">한식
		<option value="분식">분식
		<option value="중식">중식
		<option value="일식">일식
		<option value="카페,디저트">카페,디저트
		<option value="패스트푸드">패스트푸드
		</select>
		</tr>
		<tr> 
		<td align="center">가격대</td>
		<td align="left"><input type="text" name="price" size="20">원</td>
		</tr>
		<tr> 
		<td align="center">영업 시간</td>
		<td align="left"><input type="text" name="openhour" size="20"></td>
		</tr>
		<tr> 
		<td align="center">홈페이지 주소</td>
		<td align="left"><input type="text" name="homepage" size="20"></td>
		</tr>
		<td align="center">맛집 소개</td>
		<td><textarea rows="10" cols="45" name="detail"></textarea></td>
		</tr>
		<tr> 
		<td align="center">식당 사진</td>
		<td><input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
		<input type="submit" value="맛집등록">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="다시쓰기">
		</td>
		</tr>
		</table>
		</form>

	
	</td>
	</tr>
	</table>

	<%@ include file="Bottom.jsp" %>

</body>
</html>

