
<!-- ggiriComplete/completeList.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriComplete/completeList.jsp</title>
<style type="text/css">
table { border-collapse: collapse; }
.wrap{
	width: 1000px;
	margin: auto;
	text-align: left;
}
.skill{
	font-family: 'IBM Plex Sans KR', sans-serif;
	display: inline-block;
	float: right;
	
}
form{
	float:left; 
	margin-right: 15px;
}
.box_area{
	border: 1px solid white;
	width: 1000px;
	height: 200px;
}

#h3{
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
	background-color: white;
	border-color: gray;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
#h3:hover{
	background-color: #EAEAEA;
	border-color: black;
	cursor: pointer;
}
#id{
	border: 1px solid white;
	background-color: blue;
	text-weight: bold;
	width: 300px; 
	height: 300px;
	text-align: center;
	color: black;
	font-size: 30px;
}
.freeTxt {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
	float:left;
}
div #h{
	font-size: 24px;
	font-weight: bolder;
}
a{
	text-decoration: none;
	/* color: white; */
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
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<br>
	<div class="wrap">
		<div class="freeTxt">
			<p>끼리가 보증하는 IT파트너</p>
			<p id="h">프로젝트 등록하면<br>
			더 정확한 추천을 받을 수 있어요</p>
			<br>
		</div> 
		<br><br><br><br><br>
		<div class="skill">
			<form method="get" action="main">
				<button id="h3" type="submit" style=" border-radius: 30px;"> 2020 </button>
			</form>
			<form action="#">
				<button id="h3" type="submit" style=" border-radius: 30px;"> 2021  </button> 
			</form>
			<form action="#">
			 	<button id="h3" type="submit" style=" border-radius: 30px;"> 2022 </button> 
			</form>
			<form action="#">
				<button id="h3" type="submit" style=" border-radius: 30px;"> 2023 </button> 
			</form>
		</div>
	</div>
	<br><br><br>
	<div class="wrap board_table">
	<h1></h1>
	<br>
		<table border="1">
			<tr style="text-align: center">
				<th style="display: none"> 글번호 </th>
				<th style="display: none"> 작성자 </th>
				<th width="700px"> 제 목 </th>
				<th> 날 짜 </th>
				<th width="100px"> 조회수 </th>
			</tr>
			<c:if test="${completeList.size()==0 }">
				<tr>
					<th colspan="6"> 등록된 글이 없습니다 </th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${completeList }">
				<tr style="text-align: right">
					<td style="display: none" >${dto.completeNum }</td>
					<td style="display: none">${dto.id }</td>
					<td><a href="../ggiriComplete/completeView?completeNum=${dto.completeNum }">${dto.title }</a></td>
					<td>${dto.comdate }</td>
					<td>${dto.comHit }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>