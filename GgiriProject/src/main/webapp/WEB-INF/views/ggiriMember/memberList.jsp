
<!-- default/main.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default/main.jsp</title>
<script type="text/javascript">
	function fReg(){
		window.location.assign("../ggiriMember/writeFree");
	}
</script>
<style type="text/css">
*{
	margin: 0;
}
.skill{
	
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
div {
	padding: 20px 0 15px 300px;
}
div #h{
	font-size: 20px;
	font-weight: bold;
}
#h3{
	text-align: center;
	background-color: white;
	border-color: black;
	opacity:1.0;
	
}
#h3:hover{
	background-color: gray;
}

/* #h2{
	background-color: white;
	border-color: #f76a22;
	font-weight: bold;
	color: #000;
	padding-top: 5px;
	padding-bottom: 5px;
	border: 4px solid orange;
	border-radius: 10px;
	border-width: 2px;
	font-size: 15px;
	float: left;
	clear: both;
	margin: 0 1000px 0p 0;
} */
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
a{
	text-decoration: none;
	color: white;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div style="border: 1px solid white; width: 1000px; height: 1000px;">
		<div style="float:left; margin-right: 100px ">
			<p>끼리가 보증하는 IT파트너</p>
			<p id="h">프로젝트 등록하면<br>
			더 정확한 추천을 받을 수 있어요</p>
			
		</div> 
		<div>
			<button type="submit" style="border-radius: 10px;border-width: 2px;font-size: 15px;padding-top: 5px;padding-bottom: 5px;border-color: #f76a22;background-color: #fff;color: #000;" onclick="fReg()">프리랜서 등록하기 </button>
		</div>
		<br><br>
		<div   class="skill">
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
						<%-- <td id="title"><b>소개 : </b>"${board.title }"</td>
						<td id="proof"><b>경력 : </b>"${board.proof_of_experience }"</td> --%>
					</tr>
				</c:forEach>
			</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>