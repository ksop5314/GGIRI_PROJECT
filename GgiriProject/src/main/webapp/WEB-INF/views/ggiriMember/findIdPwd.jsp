<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdPwd</title>
<style type="text/css">
	.findIdPwdPage {
		width: 1000px;
		margin: auto;
		text-align: center;
	}
	
	.findTitle {
		margin-top: 100px;
		text-align: left;
	}
	
	.findarea {
		border: 3px solid navy;
		border-radius: 50px;
		width: 100%;
		height: 300px;
		margin-top: 30px;
		background: navy;
	}
	
	input[type=text] {
		border: 1px solid navy;
		border-radius: 10px;
		width: 400px;
		height: 40px;
		margin: 90px 0 80px 0;
		font-size: 18px;
	}
	
	input[type=submit] {
		border: 1px solid black;
		border-radius: 10px;
		width: 150px;
		height: 60px;
		font-size: 22px;
		font-weight: bold;
		background: orange;
	}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="findIdPwdPage">
		<div class="findTitle">
			<h1> 아이디/비밀번호 찾기 </h1>
		</div>
		<form action="${contextPath }/ggiriMember/findEmail" method="post">
			<div class="findarea">
				<label for="findEmail" style="font-size: 18px; font-weight: bold; color: orange;">이메일</label>&nbsp;
				<input type="text" id="findEmail" name="findEmail"><br>
				<input type="submit" value="확인">
			</div>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>