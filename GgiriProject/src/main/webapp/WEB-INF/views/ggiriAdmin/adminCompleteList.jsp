<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminCompleteList</title>
</head>
<body>
	<c:import url="../defaultAdmin/header.jsp"/>
 		<br>
 		<div class="wrap">
			<div class="freeTxt">
				<p>끼리가 보증하는 IT파트너</p>
				<p id="h">관리자 페이지 입니다.<br>
				등록된 프리랜서를 확인하세요.</p>
				<br>
			</div>
			<br><br><br><br><br>
			<div style="text-align: center;">
				<h2 style="margin-right: 250px; padding-bottom: 30px;">프리랜서 등록 정보</h2>
				<table style="margin: auto; width: 80%;">
					<tr>
						<th>프로젝트 번호</th><th>회원ID</th><th>프로젝트 이름</th><th>프로젝트 등록날짜</th><th></th>
					</tr>
					<c:forEach var="list" items="${adminProjectList }">
						<tr>
							<td>${list.projectNum }</td><td>${list.id }</td><td>${list.title }</td><td>${list.prodate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	<c:import url="../defaultAdmin/footer.jsp"/>
</body>
</html>