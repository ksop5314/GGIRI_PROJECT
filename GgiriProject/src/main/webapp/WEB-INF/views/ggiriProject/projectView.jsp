
<!-- ggiriProject/projectView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/projectView.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	<%--
	function re_click() {
		var writeNum = $("#writeNo").val();
		var repNum = $("#repNo").val();
		
		if(writeNum == repNum){
			$("#r_frm").show();	
		}
		
	}
	--%>
	function re_click() {
		$("#r_frm").show();	
	}

	function re_hide() {
		$("#r_frm").hide();
	}
	
	// 댓글
	function rep() {
		var contextPath = "${pageContext.request.contextPath}";
		
		var projectNum = $("#projectNum").val();
		var id = $("#id").val();
		var content = $("#content").val();
		
		
		let form = { projectNum:projectNum, id:id, content:content}
		
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
					// alert("댓글 등록 완료!")
					replyData();
				} else {
					// alert("댓글 오류");
				}
			},
			error: function() {
				alert("댓글 등록 실패ㅠ")
			}
		})
	}
	
	$(function(){
		replyData();
	})
	
	function replyData() {
		
		var contextPath = "${pageContext.request.contextPath}";
		var projectNum = $("#projectNum").val();
		
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
						html += "				</tr>";
						html += "			</table>";
						html += "		</div>";
						html += "		<div style='text-align: right;'>";
						html += "			<button type='button' style='margin-bottom: 10px;' onclick='re_click()'>대댓글 작성</button> &nbsp;";
						html += "			<button type='button' style='margin-bottom: 10px;' onclick='re_hide()'>취소</button><hr>";
						html += "		</div>";
						html += "		<div>";
						html += "			<div id='r_frm'>";
						html += "				<input type='hidden' name='projectNum' id='projectNum' value='${data.projectNum }'>";
						html += "				<input type='hidden' name='id' id='id' value='${data.id }'>";
						html += "				<b>대댓글</b>";
						html += "				<hr>";
						html += "				<b>작성자 : ${loginUser }</b><br>";
						html += "					<div>";
						html += "						<textarea id='content' name='content' rows='3' cols='100'></textarea> &nbsp;";
						html += "						<button type='button' onclick='re_rep()'>등 록</button> &nbsp;";
						html += "						<button type='reset'>취 소</button>";
						html += "					</div>";
						html += "			</div>";
						html += "		</div>";
						
					} 
			<%--	
			} else {
					html += "<div>";
	              	html += "<h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		            html += "</div>";
				} 
			--%>
				$("#rep").html(rep)
				$("#reply").html(html)
				
				
			}, 
			error: function() {
				alert("댓글 가져오기 실패!")
			}
		});
	}

	// 대댓글
	function re_rep() {
		var contextPath = "${pageContext.request.contextPath}";
		
		var projectNum = $("#projectNum").val();
		var grp = $("#grp").val();
		var grps = $("#grps").val();
		var grpl = $("#grpl").val();
		var id = $("#id").val();
		var content = $("#content").val();
		
		let form = { projectNum:projectNum, grp:grp, grps:grps, grpl:grpl, id:id, content:content }
		
		$.ajax({
			url: contextPath + "/ggiriProject/re_addReply", 
			type: "post", //dataType: "json",
			data: JSON.stringify(form),
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if(data == 1){
					alert("댓글 등록 완료!")
					re_replyData();
				} else {
					// alert("댓글 오류");
				}
			},
			error: function() {
				alert("댓글 등록 실패")
			}
		})
	}
	
	function re_replyData() {
		
		var contextPath = "${pageContext.request.contextPath}";
		var projectNum = $("#projectNum").val();
		
		$.ajax({
			url: contextPath + "/ggiriProject/re_replyData?projectNum=" + projectNum, type: "get",
			success: function(re_rep) {
				let rehtml = ""
				$(re_rep).each(function(index, redata) {
					let date = new Date(redata.wdate)
					let wdate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 "
					wdate += date.getDate()+"일 "+date.getHours()+"시 "
					wdate += date.getMinutes()+"분 "+date.getSeconds()+"초"
					rehtml += "		<div id='re_reply'>";
					rehtml += "			<tr>";
					rehtml += "				<th width='150px'>"+ redata.id +"님</th>";
					rehtml += "			</tr>";
					rehtml += "			<tr>";
					rehtml += "				<td width='50px'>"+ redata.wdate +"</td>";
					rehtml += "			</tr>";
					rehtml += "			<tr>";
					rehtml += "				<pre><td width='850px'>"+ redata.content +"</td></pre>";
					rehtml += "			</tr>";
					rehtml += "		</div>";
				})
				$("#re_reply").html(rehtml)
			}, 
			error: function() {
				alert("댓글 가져오기 실패!")
			}
		})
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
				<th> 프로젝트 설명 </th><td><pre><c:out value="${data.content }"/></pre></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'"> &nbsp;
					<c:if test="${data.id==loginUser }">
						<input type="button" value="수정" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
						<input type="button" value="삭제" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
						<button type="submit" onclick="location='../ggiriComplete/completeWrite'">프로젝트 완성</button>
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
						<input type="hidden" name="projectNum" id="projectNum"  value="${data.projectNum }">
						<input type="hidden" name="id" id="id" value="${data.id }">
						<b>댓글을 작성해보세요.</b>
						<hr>
						<b>작성자 : ${loginUser }</b><br>
						<div>
							<textarea id="content" name="content" rows="3" cols="100"></textarea> &nbsp;
							<button type="button" onclick="rep()">등 록</button> &nbsp;
							<button type="reset">취 소</button>
						</div>
					</form>
					<br><br>
					<div id="reply" class="reply"></div>
					<br>
					<div id="re_reply" class="re_reply"></div>
				</div>
			</div>
		</div>
		<!--
		<div id="container_2" onload="re_reData()">
			<div id="second">
				<div>
					<form id="r_frm">
						<input type="hidden" name="projectNum" id="projectNum"  value="${data.projectNum }">
						<input type="hidden" name="id" id="id" value="${data.id }">
						<b>대댓글</b>
						<hr>
						<b>작성자 : ${loginUser }</b><br>
						<div>
							<textarea id="content" name="content" rows="3" cols="100"></textarea> &nbsp;
							<button type="button" onclick="re_rep()">등 록</button> &nbsp;
							<button type="reset">취 소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		-->
	</div>
	<c:import url="../default/footer.jsp"></c:import>
	
	
		
		<!--
		<form id="r_frm">
			<input type="hidden" name="projectNum" id="projectNum"  value="${data.projectNum }">
			<input type="hidden" name="id" id="id" value="${data.id }">
			<b>대댓글</b>
			<hr>
			<b>작성자 : ${loginUser }</b><br>
			<div>
				<textarea id="content" name="content" rows="3" cols="100"></textarea> &nbsp;
				<button type="button" onclick="re_rep()">등 록</button> &nbsp;
				<button type="reset">취 소</button>
			</div>
		</form>
		-->
	
	
<%--
#modal_wrap {
	display: none;
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0; left: 0; right: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

#first {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background-color: beige;
}
--%>
	
	<%--
				$(rep).each(function(index, redata) {
					let date = new Date(redata.wdate);
					let wdate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 ";
					wdate += date.getDate()+"일 "+date.getHours()+"시 ";
					wdate += date.getMinutes()+"분 "+date.getSeconds()+"초";
					html += "		<div id='reply'>";
					html += "			<table class='table'>";
					html += "		 		<tr>";
					html += " 					<th width='150px' height='40px'>"+ redata.id +"님</th>"+"<td width='150px'>"+ redata.wdate +"</td>";
					html += "				</tr>";
					html += "				<tr>";
					html += "					<pre><td width='850px'>"+ redata.content +"</td></pre>";
					html += "				</tr>";
					html += "			</table>";
					html += "		</div>";
					html += "		<div style='text-align: right;'>";
					html += "			<button type='button' style='margin-bottom: 10px;' onclick='re_click()'>대댓글 작성</button> &nbsp;";
					html += "			<button type='button' style='margin-bottom: 10px;' onclick='re_hide()'>취소</button><hr>";
					html += "		</div>";
					html += "		<div>";
					html += "			<div id='r_frm'>";
					html += "				<input type='hidden' name='projectNum' id='projectNum' value='${data.projectNum }'>";
					html += "				<input type='hidden' name='id' id='id' value='${data.id }'>";
					html += "				<b>대댓글</b>";
					html += "				<hr>";
					html += "				<b>작성자 : ${loginUser }</b><br>";
					html += "					<div>";
					html += "						<textarea id='content' name='content' rows='3' cols='100'></textarea> &nbsp;";
					html += "						<button type='button' onclick='re_rep()'>등 록</button> &nbsp;";
					html += "						<button type='reset'>취 소</button>";
					html += "					</div>";
					html += "			</div>";
					html += "		</div>";
				})
				$("#reply").html(html)
				--%>
	
	
	
	
	<!-- 
		<div id="modal_wrap">
		<div id="first">
			<div style="width: 250px; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" name="projectNum" value="${data.projectNum }">
					<b>댓글을 남겨보세요.</b>
					<hr>
					<input type="hidden" name="id" value="${loginUser }">
					<b>작성자 : ${loginUser }</b>
					<hr>
					<b>내 용</b><br>
					<textarea id="content" name="content" rows="5" cols="30"></textarea>
					<hr><br>
					<button type="button" onclick="reply()">등 록</button>
					<button type="button" onclick="slide_hide()">취 소</button>
				</form>
			</div>
		</div>
		</div>
	-->
</body>
</html>