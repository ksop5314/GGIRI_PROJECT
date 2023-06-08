<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/projectView.jsp</title>
<style type="text/css">
    .wrap {
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
    #skill {
        padding: 10px;
        font-size: 20px;
        width: fit-content;
        margin: auto;
        font-family: 'IBM Plex Sans KR', sans-serif;
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
        font-family: 'IBM Plex Sans KR', sans-serif;
        cursor: pointer;
    }
    /* #like:hover{
      	background-color: #EBF7FF;
        transition: 0.5s;
    } */
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
    <div id="like">
	    <c:if test="${likeId  == 0}">
	        <button type="button" class="btn btn-light like-btn" data-projectnum="${data.projectNum}">좋아요</button>
	        <input type="hidden" id="likecheck" value="${likeId}">
	    </c:if>
	    <c:if test="${likeId == 1}">
	        <button type="button" class="btn btn-danger like-btn" data-projectnum="${data.projectNum}">좋아요 취소</button>
	        <input type="hidden" id="likecheck" value="${likeId}">
	    </c:if>
	</div>
        <br><br>
        <br><br>
        <div id="content">
            <pre><c:out value="${data.content }"/></pre>
        </div>
        <br>
        <hr><br>
        <div id="reply"></div>
        <div id="select">
            <c:if test="${data.id==loginUser }">
                <input type="button" value="수정" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'" /> &nbsp;
                <input type="button" value="삭제" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'" /> &nbsp;
            </c:if>
            <input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'" />
        </div>
    </div>
    <c:import url="../default/footer.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('.like-btn').click(function() {
        var projectNum = $(this).data('projectnum');
        increaseLikeCount(projectNum);
    });

    function increaseLikeCount(projectNum) {
        $.ajax({
            type: 'POST',
            url: '/project/increase-like-count/' + projectNum,
            success: function(response) {
                // 서버로부터의 응답을 처리하는 코드
                console.log(response);
                // 추가적인 처리 로직을 구현하거나 화면을 갱신하는 등의 작업을 수행할 수 있습니다.

                // 좋아요 버튼 상태 변경
                var likeCheck = $('#likecheck');
                if (likeCheck.val() == 0) {
                    likeCheck.val(1);
                    likeCheck.siblings('.like-btn').removeClass('btn-light').addClass('btn-danger').text('좋아요 취소');
                } else {
                    likeCheck.val(0);
                    likeCheck.siblings('.like-btn').removeClass('btn-danger').addClass('btn-light').text('좋아요');
                }
            },
            error: function(xhr, status, error) {
                // 에러 처리 로직을 구현하는 코드
                console.error(error);
                // 에러 메시지를 표시하거나 적절한 예외 처리를 수행할 수 있습니다.
            }
        });
    }
});

/* $(document).ready(function() {
    $('.like-btn').click(function() {
        var projectNum = $(this).data('projectnum');
        increaseLikeCount(projectNum);
    });

    function increaseLikeCount(projectNum) {
        $.ajax({
            type: 'POST',
            url: '/project/increase-like-count/' + projectNum,
            success: function(response) {
                // 서버로부터의 응답을 처리하는 코드
                console.log(response);
                // 추가적인 처리 로직을 구현하거나 화면을 갱신하는 등의 작업을 수행할 수 있습니다.
            },
            error: function(xhr, status, error) {
                // 에러 처리 로직을 구현하는 코드
                console.error(error);
                // 에러 메시지를 표시하거나 적절한 예외 처리를 수행할 수 있습니다.
            }
        });
    }
});
 */
/* $('#likebtn').click(function(){
	likeupdate();
});
	
function likeupdate(){
	var root = getContextPath(),
	likeurl = "/like/likeupdate",
	mid = $('#mid').val(),
	bid = $('#bid').val(),
	count = $('#increaseLikeCount').val(),
	data = {"ltmid" : mid,
			"ltbid" : bid,
			"count" : count};
		
$.ajax({
	url : root + likeurl,
	type : 'POST',
	contentType: 'application/json',
	data : JSON.stringify(data),
	success : function(result){
		console.log("수정" + result.result);
		if(count == 1){
			console.log("좋아요 취소");
			 $('#increaseLikeCount').val(0);
			 $('#likebtn').attr('class','btn btn-light');
		}else if(count == 0){
			console.log("좋아요!");
			$('#increaseLikeCount').val(1);
			$('#likebtn').attr('class','btn btn-danger');
		}
	}, error : function(result){
		console.log("에러" + result.result)
	}
	
	});
};
	
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}     */
</script>
</body>
</html>
