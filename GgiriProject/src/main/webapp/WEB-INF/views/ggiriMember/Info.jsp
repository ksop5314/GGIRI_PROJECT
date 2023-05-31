<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function slide_click(){
		$("#first").slideDown("slow");
		$("#modal_wrap").show();
	}
	
	function slide_hide(){
		$("#first").slideUp("fast");
		$("#modal_wrap").hide();
	}
</script> -->
<style type="text/css">
*{
	margin: 0;
}
/* #modal_wrap{
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0; left: 0; right: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
}
#first{
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background: rgba(210, 240, 250, 0.9);
} */
body{
	text-align: left;
}
#id{
	margin-right: auto;
	margin-left: auto;
	background-color: blue;
	border: 1px solid black;
	width: 800px;
	height: 100px;
	text-align: center;
	padding: 50px 0 50px 0;
	font-size: 50px;
	color: white;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
			
			<!-- <input type="hidden" id="writeNo" name="writeNo"> -->
				<p id="id">"${info.id }"</p>
				<p id="title"><b>소개 : </b>"${info.title }"</p>
				<p id="proof"><b>경력 : </b>"${info.proof_of_experience }"</p>
			<br>
	<div id="modal_wrap">
		<div id="first">
			<div style="width: 250px; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<b>${info.id }</b>
					<br>
					<b>내 용</b><br>
					<textarea id="content" name="content" rows="5" cols="30"></textarea>
					<hr>
					<button type="button" onclick="rep()"> 요청 </button>
					<button type="button" onclick="slide_hide()"> 취소 </button>
				</form>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>