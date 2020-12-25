<%@ page contentType="text/html;charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import ="java.util.*,admin.*" %> 
<jsp:useBean id="userMgr" class="admin.UserMgr" />
<jsp:useBean id="userBean" class="user.User">
<jsp:setProperty name="userBean" property="*" />
</jsp:useBean>

<!----------------------------- 회원 수정완료 눌렀을 때의 action 페이지 ------------------------->

<%
	String email = request.getParameter("Email");
	String gender = request.getParameter("Gender");
	userBean.setEmail(email);
	userBean.setGender(gender);
    boolean flag = userMgr.UserUpdate(userBean);
%>

<html>
<head>
<title>회원수정 처리</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#FFFFCC">
<br><br>
<center>
<%
if(flag){
%>
		<script>
		alert("성공적으로 수정하였습니다");
		location.href="UserMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>
</center>
</body>
</html>