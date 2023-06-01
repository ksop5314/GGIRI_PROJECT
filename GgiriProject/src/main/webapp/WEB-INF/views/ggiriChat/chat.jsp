<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	let url = "ws://localhost:8090/spring/chatserver";
	let ws;
	
	$("#btnConnect").click(function(){
		if($("#user").val().trim() != ''){
			ws = new WebSocket(url);
			
			ws.onopen = function (evt){
				print($("#user").val(), "님이 입장했습니다.");
				
				ws.send("1#" + $("#user").val() + "#");
				
				$("#user").attr("readonly", true);
				$("#btnConnect").attr("disabled", true);
				$("#btnDisconnect").attr("disabled", false);
				
				$("#message").attr("disabled", false);
				$("#message").focus();
			};
			
			ws.onmessage = function(evt){
				let index = evt.data.indexOf("#", 2);
				let no = evt.data.substring(0, 1);
				let user = evt.data.substring(2, index);
				let txt = evt.data.substring(index + 1);
				
				if(no == "1"){
					print2(user);
				} else if(no == "2"){
					print(user, txt);
				} else if(no == "3"){
					print3(user);
				}
				$("#list").scrollTop($("#list").prop("scrollHeight"));
			};
			
			ws.onclose = function(evt){
				console.log("소켓이 닫힙니다.");
			}
			
			ws.onerror = function(evt){
				console.log(evt.data);
			};
		} else {
			alert("유저명을 입력하세요.");
			$("#user").focus();
		}
	});
	
	function print(user, txt){
		let temp = "";
		temp += "<div style='margin-bottom:3px;'>";
		temp += "[" + user + "]";
		temp += txt;
		temp += "<span style='font-size:11px;color:#777;'>" + new Date().toLocaleTimeString() + "</span>";
		temp += "</div>";
		
		$("#list").append(temp);
	}
	
	function print2(user){
		let temp = '';
		temp += "<div style='margin-bottom:3px;'>";
		temp += "'" + user + "' 이(가) 접속했습니다.";
		temp += "<span style='font-size:11px;color:#777;'>" + new Date().toLocaleTimeString() + "</span>";
		temp += "</div>";
		
		$("#list").append(temp);
	}
	
	function print3(user){
		let temp = "";
		temp += "<div style='margin-bottom:3px;'>";
		temp += "'" + user + "' 이(가) 종료했습니다.";
		temp += "<span style='font-size:11px;color:#777;'>" + new Date().toLocaleTimeString() + "</span>";
		temp += "</div>";
		
		$("#list").append(temp);
	}
	
	$("#user").keydown(function(){
		if(event.keyCode == 13){
			$("#btnConnect").click();
		}
	});
	
	$("#message").keydown(function(){
		if(event.keyCode == 13){
			ws.send("2#" + $("#user").val() + "#" + $(this).val());
			print($("#user").val(), $(this).val());
			$("#message").val("");
			$("#message").focus();
		}
	});
	
	$("#btnDisconnect").click(function(){
		ws.send("3#" + $("#user").val() + "#");
		ws.close();
		
		$("#user").attr("readonly", false);
		$("#user").val("");
		
		$("#btnConnect").attr("disabled", false);
		$("#btnDisconnect").attr("disabled", true);
		
		$("#message").val("");
		$("#message").attr("disabled", true);
	});
	
	
</script>
</head>
<body>
	<div>
		<h1>Chat</h1>
		<table>
			<tr>
				<td><input type="text" name="user" id="user" class="form-control" placeholder="유저명"></td>
				<td>
					<button type="button" class="btn btn-default" id="btnConnect"> 연결 </button>
					<button type="button" class="btn btn-default" id="btnDisconnect"> 종료 </button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="list"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="message" id="message" placeholder="대화 내용을 입력하세요." class="form-control" disabled>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>