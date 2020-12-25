<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String) request.getParameter("searchItem");
	String text = (String) request.getParameter("searchContent");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<jsp:include page="../bootLink/link.jsp"/>
	</head>
	<body>
			<%
				if(name.equals("상호명")){
			%>
				<jsp:forward page="MenuClickList/searchNameRestaurant.jsp"/>
			<%
				} else if(name.equals("지역명")){
			%>
				<jsp:forward page="MenuClickList/searchLocalRestaurant.jsp"/>
			<%  } %> 
	</body>
</html>