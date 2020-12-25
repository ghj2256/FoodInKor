<%@page import="user.User"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.*,admin.*"%>
<jsp:useBean id="userMgr" class="admin.UserMgr" />
  <meta charset="utf-8">

<!---------------------------------- 회원가입 했을 때 관리자 페이지에 등록되는 사용자 페이지 ------------------------------->

<html>
<head>
<title>FoodInKor Admin</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %> 
	
	<%Vector vResult= userMgr.getUserList();%>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td align="center"><font color="#FFFFFF">회원이름</font></td>
		<td align="center"><font color="#FFFFFF">회원아이디</font></td>
		<td align="center"><font color="#FFFFFF">패스워드</font></td>
		<td align="center"><font color="#FFFFFF">성별</font></td> 
		<td align="center"><font color="#FFFFFF">이메일</font></td>
		<td align="center"><font color="#FFFFFF">수정</font></td>
		</tr>
		<%
		for(int i=0; i<vResult.size(); i++){
		User regBean = (User)vResult.get(i);
		%>
		<tr> 
		<td align="center"><%=regBean.getUserName()%></a></td>
		<td align="center"><%=regBean.getUserID()%></td>
		<td align="center"><%=regBean.getUserPassword()%></td>
		<td align="center"><%=regBean.getGender()%></td>
		<td align="center"><%=regBean.getEmail()%></td>
		<td align="center"><a href="javascript:Update('<%=regBean.getUserID()%>')">수정하기</a></td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>


	<%@ include file="Bottom.jsp" %>

	<form name="update" method="post" action="UserUpdate.jsp">
	<input type=hidden name="mem_id">
	</form>

</body>
</html>
