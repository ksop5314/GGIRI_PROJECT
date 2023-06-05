
<!-- ggiriProject/projectView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/projectView.jsp</title>
<style type="text/css">
.wrap {
	font-family: 'IBM Plex Sans KR', sans-serif;
}
table { border-collapse: collapse; }
#date {
	float: right;
}
#select {
	display: flex;
	justify-content: center;
}
input[type=button] {
	background-color:#B2CCFF;
	color: black;
	border:none; 
	width: 100px;
	height: 28px;
	font-size: 14px;
	border-radius:15px; 
	font-family: 'IBM Plex Sans KR', sans-serif; 
	cursor: pointer;
}
input[type=button]:hover {
	background-color: #EBF7FF;
	transition: 0.5s;
}
#skill{
	padding: 10px;
	font-size: 20px;
    width:fit-content;
    margin:auto;
    font-family: 'IBM Plex Sans KR', sans-serif;
    border-radius: 40px 80px / 80px 40px;
	background-color: #EBF7FF;
}
#content pre{
	font-family: 'IBM Plex Sans KR', sans-serif; 
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap">
	<br>
	<h1>${data.title }</h1>
	<b>작성자: </b><b>${data.id }</b><b id="date">${data.prodate }</b><br><hr><br>
	<c:forEach var="selectedSkill" items="${data.skill}">
		<div style="display:inline" id="skill">${selectedSkill}</div>
	</c:forEach><br><br>
	<br><br>
	<div id="content">
		<pre><c:out value="${data.content }"/></pre>
	</div>
	<br>
		<div id="reply"></div>
			<div id="select">
				<c:if test="${data.id==loginUser }">
					<input type="button" value="수정" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
					<input type="button" value="삭제" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
				</c:if>
			<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'">
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>

</body>
</html>