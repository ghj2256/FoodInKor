<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String radio1="male";
	String radio2="female";
%>
<form action="module/joinProc.jsp" method="post">
  <fieldset>
    <legend>정보수정</legend>
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" name="InputEmail" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
      <label for="InputId">ID</label>
      <input type="text" class="form-control" name="InputID" id="InputId" placeholder="Enter Id">
    </div>
    <div class="form-group">
      <label for="InputName">Name</label>
      <input type="text" class="form-control" name="InputName" id="InputName" placeholder="Enter Name">
    </div>
    <div>
    	<label for="InputName">Gender</label>
	    <div class="form-check">
	      <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="InputGender" id="optionsRadios1" value="<%=radio1 %>" >
	        	 남성
	       </label>
	      </div>
	    <div class="form-check">
	      <label class="form-check-label">
	          <input type="radio" class="form-check-input" name="InputGender" id="optionsRadios2" value="<%=radio2 %>">
	          	여성
	      </label>
	    </div>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" name="InputPassword" id="exampleInputPassword1" placeholder="Password">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password Check</label>
      <input type="password" class="form-control" id="InputPasswordCheck" placeholder="Password Write Again" onchange="isSame()">
    </div>
    <div class="registrationFormAlert" id="divCheckPasswordMatch">
    </div><p>
    <div class="form-group">
      <label for="exampleSelect1">선호 지역 선택</label>
      <select class="form-control" name="SelectLocal" id="exampleSelect1">
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="인천">인천</option>
        <option value="부산">부산</option>
        <option value="제주">제주</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">수정</button>
  </fieldset>
</form>
<script type="text/javascript">
	function isSame() {
		var pw = $("#exampleInputPassword1").val();
		var confirmPw = $("#InputPasswordCheck").val();
		
		if(pw != confirmPw){
			$("#divCheckPasswordMatch").html("Passwords do not match!");
			$("#divCheckPasswordMatch").style.color="red";
		}
	    else
	        $("#divCheckPasswordMatch").html("Passwords match.");
	}
	$(document).ready(function(){
		$("#InputPasswordCheck, #InputPasswordCheck").keyup(isSame);
	});
</script>