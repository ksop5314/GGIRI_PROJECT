<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>       
<%
String memberId = request.getParameter("id");
String color = request.getParameter("color");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
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
}*/
/* #first{
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background: rgba(210, 240, 250, 0.9);
} */
.all{
	margin: 0 auto;
	width: 1000px;
}
#id{
	margin-right: auto;
    margin-left: auto;
    border: none;
    width: 800px;
    border-radius: 40px;
    height: 100px;
    text-align: center;
    padding: 50px 0 50px 0;
    font-size: 50px;
    color: black;
    vertical-align: middle;
<%--     background-color: <%= color %>;
 --%>}

/* #id p{
	color: green;
  	font-size:25px;
  	line-height:300px;
} */

#skill {
	padding: 10px;
    font-size: 20px;
    width: fit-content;
    margin: auto;
    border-radius: 40px;
    background-color: #BAE3F9;
}
a {
	text-decoration: none;
}
#but {
	float: right;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
		<div class="all">
			<div class="intro">
			<br>
			<p id="id" style="background-color:<%= color %>">"${info.id }"</p>
			<br>
				<h1>${info.introduce }</h1>
				<b>${info.id }</b><br><br>
					<c:forEach var="selectedSkill" items="${info.skill}">
				        <div style="display:inline" id="skill">${selectedSkill}</div>
				    </c:forEach>
						<input type="hidden" id="freeNum" name="freeNum" value="${info.memberNum }">
						<br><br><b>${info.id} 소개 URL </b><br>
					<b><a href="${info.url_name }" target="_blank">${info.url_name }</a></b>
				<c:set var="id" value="${info.id }"/>
				<div id="but">
				<c:if test="${info.id == loginUser }">
					<b><input type="submit" value="수정" onclick="location.href='${contextPath}/ggiriMember/writeFreeModifyForm?id=${info.id }'">
					&nbsp; <input type="submit" value="삭제" onclick="location.href='${contextPath}/ggiriMember/writeFreeDelete?id=${info.id }'"></b>
				</c:if>
				<c:if test="${info.id == kakaoMember.id || info.id == googleMember.id || info.id == naverMember.id }">
					<b><input type="submit" value="수정" onclick="location.href='${contextPath}/ggiriMember/writeFreeModifyForm?id=${info.id }'">
					&nbsp; <input type="submit" value="삭제" onclick="location.href='${contextPath}/ggiriMember/writeFreeDelete?id=${info.id }'"></b>
				</c:if>
				</div>
			<br><br>
		</div>
		<hr>
		<br>
		<div class="proCon">
		<h1>완성한 프로젝트 내용 </h1>
			<c:forEach var="list" items="${list }">
				<h2>> <a href="${contextPath }/ggiriComplete/completeView?completeNum=${list.completeNum }">${list.title }</a></h2>
					 <br>
					 <c:forEach var="selectedSkill" items="${list.skill}">
				     	<div style="display:inline" id="skill">${selectedSkill}</div>
				     </c:forEach>
					<br><br>
					<b>함께 진행한 팀원</b>
					<br><b>${list.members }</b>
			</c:forEach>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>