<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="http://192.168.10.63:82/socket.io/socket.io.js"></script>
<style type="text/css">
	.img-circle{
		width: 50px; height: 50px;
	}
	.col-xs-6,#right-message-text,#right-alert-png {
		padding-top: 15px;
	}
	.inline-form {
	    border-radius: 10px;
	}
	#send-bar {
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
	<div class="container-fluid">
		<%@include file="../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../common/navleft.jsp"%>
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="page-header" style="margin-top: 0px;">
						<h2>실시간 문의</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-9">
						<div class="row" style="overflow:auto; overflow-x: hidden; height:500px;">
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
						
						</div>
						<div class="row">
							<div class="col-sm-9"> 
								<input type="text" class="form-control"	style="height:70px"/>
							</div>
							<div class="col-sm-3"> 
								<input type="button" class="form-control" style="height:70px" value="전송">
							</div>
						</div>
					</div>
					<div id="right-nav" class="col-sm-3" style="overflow:auto; overflow-x: hidden; height:500px;">
						<div class="row inline-form" v-for="jsonList in rightNavJsonList" style=" border:1px solid red;" >
							<div class="col-sm-2"><img class="img-circle" v-bind:src="jsonList.imgName"/></div>
							<div class="col-sm-1" id="right-alert-png"><img alt="" src="/resources/images/chatIcons/alert.png" style="width: 20px; height: 20px;"></div>
							<div class="col-sm-9" id="right-message-text">{{jsonList.name}}:{{jsonList.msg}}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var socket = io("http://192.168.10.63:82");
	var rightNav = new Vue({
		el: '#right-nav',
		data : {
			rightNavJsonList : []
		},
		methods :{
		}
	})
	
	socket.on("toStaff send message", function(json) {
		console.log(json);
		rightNav.rightNavJsonList = json
		console.log("배열담긴 것"+rightNav.rightNavJsonList);
	})
</script>
</html>