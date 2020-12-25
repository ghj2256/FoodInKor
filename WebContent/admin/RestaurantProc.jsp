<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<jsp:useBean id="foodMgr" class="admin.RestaurantMgr" />

<!-- ------------------맛집 등록, 수정, 삭제에 대한 action 페이지 -------------------- -->

<%
	String flag = request.getParameter("flag");
	boolean result = false;	
	
	if(flag.equals("insert")){
		
    	result=foodMgr.insertRestaurant(request);
	}else if(flag.equals("update")){
    	result=foodMgr.updateRestaurant(request);
    }else if(flag.equals("delete")){
		result=foodMgr.deleteRestaurant(request.getParameter("no"));
	}else{
		response.sendRedirect("RestaurantMgr.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="RestaurantMgr.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="RestaurantMgr.jsp";
	  </script>
<%	}%>