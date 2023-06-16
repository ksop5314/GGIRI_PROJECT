
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

//댓글
function rep() {
   var contextPath = "${pageContext.request.contextPath}";
   let projectNum = $("#projectNum").val();
   let id = $("#id").val();
   let content = $("#repContent").val();
   let memberNum = $("#memberNum").val();
   let form = { projectNum:projectNum, memberNum:memberNum, id:id, content:content}
   console.log(id);
   console.log(content);
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
            $("#repContent").val("");
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
         console.log(projectNum);
         let html = ""
            for(i = 0; i < rep.length; i++){
               let date = new Date(rep[i].wdate);
               let wdate = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 ";
               
               if(rep[i].id == id) {
	               wdate += date.getDate()+"일 "+date.getHours()+"시 ";
	               wdate += date.getMinutes()+"분 "+date.getSeconds()+"초";
	               html += "      <div id='reply'>";
	               html += "         <table class='table'>";
	               html += "             <tr>";
	               html += "                <th width='150px' height='40px'>"+ rep[i].id +"님</th>"+"<td width='150px'>"+ rep[i].wdate +"</td>";
	               html += "            </tr>";
	               html += "            <tr>";
	               html += "               <pre><td width='850px'>"+ rep[i].content +"</td></pre>";
	               html += "               <td>";
	               html += "                  <input type='hidden' name='repProjectNum' id='repProjectNum' value='" + projectNum + "'>";      
	               html += "                  <input type='hidden' name='repNo' id='repNo' value='" + rep[i].no + "'>";      
	               html += "                  <input type='hidden' name='repId' id='repId' value='" + rep[i].id + "'>";         
	               html += "                  <input type='hidden' name='repContent' id='repContent' value='" + rep[i].content + "'>";         
	               html += "                  <button type='button' id='deleteRep' name='deleteRep' style='width:50px;height:30px;' onclick='deleteRep()'> 삭제 </button>";
	               html += "                  <button type='button' id='modifyRep' name='modifyRep' style='width:50px;height:30px;' onclick='modifyRep()'> 수정 </button>";
	               html += "               </td>";
	               html += "            </tr>";
	               html += "         </table>";
	               html += "      </div>";
               } else {
	               wdate += date.getDate()+"일 "+date.getHours()+"시 ";
	               wdate += date.getMinutes()+"분 "+date.getSeconds()+"초";
	               html += "      <div id='reply'>";
	               html += "         <table class='table'>";
	               html += "             <tr>";
	               html += "                <th width='150px' height='40px'>"+ rep[i].id +"님</th>"+"<td width='150px'>"+ rep[i].wdate +"</td>";
	               html += "            </tr>";
	               html += "            <tr>";
	               html += "               <pre><td width='850px'>"+ rep[i].content +"</td></pre>";
	               html += "               <td>";         
	               html += "               </td>";
	               html += "            </tr>";
	               html += "         </table>";
	               html += "      </div>";
               }
            } 
         
         $("#reply").html(html);
         
         
      }, 
      error: function() {
         alert("댓글 가져오기 실패!")
      }
   });
}

function deleteRep() {
	var contextPath = "${pageContext.request.contextPath}";
	var no = $("#repNo").val();
	
	
	var result = confirm("댓글을 삭제 하시겠습니까?");
	
	if(result == true){
		
		$.ajax({
			
			url : contextPath + "/ggiriProject/repDelete?no=" + no,
			type : "GET",
			/* dataType : "json",
			data : JSON.stringify(form),
			contentType : "application/json; charset=utf-8", */
			success : function(data){
				if(data == 'OK'){
					replyData();
				} else {
					alert("success 안에서 댓글 삭제 실패");
					replyData();
				}
			},
			error : function(){
				console.log("error 댓글 삭제 오류");
			}
		});
	} else {
		result = false;
	}
			
}

function modifyRep() {
	var contextPath = "${pageContext.request.contextPath}";
	var no = $("#repNo").val();
	var id = $("#repId").val();
	var repContent = $("#repContent").val();
	
	var modal = document.getElementById("modal");
	var modifyRep = document.getElementById("modifyRep");
	var modifyModalRep = document.getElementById("modifyModalRep");
	
	modifyRep.addEventListener("click", e => {
	    modal.style.display = "flex";
	    let html;
	    html += "<div class='modal-window'>";
	    html += "<div class='title'><h2>댓글 수정 &nbsp; </h2></div>";
	    html += "<div class='close-area'>X</div>";
	    html += "<b>작성자 : " + id + " </b><br>";
	    html += " <input type='hidden' id='modifyNo' name='modifyNo' value='" + no + "'>";
	    html += " <div class='modalContent' id='modalContent' name='modalContent'>";
	    html += "<textarea id='modalTextArea' rows='1' cols='50'>" + repContent + "</textarea>";
	    html += "<input type='button' id='modalButton' name='modalButton' onclick='modifyModalRep()' value='수정'>";
	    html += "</div>";
	    html += "</div>";
	    
	    $("#modal").html(html);
	    
	    modifyModalClose();
	});
}


function modifyModalClose(){
	var closeBtn = modal.querySelector(".close-area");
	closeBtn.addEventListener("click", e => {
	    modal.style.display = "none";
	});
	
	modal.addEventListener("click", e => {
	    var evTarget = e.target;
	    if(evTarget.classList.contains("modal-overlay")) {
	        modal.style.display = "none";
	    }
	});
}

function modifyModalRep(){
	var contextPath = "${pageContext.request.contextPath}";
	let no = $("#modifyNo").val();
	let repContent = $("#modalTextArea").val();
	let enContent = encodeURI(repContent);
	let content = decodeURI(enContent);
	console.log(content);
	
	let form = { no:no, content:content};
	
	console.log(form);
	
	$.ajax({
		
		url : contextPath + "/ggiriProject/modifyModalRep",
		type : "post",
		async : false,
		data : JSON.stringify(form),
		contentType : "application/json",
		success : function(data){
			if(data == 'OK'){
				$("#modal").css("display","none");
				replyData();
			} else {
				alert("success 안에서 댓글 수정 실패");
				replyData();
			}
		},
		error : function(){
			console.log("error 댓글 수정 오류");
		}
	});
}
 	

	
/* 좋아요 */
function like(){
	var contextPath = "${pageContext.request.contextPath}";
	let memberNum = $("#myHeart").val();
	let projectNum = $("#projectNum").val();
	var clickLikeUrl = contextPath + "/resources/image/heart.png"
	var emptyLikeUrl = contextPath + "/resources/image/empty_heart.png"
	console.log(memberNum);
    console.log(projectNum);
	$.ajax({
		url: contextPath + "/ggiriProject/like_check/"+$('#projectNum').val(),
		type:"post",
		dataType:"json",
		contentType: "application/json; charset=utf-8",
		success: function(data){
			alert('좋아요 기능 성공..!!' + data + " 입니단");
			if($('#like_check').val() > data) {
				$("#myHeart").attr("src", emptyLikeUrl);
			} else {
				$("#myHeart").attr("src", clickLikeUrl);
			}
			$('#like_check').val(data);
			
			},
			error: function() {
				alert('좋아요 기능이 안 돼요..');
			}
		})
		

	
		
		
	}
</script>
<style type="text/css">
* {
    font-family: 'IBM Plex Sans KR', sans-serif;

}
table {
	border-collapse: collapse;
} 
#date {
    float: right;
}
#select {
    display: flex;
    justify-content: center;
}
button{
    background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;
    border-radius: 9999px;
    cursor: pointer;
}
button:hover{
	background-color: #EBF7FF;
    transition: 0.5s;
}
input[type=button] {
    background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;
    border-radius: 9999px;
    cursor: pointer;
}
input[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}
#skill {
    padding: 10px;
    font-size: 20px;
    width: fit-content;
    margin: auto;
    border-radius: 40px 80px / 80px 40px;
    background-color: #EBF7FF;
}

#container_1 {
   display: inline-block;
}

/* 모달창 css */

#modal.modal-overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 90%;
    display: none;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.25);
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    backdrop-filter: blur(1.5px);
    -webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
}
#modal .modal-window {
    background: rgba( 69, 139, 197, 0.70 );
    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 13.5px );
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 1px solid rgba( 255, 255, 255, 0.18 );
    width: 400px;
    height: 130px;
    position: relative;
    top: -100px;
    padding: 10px;
}
#modal .title {
    padding-left: 10px;
    display: inline;
    text-shadow: 1px 1px 2px gray;
    color: white;
    
}
#modal .title h2 {
    display: inline;
}
#modal .close-area {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#modal .content {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
}


</style>
</head>
<body>
    
<c:import url="../default/header.jsp"></c:import>
    <div class="wrap">
        <br>
        <h1>${data.title }</h1>
        <b>작성자: </b><b>${data.id }</b><b id="date">${data.prodate }</b><br><hr><br>
        <c:forEach var="selectedSkill" items="${data.skill}">
            <div style="display:inline" id="skill">${selectedSkill}</div>
        </c:forEach>
        <br><br>
        <br><br>
        <div id="content">
            <pre><c:out value="${data.content }"/></pre>
        </div>
        <br><br><hr><br>
        <div id="select">
			<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'"> &nbsp;
				<c:if test="${data.id==loginUser }">
					<input type="button" value="수정" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
					<input type="button" value="삭제" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
					<button type="submit" onclick="location='../ggiriComplete/completeWrite'">프로젝트 완성</button>
					<button id="myHeart" onclick="like()" value="${ggiriMemberInfo.memberNum }"><img id="myHeart" width="40px" height="40px"  src="../resources/image/empty_heart.png" alt="빈하트"><b id=like_check>${likeCount }</b></button>
					
				</c:if>
				<c:if test="${data.id == kakaoMember.id || data.id == googleMember.id || data.id == naverMember.id }">
					<input type="button" value="수정" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
					<input type="button" value="삭제" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
					<button type="submit" onclick="location='../ggiriComplete/completeWrite'">프로젝트 완성</button>
					<button id="like_check" onclick="like()"><img id="myHeart" width="40px" height="40px"  src="../resources/image/empty_heart.png" alt="빈하트"></button>
				</c:if>
		</div>
    </div>
    <br>
    <br>
    <div id="container_1" style="margin: auto;">
        <div id="first">
           <div style="width: 80%; margin: 0 auto; padding-top: 20px;">
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
                    <textarea id="repContent" name="repContent" rows="3" cols="100"></textarea> &nbsp;
                    <button type="button" style=" border-radius: 40px;" onclick="rep()">등 록</button> &nbsp;
                    <button type="reset" style=" border-radius: 40px;">취 소</button>
                 </div>
              </form>
              <br><br>
              <div id="reply" class="reply">
                 
              </div>
              <br>
           </div>
        </div>
     </div>
     <div id="modal" class="modal-overlay">
       <%-- <div class="modal-window">
           <div class="title">
               <h2>댓글 수정</h2>
           </div>
           <div class="close-area">X</div>
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
           <div class="modalContent" id="modalContent" name="modalContent">
				 <textarea id="modalTextArea" rows="10" cols="50"></textarea>
				 <input type="button" id="modalButton" name="modalButton" onclick="modifyModalRep()" value="수정">
           </div>
       </div> --%>
    </div>
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>