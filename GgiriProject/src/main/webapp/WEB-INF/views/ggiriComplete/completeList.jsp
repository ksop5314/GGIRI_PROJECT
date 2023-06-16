
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
table {
	width: 1100px;
	margin: 0 auto;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
table th {
	text-align: center;
}
table th,td {
	border-bottom: 2px solid gray;
	padding: 20px 0 20px 0;
}

table td {
	padding: 5px 0 7px 8px;
	text-align: center;
	width: 100px;
}
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
#button1 {
	width: 60px;
	height: 28px;
	border: none; 
	border-radius: 9999px;
	font-size: 14px;
	background: #B2CCFF;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
}
#button1:hover {
	background-color:#EBF7FF;
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
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2020 </button> &nbsp;&nbsp;&nbsp;
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2021  </button> &nbsp;&nbsp;&nbsp;
		 	<button id="h3" type="submit" style=" border-radius: 30px;"> 2022 </button> &nbsp;&nbsp;&nbsp;
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2023 </button> &nbsp;&nbsp;
		</div>
		<br><br><br><br><hr>
	</div>
	<div class="wrap board_table">
	<h1></h1>
	<br>
		<table style="border:1px solid white;">
			<tr>
				<th style="display: none" width="50px"> 글번호 </th>
				<th style="display: none" width="100px"> 작성자 </th>
				<th width="700px"> 제 목 </th>
				<th width="150px"> 날 짜 </th>
				<th width="75px"> 조회수 </th>
				<!-- <th width="50px"> 좋아요 </th> -->
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
					<td height="100px"><a href="../ggiriComplete/completeView?completeNum=${dto.completeNum }">${dto.title }</a></td>
					<td>${dto.comdate }</td>
					<td>${dto.comHit }</td>
			        <%-- <td>${dto.likeCount }</td> --%>
				</tr>
			</c:forEach>
		</table>
		<br>
		<form action="projectList.do" method="get">
			<label for="condition" style="font-family: 'IBM Plex Sans KR', sans-serif">검색조건</label><br>
			<select name="condition" id="condition" style="font-family: 'IBM Plex Sans KR', sans-serif">
				<option value="titleContent" <c:if test="${condition eq 'titleContent' }">selected</c:if>>제목 + 본문</option>
				<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>작성자</option>
			</select>
			<input type="text" name="keyword" id="keyword" style="font-family: 'IBM Plex Sans KR', sans-serif"
					placeholder="검색어" value="${keyword }"/>
			<button id="button1" type="submit">검색</button>
		</form>
	</div>
	<br>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>