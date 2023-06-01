<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectList.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<h1>프로젝트 보기</h1>
	<div class="wrap board_table">
		<table border="1">
			<tr>
				<th width="50px"> 번 호 </th>
				<th width="150px"> ID </th>
				<th width="200px"> 제 목 </th>
				<th width="200px"> 날 짜 </th>
				<th width="50px"> 조회수 </th>
			</tr>
			<c:if test="${projectList.size()==0 }">
				<tr>
					<th colspan="6"> 등록된 글이 없습니다 </th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${projectList }">
				<tr>
					<td>${dto.projectNum }</td>
					<td>${dto.id }</td>
					<td><a href="../ggiriProject/projectView?projectNum=${dto.projectNum }">${dto.title }</a></td>
					<td>${dto.prodate }</td>
					<td>${dto.proHit }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="center">
					<c:forEach var="num" begin="1" end="${repeat }">
						<a href="projectList?num=${num }">[ ${num } ]</a>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="${contextPath }/ggiriProject/projectWrite">글 쓰기</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>