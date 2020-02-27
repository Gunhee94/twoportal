<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Login V15</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="../resources/etc/homeDesign/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/css/util.css">
<link rel="stylesheet" type="text/css"
	href="../resources/etc/homeDesign/css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title"
					style="background-image: url(../resources/etc/homeDesign/images/bg-01.jpg);">
					<span class="login100-form-title-1"> 중앙HTA 학사관리 </span>
				</div>

				<form class="login100-form validate-form" action="loginform.hta" method="post">
					<c:if test="${param.error eq 'loginfail'}">
						<div class="form-inline alert alert-danger fade show">
							<strong>아이디나 비밀번호가 올바르지 않습니다.&nbsp&nbsp </strong> 
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
					</c:if>
					<c:if test="${param.error eq 'noSession'}">
						<div class="form-inline alert alert-danger fade show">
							<strong>로그인 세션이 만료되었습니다.&nbsp&nbsp </strong> 
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
					</c:if>
					<div class="form-inline">
						<div class="radio">
							<label><input type="radio" name="job" checked
								value="student">학생</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="job" 
								value="professor">교수</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="job" 
								value="staff">교직원</label>
						</div>
					</div>
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Username is required">
						<span class="label-input100">아이디</span> <input class="input100"
							type="text" name="userid" placeholder="아이디를 입력해주세요"> <span
							class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Password is required">
						<span class="label-input100">비밀번호</span> <input class="input100"
							type="password" name="pwd" placeholder="비밀번호를 입력해주세요"> <span
							class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-b-30">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="remember-me"> <label class="label-checkbox100"
								for="ckb1"> 아이디 저장하기</label>
						</div>

						<div>
							<a href="#" class="txt1"> 비밀번호 찾기 </a>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script
		src="../resources/etc/homeDesign/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="../resources/etc/homeDesign/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/etc/homeDesign/vendor/bootstrap/js/popper.js"></script>
	<script
		src="../resources/etc/homeDesign/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/etc/homeDesign/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="../resources/etc/homeDesign/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="../resources/etc/homeDesign/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="../resources/etc/homeDesign/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/etc/homeDesign/js/main.js"></script>

</body>
</html>