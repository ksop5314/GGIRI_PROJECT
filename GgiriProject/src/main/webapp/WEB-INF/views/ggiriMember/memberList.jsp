
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
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">

var job;
	
function developer(){
	
	$("#devList").empty();
	job = $("#jobDev").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(index, item){
				$("#devList").append("<a href='Info?id=" + item.id + "'><div id='id'>" + item.id + "</div></a>"+"<div>"+ item.introduce+"</div>" + "<div>" + item.job + "</div>"
									+"<div>"+ item.skill + "<div>");
			});
		},
		error : function(xhr, status, errorThrown){
			alert(xhr);
			alert(status);
			alert(errorThrown);
		}
	});
}

function publisher(){
	
	$("#devList").empty();
	job = $("#jobPub").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(){
				html += "<a href='Info?id="+ this.id +"'><div id='id'>" + this.id + "</div></a>" + "<div>" + this.job + "</div>";
			});
			$("#devList").html(html);
		},
		error : function(xhr, status, errorThrown){
			alert(xhr);
			alert(status);
			alert(errorThrown);
		}
		
	});
}

function designer(){
	
	$("#devList").empty();
	job = $("#jobDes").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(){
				html += "<a href='Info?id="+ this.id +"'><div id='id'>" + this.id + "</div></a>" + "<div>" + this.job + "</div>";
			});
			$("#devList").html(html);
		},
		error : function(xhr, status, errorThrown){
			alert(xhr);
			alert(status);
			alert(errorThrown);
		}
		
	});
}

function planner(){
	
	$("#devList").empty();
	job = $("#jobPla").val();
	
	var contextPath = "${pageContext.request.contextPath}";
	
	$.ajax({
		url : contextPath + '/ggiriMember/selectJob?job=' + job,
		type : 'get',
		success : function(list){
			let html = ""
			$(list).each(function(){
				html += "<table><a href='Info?id="+ this.id +"'><div id='id'>" + this.id + "</div></a>" + "<div>" + this.job + "</div></table>";
			});
			$("#devList").html(html);
		},
		error : function(xhr, status, errorThrown){
			alert(xhr);
			alert(status);
			alert(errorThrown);
		}
		
	});
}

</script>
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
div{
	margin-right: auto;
	margin-left: auto;
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
	color: white;
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
			<input type="hidden" name="job" id="jobDev" value="developer">
			<input type="hidden" name="job" id="jobPub" value="publisher">
			<input type="hidden" name="job" id="jobDes" value="designer">
			<input type="hidden" name="job" id="jobPla" value="planner">
			<button class="h3" type="submit" style=" border-radius: 30px;" onclick="developer()" id="dev"> ⚙️  개발자 </button>
			<button class="h3" type="submit" style=" border-radius: 30px;" onclick="publisher()" id="pub"> 🛠  퍼블리셔  </button> 
		 	<button class="h3" type="submit" style=" border-radius: 30px;" onclick="designer()" id="des"> 🎨  디자이너 </button> 
			<button class="h3" type="submit" style=" border-radius: 30px;" onclick="planner()" id="pla"> 📝  기획자 </button> 
		</div>
			<br><br>
			<hr>
			<table style="border:1px solid white;">
				<tr>
					<th width="50px"></th>
					<th width="300px"></th>
					<th width="300px"></th>
				</tr>
				<tr>
					<td>
						<div id="devList">
							<c:forEach var="list" items="${boardList }">
								<a href="Info?id=${list.id }"><p id="id"><c:out value="${list.id }"/></p></a>
								<p><c:out value="${list.introduce }"/></p>
								<p><c:out value="${list.job }"/></p>
								<p><c:out value="${list.skill }"/></p>
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
		</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>