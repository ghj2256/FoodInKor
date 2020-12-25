<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserAccecss" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String Gender = null;
	String userName = null;
	String Address[] = request.getParameterValues("SelectLocal");
	String Email = null;
	
	if(request.getParameter("InputID")!=null){
		userID = (String) request.getParameter("InputID");
	}
	if(request.getParameter("InputPassword")!=null){
		userPassword = (String) request.getParameter("InputPassword");
	}
	if(request.getParameter("InputName")!=null){
		userName = (String) request.getParameter("InputName");
	}
	if(request.getParameter("InputGender")!=null){
		Gender = (String) request.getParameter("InputGender"); /////////gender는 이후에 라디오버튼이나 체크박스로 변경
	}
	//if(request.getParameter("SelectLocal")!=null){
		Address = request.getParameterValues("SelectLocal");
	//}
	if(request.getParameter("InputEmail")!=null){
		Email = (String) request.getParameter("InputEmail");
	}
	if( userID == null|| userPassword == null|| userName == null|| Gender == null || Address == null|| Email == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력 안 된 사항 있음!')");
		script.println("location.href='../join.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	UserAccecss memberAccess = new UserAccecss();
	int result = memberAccess.join(userID, userPassword, userName, Gender, Email, Address[0]);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입 성공!')");
		script.println("location.href='../Index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>
