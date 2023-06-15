
<!-- ggiriProject/projectView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/projectView.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">

		
</script>
<style type="text/css">

#container_1 {
	display: inline-block;
}

#reply { text-align: left; }

table { border-collapse: collapse; }

.projectView{ justify-content: center; }

#r_frm {
	display: none;
}
</style>
</head>
<body>
	 
	<c:import url="../default/header.jsp"></c:import>
	<br>
	<div class="wrap projectView">
	<h1> 프로젝트 내용 </h1>
	<br>
		<table border="1">
			<tr>
				<th style="display: none"> 번 호 </th><td style="display: none">${data.projectNum }</td>
			</tr>
			<tr>
				<th width="150px"> 작성자 </th><td width="850px">${data.id }</td>
			</tr>
			<tr>
				<th> 작성일 </th><td>${data.prodate }</td>
			</tr>
			<tr>
				<th> 진행상태 </th><td>${data.project }</td>
			</tr>
			<tr>
				<th height="400px"> 프로젝트 설명 </th><td><pre><c:out value="${data.content }"/></pre></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="button" style=" border-radius: 40px;" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'"> &nbsp;
					<c:if test="${data.id == loginUser && data.project == '완료' }">
						<button type="submit" style=" border-radius: 40px;" onclick="location='../ggiriComplete/completeWrite?projectNum=${data.projectNum }'">프로젝트 완성</button> &nbsp;
					</c:if>
					<c:if test="${data.id == loginUser && data.project == '진행중' }">
						<input type="button" value="수정" style=" border-radius: 40px;" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
						<input type="button" value="삭제" style=" border-radius: 40px;" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
					</c:if>
					<c:if test="${data.id == kakaoMember.id && data.project == '완료'}">
						<button type="submit" style=" border-radius: 40px;" onclick="location='../ggiriComplete/completeWrite?projectNum=${data.projectNum }'">프로젝트 완성</button> &nbsp;
					</c:if>
					<c:if test="${data.id == kakaoMember.id && data.project == '진행중'}">
						<input type="button" value="수정" style=" border-radius: 40px;" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
						<input type="button" value="삭제" style=" border-radius: 40px;" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
					</c:if>
					<c:if test="${data.id == naverMember.id && data.project == '완료'}">
						<button type="submit" style=" border-radius: 40px;" onclick="location='../ggiriComplete/completeWrite?projectNum=${data.projectNum }'">프로젝트 완성</button> &nbsp;
					</c:if>
					<c:if test="${data.id == naverMember.id && data.project == '진행중'}">
						<input type="button" value="수정" style=" border-radius: 40px;" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
						<input type="button" value="삭제" style=" border-radius: 40px;" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
					</c:if>
				</td>
			</tr>
		</table>
		<br>

		<br>
		<div id="container_1">
			<div id="first">
				<div style="width: 1000px; margin: 0 auto; padding-top: 20px;">
					<form id="frm">
						<input type="hidden" name="projectNum" id="projectNum" value="${data.projectNum }">
						<b>댓글을 작성해보세요.</b>
						<hr>
						<c:if test="${loginUser != null}">
							<input type="hidden" name="id" id="id" value="${loginUser }" readonly>
							<input type="hidden" name="memberNum" id="memberNum" value="${ggiriMemberInfo.memberNum }">
							<b>작성자 : ${loginUser }</b><br>
							<input type="hidden" name="id" id="id" value="${loginUser }">
							<input type="hidden" name="memberNum" id="memberNum"  value="${ggiriMemberInfo.memberNum }">
						</c:if>
						<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
							<input type="hidden" name="id" id="id" value="${ggiriSnsInfo.id }" readonly>
							<input type="hidden" name="memberNum" id="memberNum" value="${ggiriSnsInfo.memberNum }">
							<b>작성자 : ${ggiriSnsInfo.id }</b><br>
							<input type="hidden" name="id" id="id" value="${ggiriSnsInfo.id }">
							<input type="hidden" name="memberNum" id="memberNum"  value="${ggiriSnsInfo.memberNum }">
						</c:if>
						<br><br>
						<div>
							<textarea id="content" name="content" rows="3" cols="100"></textarea> &nbsp;
							<button type="button" style=" border-radius: 40px;" onclick="rep()">등 록</button> &nbsp;
							<button type="reset" style=" border-radius: 40px;">취 소</button>
						</div>
					</form>
					<br><br>
					<div id="reply" class="reply">
						<c:if test="${loginUser != null}">
							<input type="hidden" name="id" id="id" value="${loginUser }">
						</c:if>
						<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
							<input type="hidden" name="id" id="id" value="${ggiriSnsInfo.id }">
						</c:if>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>