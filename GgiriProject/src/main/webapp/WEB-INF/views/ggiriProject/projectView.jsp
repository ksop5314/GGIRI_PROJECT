
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
   let content = $("#content").val();
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
            $("#content").val("");
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
               html += "      <div id='reply'>";
               html += "         <table class='table'>";
               html += "             <tr>";
               html += "                <th width='150px' height='40px'>"+ rep[i].id +"님</th>"+"<td width='150px'>"+ rep[i].wdate +"</td>";
               html += "            </tr>";
               html += "            <tr>";
               html += "               <pre><td width='850px'>"+ rep[i].content +"</td></pre>";
               html += "               <td>";
               html += "                  <input type='hidden' name='repNo' id='repNo' value='" + rep[i].no + "'>";      
               html += "                  <input type='hidden' name='repId' id='repId' value='" + rep[i].id + "'>";         
               html += "                  <button type='button' id='deleteRep' name='deleteRep' onclick='deleteRep()'> 삭제 </button>";
               html += "               </td>";
               html += "            </tr>";
               html += "         </table>";
               html += "      </div>";
               
            } 
         
         $("#rep").html(rep);
         $("#reply").html(html);
         
         
      }, 
      error: function() {
         alert("댓글 가져오기 실패!")
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
				</c:if>
				<c:if test="${data.id == kakaoMember.id || data.id == googleMember.id || data.id == naverMember.id }">
					<input type="button" value="수정" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
					<input type="button" value="삭제" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
					<button type="submit" onclick="location='../ggiriComplete/completeWrite'">프로젝트 완성</button>
				</c:if>
		</div>
    </div>
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
<c:import url="../default/footer.jsp"></c:import>
</body>
</html>