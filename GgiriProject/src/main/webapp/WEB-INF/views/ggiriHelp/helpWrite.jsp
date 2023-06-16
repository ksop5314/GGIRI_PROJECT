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
textarea{
	width: 60%;
    height: 6.25em;
    resize: none;
    background-color: #d8d8d8;
}
input{
	background-color: #d8d8d8;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div>
		<form action="${contextPath }/ggiriHelp/writeSave" method="post">
		<div>
		<br>
		<h1>접수내용</h1>
		<hr>
		<br>
		<c:if test="${loginUser != null}">
		<b>아이디 </b> &nbsp; <input type="text" name="id" id="id" value="${loginUser }" readonly><br>
			<input type="hidden" name="memberNum" id="memberNum" value="${ggiriMemberInfo.memberNum }">
		</c:if>
		<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
			<input type="text" name="id" id="id" value="${ggiriSnsInfo.id }" readonly><br>
			<input type="hidden" name="memberNum" id="memberNum" value="${ggiriSnsInfo.memberNum }">
		</c:if>
		
		<b>제목   </b> &nbsp; &nbsp; <input type="text" id="title" name="title"><br>
		<br>
		<b style="display: block;">내용</b> &nbsp;  &nbsp;  &nbsp; &nbsp; <textarea rows="50px" cols="50px" id="content" name="content"></textarea>
		<br>
		<h1>답변은 아래에 적힌 개인정보로 연락드리겠습니다</h1>
		<hr>
		<br>
		<b>이메일</b> &nbsp; &nbsp; <p>${ggiriMemberInfo.email }</p>
		<b>전화번호</b> &nbsp; &nbsp; <p>${ggiriMemberInfo.tel }</p>
		
		<button type="submit">완료</button>
		</div>
		</form>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>