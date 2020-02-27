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
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
						<h1>등록금 결제 </h1>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<c:choose>
							<c:when test="${param.fail eq 'fake' }">
								<strong>결제정보가 위조되었습니다 올바르게 요청해주세요.&nbsp&nbsp </strong> 
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</c:when>
						</c:choose>
						<form id="tution-form"class="well" method="post" action="/staff/tutionAdd.hta" style=" width: 550px;" >
							<input type="hidden" value="${tuitionPayFormInfos.deptNo }" id="dept-no">
							<input type="hidden" value="${tuitionPayFormInfos.tuitionNo }" id="tuition-no">
							<div class="form-group form-inline">
								<label style="padding-right: 51px;">학과</label>
								<input type="text" class="form-control" readonly="readonly" value="${tuitionPayFormInfos.deptName }">
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 20px;">납부 기간</label>
								<input type="date" class="form-control" name="startdate" readonly="readonly" value="${tuitionPayFormInfos.startdatemodify }">
								<label>~</label>
								<input type="date" class="form-control" name="enddate" readonly="readonly" value="${tuitionPayFormInfos.enddatemodify }">
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 51px;">분기</label>
								<input type="text" class="form-control" id="form-quarter"	readonly="readonly" value="${tuitionPayFormInfos.quarter }">
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 20px;">납부 금액</label>
								<input type="text" class="form-control" id="form-pay-price" name="payprice" readonly="readonly" value="${tuitionPayFormInfos.payprice }">
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 20px;">결제수단</label>
								<input type="radio" class="form-control" checked="checked" >휴대폰 소액결제
							</div>
							<div class="form-group form-inline">
								<input id="tutuion-button"type="button" onclick="payTuition()" class="form-control" value="결제">
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
	
function payTuition() {
	
	var IMP = window.IMP;
	IMP.init("imp26366464");
	
	IMP.request_pay({
		pg: "danal",
		pay_method: "phone",
		merchant_uid : "",
		name: $("#tuition-no").val(), // tuitionNo
		amount: $("#form-pay-price").val()
	}, function (rsp) {
		if (rsp.success) {
			console.log(rsp)
			location.href="/tutionPayFakeCheck.hta?payMethod="+rsp.pay_method+"&tuitionNo="+rsp.name+"&payPrice="+rsp.paid_amount;
		} else {
			alert("결제 실패")
		}
	}); 
}
</script>
</html>