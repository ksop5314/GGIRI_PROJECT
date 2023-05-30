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
		text-align: center;
	}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="ggiriPage">
	<br>
	<form action="${contextPath }/ggiriMember/user_check" method="post">
		<input type="text" name="id" placeholder="ID"><br>
		<br>
		<input type="password" name="pwd" placeholder="PASSWORD"><br>
		<br>
		<input type="submit" value="login"> &nbsp; <a href="${contextPath }/ggiriMember/signup_free">회원가입</a>
	</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>





























