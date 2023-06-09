<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
	margin: 0;
}
/* #modal_wrap{
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0; left: 0; right: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
}
#first{
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background: rgba(210, 240, 250, 0.9);
} */
div .project{
	margin-right: auto;
	margin-left: auto;
}
#id{
	margin-right: auto;
	margin-left: auto;
	background-color: blue;
	border: 1px solid black;
	width: 800px;
	height: 100px;
	text-align: center;
	padding: 50px 0 50px 0;
	font-size: 50px;
	color: white;
}
table {
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
			
			<!-- <input type="hidden" id="writeNo" name="writeNo"> -->
			
			<p id="id">"${info.id }"</p>
			<table>
				<tr>
					<td><b>소개 : </b>"${info.introduce }"</td>
				</tr>
				<tr>	
					<td><b>가능한 기술 : </b>"${info.skill }"</td>
				</tr>
				<tr>
				<tr>
					<td><b>${info.id}님의 깃주소 : </b><a href="${info.url_name }" target="_blank">${info.url_name }</a></td>
				</tr>
				<c:set var="id" value="${info.id }"/>
				<c:if test="${info.id == loginUser }">
				<tr>
					<td><input type="submit"  value="수정" onclick="location.href='${contextPath}/ggiriMember/writeFreeModifyForm?id=${info.id }'"><input type="submit" value="삭제" onclick="location.href='${contextPath}/ggiriMember/writeFreeDelete?id=${info.id }'"></td>
				</tr>
				</c:if>
			</table>
			<br>
			<div class="project">
				<button class="h1" type="submit" onclick="projecList()" id="pro"> 내가 완료한 프로젝트 </button>
			</div>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>