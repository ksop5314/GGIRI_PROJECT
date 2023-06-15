
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

	function re_hide() {
		$("#r_frm").hide();
	}
	
	// 댓글
	function rep() {
		var contextPath = "${pageContext.request.contextPath}";
		let projectNum = $("#projectNum").val();
		let id = $("#id").val();
		let content = $("#content").val();
		let memberNum = $("#memberNum").val();
		let form = { projectNum:projectNum, memberNum:memberNum, id:id, content:content}
		console.log(id);
		
		
		<%--
		let arr = $("#frm").serializeArray();
		for(i=0; i<arr.length; i++) {
			form[arr[i].name] = arr[i].value
		}
		--%>
		$.ajax({
			//contextPath + "/ggiriProject/addReply"
			url: contextPath + "/ggiriProject/addReply", 
			type: "post", //dataType: "json",
			data: JSON.stringify(form),
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if(data == 1){
					$("#content").val("");
					// alert("댓글 등록 완료!")
					replyData();
				} else {
					// alert("댓글 오류");
				}
			},
			error: function() {
				alert("댓글 등록 실패ㅠ")
			}
		});
	}
	
	$(function(){
		replyData();
	});
	
	function replyData() {
		
		var contextPath = "${pageContext.request.contextPath}";
		let projectNum = $("#projectNum").val();
		let id = $("#id").val();
		
		$.ajax({
			url: contextPath + "/ggiriProject/replyData?projectNum=" + projectNum, type: "get",
			success: function(rep) {
				console.log(rep.length);
				let html = ""
					for(i = 0; i < rep.length; i++){
						
						let date = new Date(rep[i].wdate);
						let wdate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 ";
						wdate += date.getDate()+"일 "+date.getHours()+"시 ";
						wdate += date.getMinutes()+"분 "+date.getSeconds()+"초";
						html += "		<div id='reply'>";
						html += "			<table class='table'>";
						html += "		 		<tr>";
						html += " 					<th width='150px' height='40px'>"+ rep[i].id +"님</th>"+"<td width='150px'>"+ rep[i].wdate +"</td>";
						html += "				</tr>";
						html += "				<tr>";
						html += "					<pre><td width='850px'>"+ rep[i].content +"</td></pre>";
						html += "					<td>";
						html += "						<input type='hidden' name='repNo' id='repNo' value='" + rep[i].no + "'>";		
						html += "						<input type='hidden' name='repId' id='repId' value='" + rep[i].id + "'>";			
						html += "						<button type='button' id='deleteRep' name='deleteRep' onclick='deleteRep()'> 삭제 </button>";
						html += "					</td>";
						html += "				</tr>";
						html += "			</table>";
						html += "		</div>";
						
					} 
				
				$("#rep").html(rep);
				$("#reply").html(html);
				
				
			}, 
			error: function() {
				//alert("댓글 가져오기 실패!")
			}
		});
	}
	
	function deleteRep(){
		var contextPath = "${pageContext.request.contextPath}";
		var id = $("#repNo");
		var no = $("#repId");
		
		
		
	}
		
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
							<b>작성자 : ${loginUser }</b><br>
							<input type="hidden" name="id" id="id" value="${loginUser }">
							<input type="hidden" name="memberNum" id="memberNum"  value="${ggiriMemberInfo.memberNum }">
						</c:if>
						<c:if test="${kakaoMember != null || naverMember != null || googleMember != null}">
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