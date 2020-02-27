<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style type="text/css">
th {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp"%>
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="page-header" style="margin-top: 0px;">
						<h2>개인정보 수정</h2>
					</div>
				</div>
				
				<div class="row">
					<form id="" class="well" method="post" action="/student/navHeader/myPageModify.hta" enctype="multipart/form-data" style="width: 700px;">
						<input type="hidden" name="no" value="${myPageInfo.no }">
						<div style="margin-bottom: 40px; text-align: center;">
							<img src="/resources/images/student/${myPageInfo.imageName }" alt="studentImg" id="form-stu-photo-img" style="width: 150px; height: 150px;">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 20px;">프로필 사진</label> <input type="file" class="form-control" name="imgFile">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 38px;">비밀번호</label> <input type="text" class="form-control" name="pwd">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 5px;">비밀번호 확인</label> <input type="text" class="form-control" name="pwdSecond">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 65px;">주소</label> <input type="text" class="form-control" value="${myPageInfo.address }" name="address">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 50px;">이메일</label> <input type="text" class="form-control" value="${myPageInfo.email }" style="margin-right: 40px;" name="email">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 50px;">연락처</label> <input type="text" class="form-control" value="${myPageInfo.phone }" name="phone">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 50px;">은행명</label> <input type="text" class="form-control" value="${myPageInfo.bankName }" style="padding-right: 14px; margin-right: 40px;" name="bankName">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 37px;">계좌번호</label> <input type="text" class="form-control" value="${myPageInfo.accountNumber }" name="accountNumber">
						</div>
						<div class="form-group form-inline">
							<input id="" type="submit" class="form-control" value="저장">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">	

	
	
</script>
</html>