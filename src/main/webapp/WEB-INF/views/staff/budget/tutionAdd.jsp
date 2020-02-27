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
					<h2>등록금 추가</h2>
				</div>
					<c:choose>
						<c:when test="${param.result eq 'success' }">
							<div class="alert alert-success" role="alert">
								<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
								<strong>등록금 추가 성공</strong> 
							</div>
						</c:when>
						<c:when test="${param.fail eq 'duplicate' }">
							<div class="alert alert-danger" role="alert">
								<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
								<strong>이미 등록된 등록금이 존재합니다</strong> 
							</div>
						</c:when>
						<c:when test="${param.fail eq 'null' }">
							<div class="alert alert-danger" role="alert">
								<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
								<strong>빈 칸을 모두 채워주세요</strong> 
							</div>
						</c:when>
						</c:choose>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<form id="tution-form"class="well" method="post" action="/staff/tutionAdd.hta" style=" width: 550px;" >
							<div class="form-group form-inline">
								<label style="padding-right: 51px;">학과</label>
								<select class="form-control" name="deptNo">
									<c:forEach var="deptlist" items="${deptList }">
										<option value="${deptlist.no }">${deptlist.name }</option>				
									</c:forEach>
								
								</select>
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 20px;">
									납부 기한
								</label>
								<input type="date" class="form-control" name="startdate">
								<label>~</label>
								<input type="date" class="form-control" name="enddate">
							</div>
							<div class="form-group form-inline">
								<label style="padding-right: 20px;">
									납부 금액
								</label>
								<input type="text" class="form-control" name="payprice">
							</div>
							<div class="form-group form-inline">
								<label>전반기</label>
								<input type="radio" class="form-control" name="quarter" value="전반기" checked="checked">
								<label>후반기</label>
								<input type="radio" class="form-control" name="quarter" value="후반기">
							</div>
							<div class="form-group form-inline">
								<input id="tutuion-button"type="button" class="form-control" value="등록">
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
	$("#tutuion-button").on("click", function(){
		$("#tution-form").submit();
	})
</script>
</html>