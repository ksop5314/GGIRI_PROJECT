
<!-- default/main.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>     
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default/main.jsp</title>
<!-- <script type="text/javascript">
	function fReg(){
		window.location.assign("$/ggiriMember/writeFree");
	}
</script> -->
<style type="text/css">
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
	color: white;
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
	<c:import url="../default/header.jsp"/>
 		<br>
 		<div class="wrap">
		<div class="freeTxt">
			<p>끼리가 보증하는 IT파트너</p>
			<p id="h">프로젝트 등록하면<br>
			더 정확한 추천을 받을 수 있어요</p>
			<br>
		</div> 
		<div>
			<button class="freeInput" id="freeInput" type="button" onclick="location.href='${contextPath}/ggiriMember/writeFree'">프리랜서 등록하기</button>
		</div>
		<br><br><br><br><br><br><br>
		<div class="skill">
			<form method="get" action="main">
				<button id="h3" type="submit" style=" border-radius: 30px;"> ⚙️  개발자 </button>
			</form>
			<form action="#">
				<button id="h3" type="submit" style=" border-radius: 30px;"> 🛠  퍼블리셔  </button> 
			</form>
			<form action="#">
			 	<button id="h3" type="submit" style=" border-radius: 30px;"> 🎨  디자이너 </button> 
			</form>
			<form action="#">
				<button id="h3" type="submit" style=" border-radius: 30px;"> 📝  기획자 </button> 
			</form>
		</div>
		<br><br>
		<hr>
		<table style="border:1px solid white;">
			<tr>
				<th width="50px"></th>
				<th width="300px"></th>
				<th width="300px"></th>
			</tr>
				<c:forEach var="board" items="${boardList }">
					<tr>
					<!-- <input type="hidden" id="writeNo" name="writeNo"> -->
						<td id="id"><a href="Info?id=${board.id }">"${board.id }"</a></td>
						<td id="skill"><b>기술 : </b>"${board.skill }"</td>
						<%-- <td id="proof"><b>경력 : </b>"${board.proof_of_experience }"</td> --%>
					</tr>
				</c:forEach>
			</table>
		</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>