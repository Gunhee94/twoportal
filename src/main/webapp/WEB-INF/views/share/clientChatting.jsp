<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="http://192.168.10.63:82/socket.io/socket.io.js"></script>

	<style type="text/css">
		.img-circle{
			width: 50px; height: 50px;
		}
		.col-xs-6 {
			padding-top: 15px;
		}
		footer {
		    position:absolute;
		    bottom:0;
		    width:90%;
		    height:70px;  
		}
		body {
			overflow-x:hidden;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="row inline-form" >
				<div class="col-xs-3"><img class="img-circle" src="/resources/images/student/student1.jpg"/></div>
				<div class="col-xs-6">안녕하세요</div>
				<div class="col-xs-3"></div>
				<hr width="98%">
			</div>
			<div class="row inline-form" >
				<div class="col-xs-3"></div>
				<div class="col-xs-6">네 무슨일 이신가요?</div>
				<div class="col-xs-3"><img class="img-circle" src="/resources/images/student/student0.jpg"/></div>
				<hr width="98%">
			</div>
			<div class="row inline-form" >
				<div class="col-xs-3"><img class="img-circle" src="/resources/images/student/student1.jpg"/></div>
				<div class="col-xs-6">장학금이 입금되지 않았습니다 </div>
				<div class="col-xs-3"></div>
				<hr width="98%">
			</div>
			<div class="row inline-form" >
				<div class="col-xs-3"></div>
				<div class="col-xs-6">네 바로 확인 해 보겠습니다</div>
				<div class="col-xs-3"><img class="img-circle" src="/resources/images/student/student0.jpg"/></div>
				<hr width="98%">
			</div>
		</div>
		<footer>
			<div class="row">
				<div class="col-xs-9"> 
					<input id="message" type="text" class="form-control" style="width: 300px; height:70px"/>
				</div>
				<div class="col-xs-3"> 
					<input id="send-btn" type="button" class="form-control" style="height:70px" value="전송">
				</div>
			</div>
		</footer>
	</div>
	<input id="user-name" type="hidden" value="${loginInfo.name }">
	<input id="user-img-name" type="hidden" value="${loginInfo.job == 'student'? loginInfo.student.imageName : loginInfo.professor.imageName  }">
</body>
<script>
	var socket = io("http://192.168.10.63:82");
	
	function sendMessage(event) {
		var imgName = "/resources/images/student/" + $("#user-img-name").val(); 
		socket.emit('toNode send message', $("#user-name").val(),imgName, $("#message").val());
		$("#message").val('');
		event.preventDefault();
	}

	$("#message").on("keydown",function(event){
		if (window.event.keyCode == 13) {
			sendMessage(event)
		}
	});
	$("#send-btn").on("click",function(event){
		sendMessage(event)
	});
	
	socket.on("toClient message", function(msg) {
		console.log(msg);
		$("body").append(msg);
	})
	
$(document).ready(function(){
});
</script>


</html>