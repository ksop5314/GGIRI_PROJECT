<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type='text/javascript'>
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
div{
	margin-right: auto;
	margin-left: auto;
}
#id{
	margin-right: auto;
    margin-left: auto;
    background-color: ;
    border: none;
    width: 800px;
    height: 100px;
    text-align: center;
    padding: 50px 0 50px 0;
    font-size: 50px;
    color: white;
}
#id p {
	color:white;
  	font-size:25px;
  	line-height:300px;
}
table {
	margin-right: auto;
	margin-left: auto;
	
	border-radious: 30px;
}
table tr{
	border-style: hidden;
}
table td{
	context-align: center;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
			
			<!-- <input type="hidden" id="writeNo" name="writeNo"> -->
			<br>
			<p id="id">"${info.id }"</p>
			<br>
			<table>
				<tr>
					<td><b>소개 : </b>"${info.introduce }"</td>
				</tr>
				<tr>	
					<td><b>가능한 기술 : </b>"${info.skill }"</td>
				</tr>
				<tr>
				<tr>
					<td><b>${info.id}님의 Git 주소 : </b><a href="${info.url_name }" target="_blank">${info.url_name }</a></td>
					<td>
						<input type="hidden" id="freeNum" name="freeNum" value="${info.memberNum }">
						<b>${info.id}님의 깃주소 : </b><a href="${info.url_name }" target="_blank">${info.url_name }</a>
					</td>
				</tr>
				<c:set var="id" value="${info.id }"/>
				<c:if test="${info.id == loginUser }">
				<tr>
					<td><input type="submit" value="수정" onclick="location.href='${contextPath}/ggiriMember/writeFreeModifyForm?id=${info.id }'"><input type="submit" value="삭제" onclick="location.href='${contextPath}/ggiriMember/writeFreeDelete?id=${info.id }'"></td>
				</tr>
				</c:if>
			</table>
			<br>
	<h1 style="text-align: center;"> 완성한 프로젝트 내용 </h1>
	<%-- <c:forEach var="list" items="${list }">
		<hr>
		<table border="1">
			<tr>
				<th><br> 프로젝트 제목 </th>
			</tr>
			<tr>
				<td id="porTitle"><br><a href="${contextPath }/ggiriComplete/completeView?completeNum=${list.completeNum }">${list.title }</a></td>
			</tr>
			<tr>
				<th><br> 이런 스킬을 사용했어요. </th>
			</tr>
			<tr>
				<td><br><pre><c:out value="${list.skill }"/></pre></td>
			</tr>
			<tr>
				<th><br> 함께 진행한 팀원들을 소개할게요. </th>
			</tr>
			<tr>
				<td><br>${list.members }</td>
			</tr>
			
		</table>
	</c:forEach> --%>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>