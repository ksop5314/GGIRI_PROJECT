
<!-- ggiriComplete/completeWrite.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">

	function projectCom() {
		
		var contextPath = "${pageContext.request.contextPath}";
		let projectNum = $("#projectNum").val();
		let memberNum = $("#memberNum").val();
		let id = $("#id").val();
		let title = $("#title").val();
		let content = $("#content").val();
		let skill = $("#skill").val();
		let members = $("#members").val();
		let tag = $("#tag").val();
		let form = { projectNum:projectNum, memberNum:memberNum, id:id, title:title, content:content, skill:skill, members:members, tag:tag }
		
		
		
		$.ajax({
			url: contextPath + "/ggiriComplete/comSave", 
			type: "post", //dataType: "json",
			data: JSON.stringify(form),
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				console.log(projectNum)
				console.log(memberNum)
				if(data == 1){
					
					location.href = contextPath + '/ggiriComplete/completeSuccess';
					// alert("댓글 등록 완료!")
				} else {
					location.href = contextPath + '/ggiriComplete/completeFail';
					// alert("댓글 오류");
				}
			},
			error: function() {
				//alert("댓글 등록 실패ㅠ")
			}
			
		});
		
	}
</script>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap com_write">
	<h1>프로젝트 완성하기</h1><br>
		<div class="com_save">
			<form id="comSave">
				<b> 작성자 &nbsp; ${loginUser }님</b>
				<c:if test="${loginUser != null}">
					<input type="hidden" name="projectNum" id="projectNum" value="${data.projectNum }">
					<input type="hidden" name="id" id="id" value="${loginUser }" readonly>
					<input type="hidden" name="memberNum" id="memberNum" value="${ggiriMemberInfo.memberNum }">
				</c:if>
				<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
					<input type="hidden" name="projectNum" id="projectNum" value="${data.projectNum }">
					<input type="hidden" name="id" id="id" value="${ggiriSnsInfo.id }" readonly>
					<input type="hidden" name="memberNum" id="memberNum" value="${ggiriSnsInfo.memberNum }">
				</c:if><br>
				<b> 제 목 </b><br>
				<input type="text" name="title" id="title" size="50"><br>
				<b> 내 용 </b><br>
				<textarea rows="20" cols="100" name="content" id="content"></textarea><br>
				<b> 스 킬 </b><br>
				<textarea rows="20" cols="100" name="skill" id="skill"></textarea><br>
				<b> 멤 버 </b><br>
				<input type="text" name="members" id="members" size="50"><br>
				<b> 태 그 </b><br>
				<input type="text" name="tag" id="tag" size="50"><br>
				<br>
				<input type="button" value="등록" onclick="projectCom()"> &nbsp;
			</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>