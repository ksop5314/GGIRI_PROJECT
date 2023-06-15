
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
function checkFavorite(){ //즐겨찾기 여부를 체크하는 함수
	const no = $('.no').val();
	$.ajax({
		url: "mypage_favorite_check.do",
        type: "POST",
        data: {
            no: no
        },
        success: function (data) {
        	if(data == "existFavorite"){
        		$("#favoriteStar").attr("src", "resources/icon/star-fill.svg" );
        	}else{
        		$("#favoriteStar").attr("src", "resources/icon/star.svg" );
        	}
        },
	})
}

function makeFavorite(){ //즐겨찾기를 만들고 삭제하는 함수
	const no = $('.no').val();
	$.ajax({
		url: "mypage_favorite.do",
        type: "POST",
        data: {
            no: no
        },
        success: function (data) {
        	if(data=="loginFirst"){
        		alert("로그인을 해주세요.");
        	}else if(data=="add"){
        		alert("즐겨찾기에 추가되었습니다.")
        		checkFavorite();
        	}else if(data=="delete"){
        		alert("즐겨찾기가 해제되었습니다.")
        		checkFavorite();
        	}
        },
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
	
}  
//좋아요 버튼 클릭 시 처리
/* 	$(document).on('click', '.like-btn', function() {
	  var projectNum = $(this).data('projectnum');
	  var likeCheck = $('#likecheck').val();
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
				alert("댓글 가져오기 실패!")
			}
		});
	}
<<<<<<< HEAD

	// 대댓글
	function re_rep() {
		var contextPath = "${pageContext.request.contextPath}";
		
		var projectNum = $("#projectNum").val();
		var id = $("#id").val();
		var content = $("#content").val();
		
		let form = { projectNum:projectNum, id:id, content:content }
		
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
	  // 좋아요 버튼이 눌린 경우
	  if (likeCheck == 0) {
	    $.ajax({
	      type: 'POST',
	      url: '/like',
	      data: { projectNum: projectNum },
	      success: function(response) {
	        if (response.success) {
	          // 성공적으로 좋아요 처리가 완료된 경우
	          $('.like-btn').text('좋아요 취소');
	          $('.like-btn').removeClass('btn-light').addClass('btn-danger');
	          $('#likecheck').val(1);
	        }
	      }
	    });
	  }
	  // 좋아요 취소 버튼이 눌린 경우
	  else if (likeCheck == 1) {
	    $.ajax({
	      type: 'POST',
	      url: '/unlike',
	      data: { projectNum: projectNum },
	      success: function(response) {
	        if (response.success) {
	          // 성공적으로 좋아요 취소가 완료된 경우
	          $('.like-btn').text('좋아요');
	          $('.like-btn').removeClass('btn-danger').addClass('btn-light');
	          $('#likecheck').val(0);
	        }
	      }
	    });
	  }
	});
 */
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
           // alert("댓글 등록 실패ㅠ")
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
                  html += "      <div id='reply'>";
                  html += "         <table class='table'>";
                  html += "             <tr>";
                  html += "                <th width='150px' height='40px'>"+ rep[i].id +"님</th>"+"<td width='150px'>"+ rep[i].wdate +"</td>";
                  html += "            </tr>";
                  html += "            <tr>";
                  html += "               <pre><td width='850px'>"+ rep[i].content +"</td></pre>";
                  html += "            </tr>";
                  html += "         </table>";
                  html += "      </div>";
                  html += "      <div style='text-align: right;'>";
                  html += "         <button type='button' style='margin-bottom: 10px;' onclick='re_click()'>대댓글 작성</button> &nbsp;";
                  html += "         <button type='button' style='margin-bottom: 10px;' onclick='re_hide()'>취소</button><hr>";
                  html += "      </div>";
                  html += "      <div>";
                  html += "         <div id='r_frm'>";
                  html += "            <input type='hidden' name='projectNum' id='projectNum' value='${data.projectNum }'>";
                  html += "            <input type='hidden' name='id' id='id' value='${data.id }'>";
                  html += "            <b>대댓글</b>";
                  html += "            <hr>";
                  html += "            <b>작성자 : ${loginUser }</b><br>";
                  html += "               <div>";
                  html += "                  <textarea id='content' name='content' rows='3' cols='100'></textarea> &nbsp;";
                  html += "                  <button type='button' onclick='re_rep()'>등 록</button> &nbsp;";
                  html += "                  <button type='reset'>취 소</button>";
                  html += "               </div>";
                  html += "         </div>";
                  html += "      </div>";
                  
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
               rehtml += "      <div id='re_reply'>";
               rehtml += "         <tr>";
               rehtml += "            <th width='150px'>"+ redata.id +"님</th>";
               rehtml += "         </tr>";
               rehtml += "         <tr>";
               rehtml += "            <td width='50px'>"+ redata.wdate +"</td>";
               rehtml += "         </tr>";
               rehtml += "         <tr>";
               rehtml += "            <pre><td width='850px'>"+ redata.content +"</td></pre>";
               rehtml += "         </tr>";
               rehtml += "      </div>";
            })
            $("#re_reply").html(rehtml)
         }, 
         error: function() {
            alert("댓글 가져오기 실패!")
         }
      })
   }
	function re_replyData() {
		
	
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
#content pre {
	font-family: 'IBM Plex Sans KR', sans-serif;
}
#like{
	float: right;
	background-color: #B2CCFF;
	color: black;
	border: none;
	width: 145px;
	height: 50px;
	font-size: 18px;
	border-radius: 9999px;
	cursor: pointer;
}
    /* #like:hover{
      	background-color: #EBF7FF;
        transition: 0.5s;
    } */
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
    <div class="wrap">
        <br>
        <h1>${data.title }</h1>
        <b>작성자: </b><b>${data.id }</b><b id="date">${data.prodate }</b><br><hr><br>
        <%-- 
          <div id="like">
		     <c:if test = "${sessionScope.user_id != null and sessionScope.user_id != dto.user_id
			    or sessionScope.navername != null and sessionScope.navername != dto.user_id
			    or sessionScope.kakaonickname != null and sessionScope.kakaonickname != dto.user_id}">
				<button type = "button" id = "btnRecommend">추천하기</button>
    		</c:if>
		  </div> --%>
        <c:forEach var="selectedSkill" items="${data.skill}">
            <div style="display:inline" id="skill">${selectedSkill}</div>
        </c:forEach>
   <%-- <div id="like">
	    <c:if test="${likeId  == 0}">
	        <button type="button" class="btn btn-light like-btn" data-projectnum="${data.projectNum}">좋아요</button>
	        <input type="hidden" id="likecheck" value="${likeId}">
	    </c:if>
	    <c:if test="${likeId == 1}">
	        <button type="button" class="btn btn-danger like-btn" data-projectnum="${data.projectNum}">좋아요 취소</button>
	        <input type="hidden" id="likecheck" value="${likeId}">
	    </c:if> 
	</div> 
	--%>
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
						<input type="hidden" name="projectNum" id="projectNum"  value="${data.projectNum }">
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
						<div>
							<textarea id="content" name="content" rows="3" cols="100"></textarea> &nbsp;
							<button type="button" onclick="rep()">등 록</button> &nbsp;
							<button type="reset">취 소</button>
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