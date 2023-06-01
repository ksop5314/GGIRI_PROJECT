<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectList.jsp</title>
<style type="text/css">
table { border-collapse: collapse; }
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap board_table">
	<h1>프로젝트 보기</h1>
		<table border="1">
			<tr style="text-align: center">
				<th width="50px"> 번 호 </th>
				<th style="display: none" width="100px"> ID </th>
				<th width="600px"> 제 목 </th>
				<th width="300px"> 날 짜 </th>
				<th width="50px"> 조회수 </th>
			</tr>
			<c:if test="${projectList.size()==0 }">
				<tr>
					<th colspan="6"> 등록된 글이 없습니다 </th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${projectList }">
				<tr style="text-align: right">
					<td>${dto.projectNum }</td>
					<td style="display: none">${dto.id }</td>
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
			<tr style="text-align: right">
				<td colspan="6">
					<a href="../ggiriProject/projectWrite">글 쓰기</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>