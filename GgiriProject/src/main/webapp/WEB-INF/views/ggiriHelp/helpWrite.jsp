<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.all {
	width: 1000px;
	margin: 0 auto;
}
textarea{
	width: 800px;
    height: 300px;
    resize: none;
}
.int1 {
	width: 1000px;
}
button {
   width: 60px;
   height: 28px;
   border: none; 
   border-radius: 9999px;
   font-size: 14px;
   background: #B2CCFF;
   font-family: 'IBM Plex Sans KR', sans-serif;
   cursor: pointer;
}
button:hover {
   background-color:#EBF7FF;
    transition: 0.5s;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="all">
		<form action="${contextPath }/ggiriHelp/writeSave" method="post">
		<div>
		<br>
		<div class="int1">
		<h1>접수내용</h1>
		<hr>
		<br>
		<c:if test="${loginUser != null}">
			<b>아이디 </b> &nbsp; <input type="text" name="id" id="id" value="${loginUser }" readonly><br>
			<input type="hidden" name="memberNum" id="memberNum" value="${ggiriMemberInfo.memberNum }">
		</c:if>
		<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
			<b>아이디 </b> &nbsp; <input type="text" name="id" id="id" value="${ggiriSnsInfo.id }" readonly><br>
			<input type="hidden" name="memberNum" id="memberNum" value="${ggiriSnsInfo.memberNum }">
		</c:if>
		<br>
		<b>제 목</b> &nbsp; &nbsp; <input type="text" id="title" name="title"><br>
		<br>
		<b style="display: block;">내용</b><br>
		<textarea rows="50px" cols="50px" id="content" name="content"></textarea>
		<br>
		</div>
		<br>
		<div class="int2">
		<h1>답변은 아래에 적힌 개인정보로 연락드리겠습니다</h1>
		<hr>
		<br>
		<c:if test="${loginUser !=null }">
		<b>이메일</b><p>${ggiriMemberInfo.email }</p>
		<b>전화번호</b><p>${ggiriMemberInfo.tel }</p>
		</c:if>
		<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
		<b>이메일</b><p>${ggiriSnsInfo.email }</p>
		<b>전화번호</b><p>${ggiriSnsInfo.tel }</p>
		</c:if>
		</div>
		<br>
		<div style = "display: flex; justify-content: center;">
		<button type="submit">완료</button>
		</div>
		</div>
		</form>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>