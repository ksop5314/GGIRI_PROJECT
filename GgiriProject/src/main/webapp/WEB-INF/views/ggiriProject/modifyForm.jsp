
<!-- ggiriProject/modifyForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/modifyForm.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap modify_form">
	<h1>프로젝트 등록</h1>
		<div class="modify">
			<form action="../ggiriProject/modify" method="post">
				<input type="hidden" name="projectNum" value="${data.projectNum }">
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
				<c:if test="${googleMember != null}">
				<input type="text" name="id" id="id" value="${googleMember.id}" readonly>
				</c:if><br>
				<b> 제 목 </b><br>
				<input type="text" name="title" size="50" value="${data.title }"><br><br>
				<b>프로젝트 상태</b><br>
				<label for="proceeding"> 진행중 </label>
				<input type="radio" class="hidden" name="project" id="proceeding" value="진행중" checked>
				<label for="complete"> 완료 </label>
				<input type="radio" class="hidden" name="project" id="complete" value="완료">
				<br><br>
<!-- 			<b> 스 킬 </b><br>
				<ul>
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
				</ul>  -->
				<b> 내 용 </b><br>
				<textarea rows="20" cols="100" name="content">${data.content }</textarea><br>
				<br>
				<input type="submit" value="수정완료"> &nbsp;
				<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'">
			</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>