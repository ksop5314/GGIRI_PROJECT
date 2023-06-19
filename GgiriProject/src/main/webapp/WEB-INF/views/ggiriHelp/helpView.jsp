<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helpView</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	
	$(function(){
		adminRepList();
	});
	
	function adminRepResult() {
		
		let helpNo = $("#adminHelpNo").val();
		let helpMember = $("#helpMember").val();
		let adminRep = $("#adminRep").val();
		let adminid = $("#loginId").val();
		
		console.log(helpNo);
		console.log(helpMember);
		console.log(adminRep);
		console.log(adminid);
		
		let form = { helpNo:helpNo, adminid:adminid, helpMember:helpMember, adminRep:adminRep}	
		
		$.ajax({
		      url: contextPath + "/ggiriAdmin/adminHelpReply", 
		      type: "post",
		      data: JSON.stringify(form),
		      contentType: "application/json; charset=UTF-8",
		      success: function(data) {
		         if(data == 1){
		        	 adminRepList();
		            $("#adminRep").val("");
		         } else {
		            alert("답변달기 실패");
		         }
		      },
		      error: function() {
		         alert("관리자 답변 등록 오류")
		      }
		   });
		
	}
	
	function adminRepList() {
		   
	   let helpNo = $("#helpNo").val();
	   console.log(helpNo);
	   
	   $.ajax({
	      url: contextPath + "/ggiriAdmin/adminRepData?helpNo=" + helpNo,
	      type: "get",
	      success: function(rep) {
	         let html = "";
			 let id = $("#loginId").val();
			 console.log(rep);
	         
             if(rep[0] != null && id != 'GGIRIADMIN' ){
		         let date = new Date(rep[0].adminRepDate);
	             let adminRepDate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 ";
	             adminRepDate += date.getDate()+"일 "+date.getHours()+"시 ";
	             adminRepDate += date.getMinutes()+"분 "+date.getSeconds()+"초";
	             html += "      <br><hr><div id='adminReply'>";
	             html += "         <table class='table'>";
	             html += "             <tr>";
	             html += "                <th width='150px' height='40px'> Ggiri 관리자 </th>"+"<td width='150px'>"+ rep[0].adminRepDate +"</td>";
	             html += "            </tr>";
	             html += "            <tr>";
	             html += "               <td width='500px'><pre>"+ rep[0].adminRep +"</pre></td>";
	             html += "            </tr>";
	             html += "         </table>";
	             html += "      </div>";
	             
	        	 $("#adminRepDiv").html(html);
	        	 
             } else if(rep[0] != null && id == 'GGIRIADMIN' ){
            	 let date = new Date(rep[0].adminRepDate);
	             let adminRepDate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 ";
	             adminRepDate += date.getDate()+"일 "+date.getHours()+"시 ";
	             adminRepDate += date.getMinutes()+"분 "+date.getSeconds()+"초";
	             html += "      <br><hr><div id='adminReply'>";
	             html += "         <table class='table'>";
	             html += "             <tr>";
	             html += "                <th width='150px' height='40px'> Ggiri 관리자의 답변 </th>"+"<td width='150px'>"+ rep[0].adminRepDate +"</td>";
	             html += "            </tr>";
	             html += "            <tr>";
	             html += "               <input type='hidden' name='adminRepNo' id='adminRepNo' value='" + rep[0].adminRepNo + "'>";
	             html += "               <input type='hidden' name='contentList' id='contentList" + rep[0].adminRepNo + "' value='" + rep[0].adminRep + "'>";
	             html += "               <td width='850px'><pre id='adminMainRep'>"+ rep[0].adminRep +"</pre><div id='modifyAdminRep' name='modifyAdminRep' style='display: none;'></div></td>";
            	 html += "               <td><button type='button' id='deleteRep' name='deleteRep' style='width:50px;height:30px;' onclick='deleteAdminRep()'> 삭제 </button>";
                 html += "               <button type='button' id='modifyRep' name='modifyRep' style='width:50px;height:30px;' onclick='modifyAdminRep(" + rep[0].adminRepNo + ")'> 수정 </button></td>";
	             html += "            </tr>";
	             html += "         </table>";
	             html += "      </div>";
	             
	        	 $("#adminRepDiv").html(html);
	      	 } else {
            	 html += "<br><hr><br><div> 해당 문의사항은 빠른시간내에 답변 드리겠습니다. </div>";
	        	 $("#adminRepDiv").html(html);
             } 
	      },
	      error : function(){
	    	  alret("에러 운영자 답변 불러오기 실패");
	   	  }
	  });
	}
	
	function deleteAdminRep(){
	   var adminRepNo = $("#adminRepNo").val();
	   
	   var result = confirm("답변을 삭제 하시겠습니까?");
	   
	   if(result == true){
	      
	      $.ajax({
	         
	         url : contextPath + "/ggiriAdmin/deleteAdminRep?adminRepNo=" + adminRepNo,
	         type : "GET",
	         /* dataType : "json",
	         data : JSON.stringify(form),
	         contentType : "application/json; charset=utf-8", */
	         success : function(data){
	            if(data == 'OK'){
	               adminRepList();
	            } else {
	               alert("success 안에서 답변 삭제 실패");
	               adminRepList();
	            }
	         },
	         error : function(){
	            console.log("error 답변 삭제 오류");
	         }
	      });
	   } else {
	      result = false;
	   }
	}
	
	function modifyAdminRep(no) {
		   let adminRepNo = no;
		   let contentList = $("#contentList" + adminRepNo).val();
		   
		   $("#modifyAdminRep").css("display", "flex");
		   $("#adminMainRep").css("display", "none");
		   
		   let html = "";
		   html += "<div class='title'><h4>답변 수정 &nbsp; </h4></div><br>";
		   html += "<input type='hidden' id='modifyNo' name='modifyNo' value='" + no + "'>";
		   html += "<div class='adminContent' id='adminContent' name='adminContent'>";
		   html += "<textarea id='adminTextArea' rows='10' cols='50'>" + contentList + "</textarea>";
		   html += "<input type='button' id='modifyButton' name='modifyButton' onclick='modifyAdminRepResult(" + adminRepNo + ")' value='수정'>";
		   html += "<input type='button' id='modifyCancelButton' name='modifyCancelButton' onclick='modifyAdminRepCancel()' value='취소'>";
		   html += "</div>";
		   
		   $("#modifyAdminRep").html(html);
		   
	}
	
	function modifyAdminRepCancel() {
		$("#modifyAdminRep").css("display", "none");
		adminRepList();
    }
	
	function modifyAdminRepResult(repNo) {
		
	   let adminTextArea = $("#adminTextArea").val();
	   let enContent = encodeURI(adminTextArea);
	   let adminRep = decodeURI(enContent);
	   let adminRepNo = repNo;
	   console.log(adminRep);
	   
	   let form = { adminRepNo:adminRepNo, adminRep:adminRep};
	   
	   console.log(form);
	   
	   $.ajax({
	      
	      url : contextPath + "/ggiriAdmin/modifyAdminRep",
	      type : "post",
	      data : JSON.stringify(form),
	      contentType : "application/json",
	      success : function(data){
	         if(data == 'OK'){
	            $("#modifyAdminRep").css("display","none");
	            adminRepList();
	         } else {
	            alert("success 안에서 댓글 수정 실패");
	            adminRepList();
	         }
	      },
	      error : function(){
	         console.log("error 댓글 수정 오류");
	      }
	   });
		
	}
	
</script>
<style type="text/css">

* {
	margin: 0 auto;
}
.helpViewSize {
	width: 800px;
	margin-left: 150px;
}
input[type=button] {
    background-color: #E2EAE9 ;
    color: #333333;
    border: none;
    width: 100px;
    height: 30px;
    font-size: 14px;
	border-radius: 40px 80px / 80px 40px;
    cursor: pointer;
}
input[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}
hr {
    background: gray;
    height: 1px;
    border: 0;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="helpViewSize">
		<input type="hidden" id="helpNo" name="helpNo" value="${data.helpNo }">
		<input type="hidden" id="loginId" name="loginId" value="${loginUser }">
		<b> 문의 번호 ) &nbsp; </b>${data.helpNo }<br>
		<div id="head">
			<b> 회원 아이디 ) &nbsp; </b> ${data.id }<br><b> 제목 ) &nbsp; </b> ${data.title }
			<p style="float: right">${data.helpDate }</p><b style="float: right"> 문의 날짜 ) &nbsp; </b>
		</div>
		<hr>
		<div>
			<b>문의 내용 )</b><p style="height: 80px; border: 1px solid gray; padding: 5px">${data.content }</p>
		</div>
		<br>
		<c:if test="${data.id==loginUser || data.id == kakaoMember.id || data.id == googleMember.id || data.id == naverMember.id }">
			<td colspan="4" align="right">
				<input type="button" value="수정" onclick="location.href='../ggiriHelp/helpModifyForm?helpNo=${data.helpNo }'"> &nbsp;
				<input type="button" value="삭제" onclick="location.href='../ggiriHelp/helpDelete?helpNo=${data.helpNo }'"> &nbsp;
			</td>
		</c:if>
		<c:if test="${loginUser == 'GGIRIADMIN' }">
			<div class="adminHelpReplySize">
				<div class="adminHelpRep">
					<input type="hidden" id="helpMember" name="helpMember" value="${data.id }">
					<input type="hidden" id="adminHelpNo" name="adminHelpNo" value="${data.helpNo }">
					<h4> 답변 내용 </h4>
					<textarea rows="10" cols="50" id="adminRep" name="adminRep" style="resize: none;"></textarea><br>
					<button type="button" id="adminRepResult" name="adminRepResult" onclick="adminRepResult()"> 완료 </button>
				</div>
			</div>
		</c:if>
		<div id="adminRepDiv">
			
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>