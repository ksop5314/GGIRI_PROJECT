<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHelpList</title>
<style type="text/css">

	h1 {
	border: 1px solid orange;
	border-radius: 30px;
	width: 80%;
	height: 80px;
	padding-top: 50px;
	margin: 0 auto;
	background: orange;
	}

</style>
</head>
<body>
	<c:import url="../defaultAdmin/header.jsp"/>
 		<br>
 		<div class="wrap">
			<div class="freeTxt">
				<p>끼리가 보증하는 IT파트너</p>
				<p id="h">관리자 페이지 입니다.<br>
				등록된 고객센터문의 목록을 확인하세요.</p>
				<br>
			</div>
			<br><br><br><br><br>
			<div style="text-align: center;">
				<h1 style="margin-right: auto; padding-bottom: 30px;"> GGIRI <b style="color: red;">관리자</b> 고객센터문의 페이지 </h1><br>
				<table style="margin: auto; width: 100%;">
					<tr>
						<th>회원이름</th><th>회원ID</th><th>회원소개</th><th>회원직업</th><th>보유기술</th><th>프리랜서 삭제</th>
					</tr>
					<c:forEach var="list" items="${boardList }">
						<tr>
							<td>${list.name }</td><td>${list.id }</td><td>${list.introduce }</td><td>${list.job }</td><td>${list.skill }</td>
							<td>
								<div class="delDiv" style="border: 1px solid red; border-radius: 12px; background: red;" onclick="freeDelete('${list.id}')">
									<span id="freeDel"> 삭제 </span>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	<c:import url="../defaultAdmin/footer.jsp"/>
</body>
</html>