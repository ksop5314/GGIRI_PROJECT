<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messageList</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<style type="text/css">

	p {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20px;
	}
	
	.badge {
		margin-left: 15px;
	}
	
	.msg-container {
		max-width: 1170px;
		margin: auto;
	}
	
	.inbox_people {
		background: #f8f8f8 none repeat scroll 0 0;
		float: left;
		overflow: hidden;
		width: 40%;
		border-right: 1px solid #f7f7f7;
	}
	
	.inbox_msg {
		border: 1px solid #f7f7f7;
		border-radius: 15px;
		clear: both;
		overflow: hidden;
	}
	
	.top_spac {
		margin: 20px 0 0;
	}
	
	.recent_heading {
		float: left;
		width: 40%;
	}
	
	.srch_bar {
		display: inline-block;
		text-align: right;
		width: 60%;
		padding: 15px;
	}
	
	.headind_srch {
		padding: 10px 29px 10px 20px;
		overflow: hidden;
		border-bottom: 1px solid #f7f7f7;
	}

	.recent_heading h4 {
		color: #5fcf80;
		font-size: 30px;
		margin: auto;
		font-family: 'Nanum Pen Script', cursive;
	}
	
	.srch_bar input {
		border: 1px solid #cdcdcd;
		border-width: 0 0 1px 0;
		width: 80%;
		padding: 2px 0 4px 6px;
		background: none;
		font-family: 'Nanum Pen Script', cursive;
		font-size: 25px;
	}
	
	.srch_bar .input-group-addon button {
		background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
		border: medium none;
		padding: 0;
		color: #707070;
		font-size: 18px;
	}
	
	.srch_bar .input-group-addon {
		margin: 0 0 0 -27px;
	}
	
	.chat_ib h5 { font-size: 20px; color: #464646; margin: 0 0 8px 0; font-family: 'Nanum Pen Script', cursive; }
	.chat_ib h5 span { font-size: 17px; float: right;}
	.chat_ib p { font-size: 14px; color: #989898; margin: auto;}
	.chat_ib { float: left; padding: 0 0 0 15px; width:88%; }
	
	.chat_people { overflow: hidden; clear: both; }
	.chat_list { border-bottom: 1px solid #f7f7f7; margin: 0; padding: 18px 16px 10px; }
	
	.chat_list_box :hover {
		background-color: #d6ead0;
	}
	
	.inbox_chat { height: 550px; overflow-y: scroll;  }
	
	.active_caht { background: #ebebeb; }
	
	.received_msg {
		display: inline-block;
		padding: 0 0 0 10px;
		vertical-align: top;
		width: 92%;
	}	
	
	.received_withd_msg p {
		background: #f4f4f4 none repeat scroll 0 0;
		border-radius: 7px;
		color: #646464;
		font-size: 14px;
		margin: 0;
		padding: 10px 10px 10px 12px;
		width: 100%;
		font-family: 'Nanum Pen Script', sans-serif;
	}
	
	.time_date {
		color: #747474;
		display: block;
		font-size: 12px;
		margin: 5px 0 8px;
	}
	
	.received_withd_msg { width: 57%; }
	
	.mesgs {
		float: left;
		padding: 30px 15px 0 25px;
		width: 60%;
	}
	
	.sent_msg p {
		background: #97df93 none repeat scroll 0 0;
		border-radius: 7px;
		font-size: 14px;
		margin: 0;
		color: #fff;
		padding: 10px 10px 10px 12px;
		width: 100%;
		font-family: 'Nanum Pen Script', sans-serif;
	}
	
	.outgoing_msg { overflow: hidden; margin: 26px 0 26px; }
	.sent_msg { float: right; width: 46%; font-family: 'Nanum Pen Script', sans-serif;}
	
	.input_msg_write input {
		background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
		border: medium none;
		color: #4c4c4c;
		font-size: 15px;
		min-height: 48px;
		width: 100%;
	}
	
	.type_msg { border-top: 1px solid #dfdfdf; position: relative; }
	.msg_send_btn {
		background: #97df93 none repeat scroll 0 0;
		border: medium none;
		border-radius: 50%;
		color: #fff;
		cursor: pointer;
		font-size: 17px;
		height: 33px;
		position: absolute;
		right: 0;
		top: 11px;
		width: 33px;
	}
	
	.msg_send_btn:hover {
		background: #5fcd58 none repeat scroll 0 0;
	}
	
	.messaging { padding: 0 0 50px 0; }
	.msg_history { height: 516px; overflow-y: auto; }
	
	
	
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<div class="msg-container">
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>Recent</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button" name="srchBtn" id="srchBtn"><i class="fa fa-search" aria-hidden="true"></i></button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
						<c:import url="messageAjax.jsp"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		
		function FirstMessageList() {
				$.ajax({
					
					url : contextPath + "/ggiriMessage/messageAjax",
					method : "GET",
					data : {
					},
					success : function(data){
						console.log("메세지 리스트 로드 성공");
						$('.inbox_chat').html(data);
						
						$('.chat_list').on('click', function(){
							
							let room = $(this).attr('room');
							let otherNick = $(this).attr('otherNick');
							
							$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
							$('chat_list_box'+room).addClass('active_chat');
							
							let send_msg = "";
							send_msg += "<div class='type_msg'>";
							send_msg += "	<div class='input_msg_write row'>";
							send_msg += "		<div class='col-11'>";
							send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력하세요..'/>";
							send_msg += "		</div>";
							send_msg += "		<div class='col-11'>";
							send_msg += "			<button type='button' class='msg_send_btn'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
							send_msg += "		</div>";
							send_msg += "	</div>";
							send_msg += "</div>";
							
							$('.send_message').html(send_msg);
							
							$('.msg_send_btn').on('click', function(){
								SendMessage(room, otherNick);
							});
							
							MessageContentList(room);
							
						});
					}
				});
		};
				
		var MessageList = function() {
			$.ajax({
				
				url : contextPath + "/ggiriMessage/messageAjax",
				method : "GET",
				data : {
				},
				success : function(data){
					console.log("메세지 리스트 로드 성공");
					$('.inbox_chat').html(data);
					
					$('.chat_list').on('click', function(){
						
						let room = $(this).attr('room');
						let otherNick = $(this).attr('otherNick');
						
						$('.chat_list_box').not('.chat_list_box'+room).removeClass('active_chat');
						$('chat_list_box'+room).addClass('active_chat');
						
						let send_msg = "";
						send_msg += "<div class='type_msg'>";
						send_msg += "	<div class='input_msg_write row'>";
						send_msg += "		<div class='col-11'>";
						send_msg += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력하세요..'/>";
						send_msg += "		</div>";
						send_msg += "		<div class='col-11'>";
						send_msg += "			<button type='button' class='msg_send_btn'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
						send_msg += "		</div>";
						send_msg += "	</div>";
						send_msg += "</div>";
						
						$('.send_message').html(send_msg);
						
						$('.msg_send_btn').on('click', function(){
							SendMessage(room, otherNick);
						});
						
						MessageContentList(room);
						
					});
					
					$('.chat_list_box:first').addClass('active_chat');
					
				}
			});
		};
	
		var MessageContentList = function(room) {
			
			$.ajax({

				url : contextPath + "/ggiriMessage/messageContent",
				method : "GET",
				data : {
					room : room
				},
				success : function(data) {
					console.log("메세지 내용 가져오기 성공");
					
					$('.msg_history').html(data);
					$('.msg_history').scrollTop($(".msg_history")[0].scrollHeight);
					
				},
				error : function(){
					alert("서버 에러");
				}
			});
			
			$('.unread'+room).empty();
		};
		
		
		var SendMessage = function(room, otherNick) {
			
			let content = $('.write_msg').val();
			
			content = content.trim();
			
			if(content == ""){
				alert("메세지를 입력하세요.");
			} else {
				
				$.ajax({
					
					url : contextPath + "/ggiriMessage/messageSendList",
					method : "GET",
					data : {
						room : room,
						otherNick : otherNick,
						content : content
					},
					success : function(data) {
						console.log("메세지 전송 성공");
						
						$('.write_msg').val("");
						
						MessageContentList(room);
						
						MessageList();
					},
					error : function(){
						alert('서버 에러');
					}
					
				});
			}
		};
		
		$(document).ready(function(){
			FirstMessageList();
		});
		
	</script>
		
</body>
</html>



























