<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../../common/navheader.jsp" %>
		<div class="row" >
			<div class="col-sm-2" >
				<%@include file="../../common/navleft.jsp" %>
			</div>
			<div class="col-sm-10" >
				<div class="row">
					<div class="page-header">
						<h1>강사 출석체크 </h1>
					</div>
				</div>
				<div class="row">
					현재 출석가능한 시간이 아닙니다
				</div>
			</div>
		</div>
	</div>
</body>
</html>