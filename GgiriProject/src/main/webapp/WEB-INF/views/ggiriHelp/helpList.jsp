<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.freeTxt {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
	float:left;
}

#freeInput {
 	border-radius: 15px;
	font-size: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
	float: right;
    min-height: 50px; 
    min-width: 170px;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
}
#freeInput:hover {
	background-color: white;
	transition: 0.5s;
}
a{
	text-decoration: none;
	color: black;
	text-align: left;
}

span{
	text-color: black;
	text-align: right;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div>
		<button class="freeInput" id="freeInput" type="button"onclick="location.href='${contextPath}/ggiriHelp/helpWrite'"> 요청사항 등록하기 </button>
	</div>
	<div>
		<h1>문의사항</h1>
		<br>
		<c:forEach var="list" items="${helpList }">
		<hr>
		<div>
			<a href="../ggiriHelp/helpView?helpNo=${list.helpNo }">${list.title }</a><span>${list.helpDate }</span>
		</div>
		</c:forEach>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>