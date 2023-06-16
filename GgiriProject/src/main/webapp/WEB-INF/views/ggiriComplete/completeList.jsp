
<!-- ggiriComplete/completeList.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriComplete/completeList.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
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
#h3{
	font-family: 'IBM Plex Sans KR', sans-serif;
	border: hidden;
	color: white;
	background-color: #9cded5;
	margin: 10px;
	padding: 3px 7px;
	display: inline-block;
	font-size: 20px;
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
h3{
	margin-bottom: 20px;
	font-size: 20px;
	text-align: left;
	background-color: white;
	border-color: gray;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
#mem {
   padding: 30px;
   border: 2px solid navy;
   border-radius: 40px;
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
div #h{
	font-size: 24px;
	font-weight: bolder;
}
a{
	text-decoration: none;
}
.freeTxt {
   font-family: 'IBM Plex Sans KR', sans-serif;
   font-weight: bold;
   float:left;
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
#skill {
    padding: 10px;
    font-size: 20px;
    width: fit-content;
    margin: auto;
    font-family: 'IBM Plex Sans KR', sans-serif;
    border-radius: 40px;
    background-color: #EBF7FF;
}
.search{
	text-align: center;
}
#hit{
	font-family: 'IBM Plex Sans KR', sans-serif;
	padding: 5px 20px;
	margin: auto;
	border-radius: 40px;
	color: gray;
	width: fit-content;
	background-color: beige;
	font-weight: bold;
	float: right; 
}
#title {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: 34px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<br>
	<div class="wrap">
		<div class="freeTxt">
			<p>끼리가 보증하는 IT파트너</p>
			<p id="h">파트너들이 진행한<br>
			프로젝트를 참고해 보세요</p>
		</div>
		<br><br>
		<div class="cal">
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2023 </button> &nbsp;&nbsp;&nbsp;
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2022  </button> &nbsp;&nbsp;&nbsp;
		 	<button id="h3" type="submit" style=" border-radius: 30px;"> 2021 </button> &nbsp;&nbsp;&nbsp;
			<button id="h3" type="submit" style=" border-radius: 30px;"> 2020 </button> &nbsp;&nbsp;
		</div>
		<br><br><hr>
	</div>
	<div class="wrap board_table">
		<h1></h1>
		<br>
		<div id="devList">
			<c:if test="${completeList.size()==0 }">	
			    <h3>등록된 글이 없습니다</h3>
			</c:if>
			<c:if test="${loginUser != null}">
				<c:forEach var="dto" items="${completeList }">
					<div id="mem">
						<input type="hidden" id="id" value="${dto.id }">
						<input type="hidden" id="completeNum" value="${dto.completeNum }">
						<h3>${dto.comdate }</h3>
						<a id="title" href="../ggiriComplete/completeView?completeNum=${dto.completeNum }">${dto.title }</a>
						<div class="skill">
						<br>
			                <c:forEach var="selectedSkill" items="${dto.skill}">
			                    <div style="display:inline" id="skill">${selectedSkill}</div>
			                    <p id="hit">조회수 ${dto.comHit }</p>
			                </c:forEach>
						</div>
					</div>
					<br><br>
				</c:forEach>
			</c:if>
		<%-- <table style="border:1px solid white;">
			<tr>
				<th style="display: none" width="50px"> 글번호 </th>
				<th style="display: none" width="100px"> 작성자 </th>
				<th width="700px"> 제 목 </th>
				<th width="150px"> 날 짜 </th>
				<th width="75px"> 조회수 </th>
				<!-- <th width="50px"> 좋아요 </th> -->
			</tr>
			<c:forEach var="dto" items="${completeList }">
				<tr style="text-align: right">
					<td style="display: none" >${dto.completeNum }</td>
					<td style="display: none">${dto.id }</td>
					<td height="100px"><a href="../ggiriComplete/completeView?completeNum=${dto.completeNum }">${dto.title }</a></td>
					<td>${dto.comdate }</td>
					<td>${dto.comHit }</td>
			        <td>${dto.likeCount }</td>
				</tr>
			</c:forEach>
		</table> --%>
		<br>
		<form action="projectList.do" method="get">
			<div class="search">
				<select name="condition" id="condition" style="font-family: 'IBM Plex Sans KR', sans-serif">
					<option value="titleContent" <c:if test="${condition eq 'titleContent' }">selected</c:if>>제목 + 본문</option>
					<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword" style="font-family: 'IBM Plex Sans KR', sans-serif"
						placeholder="검색어" value="${keyword }"/>
				<button id="button1" type="submit">검색</button>
			</div>
		</form>
	</div>
	<br>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>