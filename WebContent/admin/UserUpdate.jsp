<%@page import="user.User"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*,admin.*" %> 
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="userMgr" class="admin.UserMgr" />

<!--------------------------------- 회원수정눌렀을 때 페이지 ------------------------------->
<html>
<head>
<title>회원수정</title>
<link href="/FoodInKorProject/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %>
	<%
	String mem_id = request.getParameter("mem_id");
	User userBean= userMgr.getUser(mem_id);
	%>
	 
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<form name="userForm" method="post" action="UserUpdateProc.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3"><font color="#FFFFFF"><b> 
		<%=userBean.getUserName()%>
		회원님의 정보를 수정합니다.</b></font> </td>
		</tr>
		<tr> 
		<td>아이디</td>
		<td><%=userBean.getUserID()%></td>
		</tr>
		<tr> 
		<td>패스워드</td>
		<td><input type="text" name="userPassword" value="<%=userBean.getUserPassword()%>"></td>
		</tr>
		<tr> 
		<td>이름</td>
		<td><input type="text" name="userName" value="<%=userBean.getUserName()%>"></td>
		</tr>
		<tr> 
		<td>이메일</td>
		<td><input type="text" name="Email"  size="30" value="<%=userBean.getEmail()%>"></td>
		</tr>
		<tr> 
		<td>성별</td>
		<td><input type="text" name="Gender" value="<%=userBean.getGender()%>"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="수정완료"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="다시쓰기"> 
		</td>
		</tr>
		<input type="hidden" name="userID" value="<%=mem_id%>">
		</form>
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="Bottom.jsp" %>
		
</body>
</html>
