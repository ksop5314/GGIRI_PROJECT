<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectList.jsp</title>
<style type="text/css">
table {
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

.h3{
	padding: 10px 15px;
	font-size: 15px;
	text-align: center;
	background-color: white;
	border-color: gray;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.h3:hover{
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
	color: black;
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
		<div>
			<button class="freeInput" id="freeInput" type="button" onclick="location.href='../ggiriProject/projectWrite'">프로젝트 등록하기</button>
		</div>
		<br><br><br><br><br><br><br>
		<div class="skill">
			<input type="hidden" name="skill" id="jobDev" value="develop">
			<input type="hidden" name="skill" id="jobPub" value="publish">
			<input type="hidden" name="skill" id="jobDes" value="design">
			<input type="hidden" name="skill" id="jobPla" value="plan">
			<button class="h3" type="submit" style=" border-radius: 30px;" onclick="develop()" id="dev"> ⚙️  개발 </button>
			<button class="h3" type="submit" style=" border-radius: 30px;" onclick="publish()" id="pub"> 🛠  퍼블리싱  </button> 
		 	<button class="h3" type="submit" style=" border-radius: 30px;" onclick="design()" id="des"> 🎨  디자인 </button> 
			<button class="h3" type="submit" style=" border-radius: 30px;" onclick="plan()" id="pla"> 📝  기획 </button> 
		</div>
<<<<<<< HEAD
			<br><br>
			<hr>
<!-- 	<h1>프로젝트 보기</h1> -->	
			<table style="border:1px solid white;">
				<tr>
					<th style="display: none"  width="50px"> 번 호 </th>
					<th style="display: none" width="100px"> ID </th>
					<th width="700px"> 제 목 </th>
					<th width="200px"> 날 짜 </th>
					<th width="100px"> 조회수 </th>
				</tr>
=======
	</div>
	<br>
	<hr>
	<div class="wrap board_table">
	<h1>프로젝트 보기</h1>
	<br>
	<br>
		<table border="1">
			<tr style="text-align: center">
				<th style="display: none"  width="50px"> 번 호 </th>
				<th style="display: none" width="100px"> ID </th>
				<th width="700px"> 제 목 </th>
				<th width="200px"> 날 짜 </th>
				<th width="100px"> 조회수 </th>
			</tr>
>>>>>>> branch 'main' of https://github.com/Lab0nG/junho.git
			<c:if test="${projectList.size()==0 }">
				<tr>
					<th colspan="6"> 등록된 글이 없습니다 </th>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${projectList }">
				<tr style="text-align: right">
					<td style="display: none" >${dto.projectNum }</td>
					<td style="display: none">${dto.id }</td>
					<td><a href="../ggiriProject/projectView?projectNum=${dto.projectNum }">${dto.title }</a></td>
					<td>${dto.prodate }</td>
					<td>${dto.proHit }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<form action="projectList.do" method="get"> <%-- <c:if test="${condition eq 'titlename' }">selected</c:if>	 --%>
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