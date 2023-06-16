<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectList.jsp</title>
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

 h3{
   font-size: 20px;
   text-align: left;
   background-color: white;
   border-color: gray;
   font-family: 'IBM Plex Sans KR', sans-serif;
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
div {
   font-family: 'IBM Plex Sans KR', sans-serif;
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
a {
   font-weight: bold;
}
#title {
   font-size: 32px;
}
#mem {
   padding: 30px;
   border: 2px solid navy;
   border-radius: 40px;
}
#project_1 {
	font-family: 'IBM Plex Sans KR', sans-serif;
	padding: 5px 20px;
	margin: auto;
	border-radius: 40px;
	color: white;
	width: fit-content;
	background-color: blue;
	font-weight: bold;
	float: right; 
}
#project_2 {
	font-family: 'IBM Plex Sans KR', sans-serif;
	padding: 5px 20px;
	margin: auto;
	border-radius: 40px;
	color: white;
	width: fit-content;
	background-color: red;
	font-weight: bold;
	float: right; 
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
		   <button id="freeInput" type="button" onclick="location.href='../ggiriProject/projectWrite'">프로젝트 등록하기</button>
		</div>
	</div>
	<br><br><br><br><br><hr>
	<!-- <div class="skill">
		<input type="hidden" name="skill" id="jobDev" value="develop">
		<input type="hidden" name="skill" id="jobPub" value="publish">
		<input type="hidden" name="skill" id="jobDes" value="design">
		<input type="hidden" name="skill" id="jobPla" value="plan">
		<button class="h3" type="submit" style=" border-radius: 30px;" onclick="develop()" id="dev"> ⚙️  개발 </button>
		<button class="h3" type="submit" style=" border-radius: 30px;" onclick="publish()" id="pub"> 🛠  퍼블리싱  </button> 
		<button class="h3" type="submit" style=" border-radius: 30px;" onclick="design()" id="des"> 🎨  디자인 </button> 
		<button class="h3" type="submit" style=" border-radius: 30px;" onclick="plan()" id="pla"> 📝  기획 </button> 
	</div>
	<br><br><hr> -->
	<div class="wrap board_table">
		<h1></h1>
		<br>
		<div id="devList">
			<c:if test="${list.size()==0 }">	
			    <h3>등록된 글이 없습니다</h3>
			</c:if>
			<br>
   			<c:if test="${loginUser != null}">
				<c:forEach var="dto" items="${list }">
					<div id="mem">
						<c:if test="${dto.project == '완료' }">
							<span id="project_1">${dto.project }</span>
						</c:if>
						<c:if test="${dto.project == '진행중' }">
							<span id="project_2">${dto.project }</span>
						</c:if>
            			<h3>${dto.prodate }</h3>
            			<a id="title" href="/root/ggiriProject/projectView?projectNum=${dto.projectNum }">${dto.title }</a>
            			<br>
						<p>${dto.id }</p>
						<p>${dto.job }</p>
						<div class="skill">
						<br>
			                <c:forEach var="selectedSkill" items="${dto.skill}">
			                    <div style="display:inline" id="skill">${selectedSkill}</div>
			                </c:forEach>
						</div>
					</div>
					<br><br>
				</c:forEach>
			</c:if>
			<br><br>
			<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
				<c:forEach var="dto" items="${snsList }">
					<div id="mem">
						<c:if test="${dto.project == '완료' }">
							<span id="project_1">${dto.project }</span>
						</c:if>
						<c:if test="${dto.project == '진행중' }">
							<span id="project_2">${dto.project }</span>
						</c:if>
			            <h3>${dto.prodate }</h3>
			            <a id="title" href="/root/ggiriProject/projectView?projectNum=${dto.projectNum }">${dto.title }</a>
			            <br>
			            <p>${dto.id }</p>
						<p>${dto.job }</p>
			            <div class="skill">
						<br>
			                <c:forEach var="selectedSkill" items="${dto.skill}">
			                    <div style="display:inline" id="skill">${selectedSkill}</div>
			                </c:forEach>
						</div>
					</div>
					<br>
    			</c:forEach>
    		</c:if>
		</div>
	</div>
  	<br>
	<form action="projectList.do" method="get">
		<label for="condition" style="font-family: 'IBM Plex Sans KR', sans-serif">검색조건</label><br>
		<select name="condition" id="condition" style="font-family: 'IBM Plex Sans KR', sans-serif">
			<option value="titleContent" <c:if test="${condition eq 'titleContent' }">selected</c:if>>제목 + 본문</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
			<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>작성자</option>
		</select>
			<input type="text" name="keyword" id="keyword" style="font-family: 'IBM Plex Sans KR', sans-serif" placeholder="검색어" value="${keyword }"/>
			<button id="button1" type="submit">검색</button>
	</form>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>