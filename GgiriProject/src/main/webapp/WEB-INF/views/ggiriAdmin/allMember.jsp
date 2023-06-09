<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allMember</title>
</head>
<body>
	<c:import url="../defaultAdmin/header.jsp"/>
 		<br>
 		<div class="wrap">
			<div class="freeTxt">
				<p>끼리가 보증하는 IT파트너</p>
				<p id="h">프로젝트 등록하면<br>
				더 정확한 추천을 받을 수 있어요</p>
				<br>
			</div>
			<br><br><br><br><br>
			<div style="text-align: center;">
				<h2 style="margin-right: 250px; padding-bottom: 30px;">회원 정보</h2>
				<table style="margin: auto; width: 80%;">
					<tr>
						<th>회원이름</th><th>회원ID</th><th>비밀번호</th><th>생년월일</th><th>성별</th><th>이메일</th><th>전화번호</th><th>주소</th>
					</tr>
					<c:forEach var="list" items="${allMember }">
						<tr>
							<td>${list.name }</td><td>${list.id }</td><td>${list.pwd }</td><td>${list.birth }</td><td>${list.gender }</td><td>${list.email }</td><td>${list.tel }</td><td>${list.addr }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	<c:import url="../defaultAdmin/footer.jsp"/>
</body>
</html>