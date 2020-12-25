<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("AdminLogin.jsp");
		// adminKey 어트리뷰트가 널값이면 로그인 화면
		// 아니면 탑 모듈 생성
	}
%>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#FFCC00"> 
    <td align="center"><b><a href="../Index.jsp" target ="_blank">사이트 홈 </a></b></td>
     <td align="center"><b><a href="Index.jsp">관리자 홈 </a></b></td>
    <td align="center"><b><a href="AdminLogout.jsp">관리자 로그아웃 </a></b></td>
    <td align="center"><b><a href="UserMgr.jsp">회원 관리 </a></b></td>
    <td align="center"><b><a href="RestaurantMgr.jsp">맛집 관리 </a></b></td>
  </tr>
</table> 