<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*,admin.*" %> 
<jsp:useBean id="userMgr" class="admin.UserMgr" />

<!-- ------------------ 관리자 로그인 action 페이지 --------------------- -->

<%
	String adminID = request.getParameter("adminID");
	String adminPassword = request.getParameter("adminPassword");
	boolean adminCheck = userMgr.adminCheck(adminID, adminPassword);
    if(adminCheck) {
	    session.setAttribute("adminKey", "Ok");
	    
%>

	<script>
  	 location.href="Index.jsp";
	</script>

<%}else{%>

   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="AdminLogin.jsp";
   </script>

<%}%>