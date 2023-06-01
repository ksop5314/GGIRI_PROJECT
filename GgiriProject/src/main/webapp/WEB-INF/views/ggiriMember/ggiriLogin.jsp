<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<style type="text/css">
.ggiriPage {
	width: 1000px;
	margin: auto;
}
.ggiriPage login {
	text-align: left;	
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.ggiriLoginTxt {
	text-align: center;
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
.ggiriLogin {
	border-radius: 40px 80px / 80px 40px;
	background-color: #EBF7FF;
}

.ggiriLogin submit {
	background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 75px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}

#signup {
    background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 75px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}

#signup:hover {
      background-color:#FFA07A;
      transition: 0.5s;
}
#login {
	background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 75px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}
#login:hover {
	background-color:#FFA07A;
    transition: 0.5s;
}
#findIdPwd {
	background-color:#FFA07A;
	color: white;
    border:none; 
    border-radius:15px; 
    min-height: 30px; 
    min-width: 163px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}
#findIdPwd:hover {
	background-color: #FA8072;
	transition: 0.5s;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="ggiriPage">
	<br>
	<h1 id="loginTitle">Login</h1>
	<br>
		<div class="ggiriLoginTxt"><br>
		함께 나눌수록 더욱 커지는 가치,<br>
		IT 전문가 세상 '끼리'에 오신것을 환영합니다.
		<br><br>
		'끼리'는 기업과 프리랜서를<br>
		연결합니다
		<br><br>
		<div class="ggiriLogin">
		<br>
		<form action="${contextPath }/ggiriMember/login_check" method="post">
			<input type="text" name="id" placeholder="ID"><br>
			<br>
			<input type="password" name="pwd" placeholder="PASSWORD"><br>
			<br>
			<input type="submit" id="login" value="로그인"> &nbsp;
			<button class="signup" id="signup" type="button" onclick="location.href='${contextPath}/ggiriMember/signup_free'">회원가입</button>
			<br><br>
			<button class="findIdPwd" id="findIdPwd" type="button" onclick="location.href='${contextPath }/ggiriMember/findIdPwd'">아이디/비밀번호 찾기</button>
		</form>
		<br>
		</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>

