<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	
	
	<section>

<div id="messageArea"></div>
	<div>
		<div class="body-box" id="chatbox">
		 <table>
 		<tr>
 		<td> <input type="hidden" id="userName" value="${user.username }" />
 		<input type="text" id="message" name="message" onkeydown="JavaScript:Enter_Check();"/></td>
		</tr>
 	<tr>
 	<td><input type="button" id="sendBtn" value="submit" /></td>
 					</table>
			
		</div>
		</div>




	</section>
<hr><p></p><p></p>

</body>
<script type="text/javascript">





	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://192.168.42.125:8080/dong/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
	
		sock.send($("#userName").val()+":"+$("#message").val());
		
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("메세지 종료");

	}
	}


	function Enter_Check(){
		
		if(event.keyCode ==13){
			sendMessage();
			return;
		}
		
	}
	
	
</script>


<script>

	</script>

</html>

