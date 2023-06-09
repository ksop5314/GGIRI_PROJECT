
<!-- ggiriProject/projectWrite.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/projectWrite.jsp</title>
<script>
function count_check(obj){
	var chkBox = document.getElementsByName("skill");
	var chkCnt = 0;
	for(var i = 0; i < chkBox.length ; i++){
		if(chkBox[i].checked){
			chkCnt++;
		}
	}
	if(chkCnt > 5){
		alert("요구 스킬은 5개까지 선택할 수 있습니다.");
		obj.checked = false;
		return false;
	}
}
</script>
<style type="text/css">
.write_save {
    font-family: 'IBM Plex Sans KR', sans-serif;
}
input {
	font-family: 'IBM Plex Sans KR', sans-serif;
}
textarea {
	width: 1000px;
	hegith: 300px;
}
input[type=button] {
	background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;     
    border-radius: 9999px;
    font-family: 'IBM Plex Sans KR', sans-serif;
    cursor: pointer;
}
input[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}
h3 {
    font-size: 20px;
   /*  padding: 10px;
    width: fit-content;
    margin: auto;
    font-family: 'IBM Plex Sans KR', sans-serif; */
}
#submit{
	background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;     
    border-radius: 9999px;
    font-family: 'IBM Plex Sans KR', sans-serif;
    cursor: pointer;
}
#submit:hover{
    background-color: #EBF7FF;
    transition: 0.5s;
}
 #select {
    display: flex;
    justify-content: center;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap write_form">
<!-- 	<h1>프로젝트 등록</h1> -->		
		<div class="write_save">
<<<<<<< HEAD
			<form action="../ggiriProject/projectSave" method="post"><br>
				<h3> 제 목 </h3>
				<input type="text" name="title" size="50"><br><br><hr><br>
				<h3> 스 킬 </h3>
					<ul>
						<!-- <li>
						<li class="inline-block" @click="">
							<input name="available_0" type="checkbox" class="hidden" id=""available_0"" value="frontEnd" onclick="count_check(this)">
							<label for="joinpath_0">"frontEnd"</label>
						</li>
						<li class="inline-block" @click="">
							<input name="available_1" type="checkbox" class="hidden" id=""available_1"" value="backEnd" onclick="count_check(this)">
							<label for="joinpath_1">backEnd</label>
						</li>
						<li class="inline-block" @click="">
							<input name="available_2" type="checkbox" class="hidden" id=""available_2"" value="Java" onclick="count_check(this)">
							<label for="joinpath_2">Java</label>
						</li>
						<li class="inline-block" @click="">
							<input name="available_3" type="checkbox" class="hidden" id=""available_3"" value="Spring" onclick="count_check(this)">
							<label for="joinpath_3">Spring</label>
						</li> -->
						<li>
							<label for="available_0">Front-End</label>
							<input type="checkbox" class="hidden" name="skill" id="available_0" value="frontEnd" onclick="count_check(this)">
							<label for="available_1">Back-End</label>
							<input type="checkbox" class="hidden" name="skill" id="available_1" value="backEnd" onclick="count_check(this)">
							<label for="available_2">Java</label>
							<input type="checkbox" class="hidden" name="skill" id="available_2" value="java" onclick="count_check(this)">
							<label for="available_3">Spring</label>
							<input type="checkbox" class="hidden" name="skill" id="available_3" value="spring" onclick="count_check(this)">
							<label for="available_4">Maven</label>
							<input type="checkbox" class="hidden" name="skill" id="available_4" value="maven" onclick="count_check(this)">
							<label for="available_5">Jenkins</label>
							<input type="checkbox" class="hidden" name="skill" id="available_5" value="jenkins" onclick="count_check(this)">
							<label for="available_6">WebView</label>
							<input type="checkbox" class="hidden" name="skill" id="available_6" value="webView" onclick="count_check(this)">
							<label for="available_7">node.js</label>
							<input type="checkbox" class="hidden" name="skill" id="available_7" value="node.js" onclick="count_check(this)">
							<label for="available_8">React.js</label>
							<input type="checkbox" class="hidden" name="skill" id="available_8" value="react.js" onclick="count_check(this)">
							<label for="available_9">react-native</label>
							<input type="checkbox" class="hidden" name="skill" id="available_9" value="react-native" onclick="count_check(this)">
							<label for="available_10">Vue.js</label>
							<input type="checkbox" class="hidden" name="skill" id="available_10" value="Vue.js" onclick="count_check(this)"><br>
							<label for="available_11">JavaScript</label>
							<input type="checkbox" class="hidden" name="skill" id="available_11" value="javaScript" onclick="count_check(this)">
							<label for="available_12">Oracle</label>
							<input type="checkbox" class="hidden" name="skill" id="available_12" value="oracle" onclick="count_check(this)">
							<label for="available_13">MSSQL</label>
							<input type="checkbox" class="hidden" name="skill" id="available_13" value="msSql" onclick="count_check(this)">
							<label for="available_14">MySQL</label>
							<input type="checkbox" class="hidden" name="skill" id="available_14" value="mySql" onclick="count_check(this)">
							<label for="available_15">MariaDB</label>
							<input type="checkbox" class="hidden" name="skill" id="available_15" value="mariaDB" onclick="count_check(this)"><br>
							<label for="available_16">MongoDB</label>
							<input type="checkbox" class="hidden" name="skill" id="available_16" value="mongoDB" onclick="count_check(this)">
							<label for="available_17">Android</label>
							<input type="checkbox" class="hidden" name="skill" id="available_17" value="android" onclick="count_check(this)">
							<label for="available_18">loT</label>
							<input type="checkbox" class="hidden" name="skill" id="available_18" value="lot" onclick="count_check(this)">
							<label for="available_19">PHP</label>
							<input type="checkbox" class="hidden" name="skill" id="available_19" value="php" onclick="count_check(this)">
							<label for="available_20">jQuery</label>
							<input type="checkbox" class="hidden" name="skill" id="available_20" value="jquery" onclick="count_check(this)">
							<label for="available_21">Aduino</label>
							<input type="checkbox" class="hidden" name="skill" id="available_21" value="aduino" onclick="count_check(this)"><br>
							<label for="available_22">Hybrid</label>
							<input type="checkbox" class="hidden" name="skill" id="available_22" value="hybrid" onclick="count_check(this)">
							<label for="available_23">UNIX</label>
							<input type="checkbox" class="hidden" name="skill" id="available_23" value="unix" onclick="count_check(this)">
							<label for="available_24">C#</label>
							<input type="checkbox" class="hidden" name="skill" id="available_24" value="c#" onclick="count_check(this)">
							<label for="available_25">C</label>
							<input type="checkbox" class="hidden" name="skill" id="available_25" value="c" onclick="count_check(this)">
							<label for="available_26">C++</label>
							<input type="checkbox" class="hidden" name="skill" id="available_26" value="c++" onclick="count_check(this)">
							<label for="available_27">Qt</label>
							<input type="checkbox" class="hidden" name="skill" id="available_27" value="qt" onclick="count_check(this)">
							<label for="available_28">Server</label>
							<input type="checkbox" class="hidden" name="skill" id="available_28" value="server" onclick="count_check(this)"><br>
							<label for="available_29">Miplatform</label>
							<input type="checkbox" class="hidden" name="skill" id="available_29" value="miplatform" onclick="count_check(this)">
							<label for="available_30">Thymeleaf</label>
							<input type="checkbox" class="hidden" name="skill" id="available_30" value="thymeleaf" onclick="count_check(this)">
							<label for="available_31">flutter</label>
							<input type="checkbox" class="hidden" name="skill" id="available_31" value="flutter" onclick="count_check(this)">
							<label for="available_32">ios</label>
							<input type="checkbox" class="hidden" name="skill" id="available_32" value="ios" onclick="count_check(this)">
						</li>
					</ul>
				<h3> 내 용 </h3><br>
=======
			<form action="../ggiriProject/projectSave" method="post">
				<b> 작성자 </b><br>
				<c:if test="${loginUser != null}">
				<input type="text" name="id" id="id" value="${loginUser }" readonly>
				</c:if>
				<c:if test="${kakaoMember != null}">
				<input type="text" name="id" id="id" value="${kakaoMember.id }" readonly>
				</c:if>
				<c:if test="${naverMember != null}">
				<input type="text" name="id" id="id" value="${naverMember.id}" readonly>
				</c:if><br>
				<b> 제 목 </b><br>
				<input type="text" name="title" size="50"><br>
				<b> 내 용 </b><br>
>>>>>>> branch 'main' of https://github.com/Lab0nG/junho.git
				<textarea rows="20" cols="100" name="content"></textarea><br>
				<br>
				<div id="select">
					<input type="submit" id="submit" value="등록"> &nbsp;
					<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'">
				</div>
			</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>