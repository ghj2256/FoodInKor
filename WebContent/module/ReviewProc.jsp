<%@ page language="java"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<meta charset="utf-8">
<jsp:useBean id="reviewMgr" class="review.ReviewMgr" />

<!-- ------------------맛집 등록, 수정, 삭제에 대한 action 페이지 -------------------- -->

<%
	String restaurantNo = null;
	String reviewUserID = null;
	String reviewContents = null;
	String reviewRating = null;

	restaurantNo = (String) request.getParameter("restaurantNo");
	reviewUserID = (String) request.getParameter("reviewUserID");
	reviewContents = (String) request.getParameter("Comment");
	reviewRating = (String) request.getParameter("Rating");

	
	boolean result = false;	
    result = reviewMgr.insertReview(restaurantNo, reviewUserID, reviewContents, reviewRating);
	

    if (result) {
    	%>
    	<script>
    		self.window.alert("입력한 글을 저장하였습니다."); 
    		history.go(-2); 
    	</script>
    	 <%
    }
%>
	<%--   <script>
	    alert("처리하였습니다");
		location.href="RestaurantDetail.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="RestaurantDetail.jsp";
	  </script>
<%	}%> --%>