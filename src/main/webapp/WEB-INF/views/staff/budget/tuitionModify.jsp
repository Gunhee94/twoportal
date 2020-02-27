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
					<h2>등록금 수정</h2>
				</div>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<form id="tution-form"class="well" method="get" action="/staff/tuitionModifyForm.hta" style=" width: 550px;" >
							<input type="hidden" value="${tuitionForm.tuitionNo }" name="tuitionNo">
							<input type="hidden" value="${tuitionForm.deptNo }" name="deptNo">
							<div class="form-group form-inline">
								<label style="padding-right: 51px;">학과</label>
								<input type="text" class="form-control"  value="${tuitionForm.deptName }" readonly="readonly">
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 20px;">
									납부 기한
								</label>
								<input type="date" class="form-control" name="startdate" value="${tuitionForm.startdatemodify}">
								<label>~</label>
								<input type="date" class="form-control" name="enddate" value="${tuitionForm.enddatemodify}">
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 20px;">
									납부 금액
								</label>
								<input type="text" class="form-control" name="payprice" value="${tuitionForm.payprice}">
							</div>
							<div class="form-group form-inline">
								<label>전반기</label>
								<input type="radio" class="form-control" name="quarter" value="전반기" ${tuitionForm.quarter eq '전반기' ? 'checked' : ''}>
								<label>후반기</label>
								<input type="radio" class="form-control" name="quarter" value="후반기" ${tuitionForm.quarter eq '후반기' ? 'checked' : ''}>
							</div>
							<div class="form-group form-inline  col-md-offset-7">
								<input id="tutuion-modify-button"type="button" class="btn btn-success" value="수정">
								<input id="tutuion-delete-button"type="button" class="btn btn-danger" value="삭제">
							</div>
						</form>
					</div>
					<div class="col-sm-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	
	$("#tutuion-modify-button").on("click", function() {
		$("#tution-form").submit()
	})
	$("#tutuion-delete-button").on("click", function() {
		location.href ="/staff/tuitionDelete.hta?tuitionNo="+${tuitionForm.tuitionNo };
	})
	
		
</script>
</html>