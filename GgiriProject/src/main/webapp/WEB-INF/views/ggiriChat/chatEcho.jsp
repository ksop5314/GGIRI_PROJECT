<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatEcho</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">

$(function(){
	let sock = new SockJS("http://localhost:8080/root/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	}
});
	
</script>
</head>
<body>
	<input type="hidden" id="user" value="${loginUser }"/>
	<label>${loginUser }</label> :  
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"/>
	<div id="messageArea"></div>
</body>
</html>