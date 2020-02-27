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
						<h2>마이 페이지</h2>
					</div>
				</div>
				<c:choose>
					<c:when test="${param.result eq 'success' }">
						<div class="alert alert-success" role="alert">
							<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
							<strong>수정이 완료되었습니다</strong> 
						</div>
					</c:when>
					<c:when test="${param.result eq 'pwdNotMatch' }">
						<div class="alert alert-danger" role="alert">
							<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
							<strong>비밀번호가 일치하지 않습니다</strong> 
						</div>
					</c:when>
				</c:choose>
				<div class="row">
					<form id="" class="well" method="post" action=""
						enctype="multipart/form-data" style="width: 700px;">
						<div style="margin-bottom: 40px; text-align: center;">
							<img src="/resources/images/student/${myPageInfo.imageName }"
								alt="studentImg" id="form-stu-photo-img"
								style="width: 150px; height: 150px;">
						</div>
						
						<div class="form-group form-inline">
							<label style="padding-right: 51px;">이름</label> <input type="text"
								class="form-control" readonly="readonly" value="${myPageInfo.name }"
								style="padding-right: 11px; margin-right: 44px;"> <label
								style="padding-right: 50px;">학번</label> <input type="text"
								class="form-control" readonly="readonly" value="${myPageInfo.id }">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 22px;">생년월일</label> <input
								type="text" class="form-control" readonly="readonly" value="${myPageInfo.birthDay }"
								style="margin-right: 40px;"> <label
								style="padding-right: 40px;">학과명</label> <input type="text"
								class="form-control" readonly="readonly" value="${myPageInfo.deptName }">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 51px;">학년</label> <input type="text"
								class="form-control" readonly="readonly" value="${myPageInfo.grade }"
								style="margin-right: 40px;"> <label
								style="padding-right: 51px;">주소</label> <input type="text"
								class="form-control" readonly="readonly" value="${myPageInfo.address }">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 37px;">이메일</label> <input
								type="text" class="form-control" readonly="readonly" value="${myPageInfo.email }"
								style="margin-right: 40px;"> <label
								style="padding-right: 38px;">연락처</label> <input type="text"
								class="form-control" readonly="readonly" value="${myPageInfo.phone }">
						</div>
						<div class="form-group form-inline">
							<label style="padding-right: 35px;">은행명</label> <input
								type="text" class="form-control" readonly="readonly" value="${myPageInfo.bankName }"
								style="padding-right: 14px; margin-right: 40px;"> <label
								style="padding-right: 22px;">계좌번호</label> <input type="text"
								class="form-control" readonly="readonly" value="${myPageInfo.accountNumber }">
						</div>
						<div class="form-group form-inline">
							<input id="" type="button" onclick="location.href='/student/navHeader/myPageModify.hta'"
								class="form-control" value="수정하기">
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