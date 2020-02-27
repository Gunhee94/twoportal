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
</head>
<body>
<%@include file="../../common/navheader.jsp" %>
<div class="container-fluid">
	<div class="row">
	<div class="col-sm-2">
		<%@include file="../../common/navleft.jsp" %>
	</div>
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-10">
					<div class="page-header">
						<h2>사이버 시험</h2>
					</div>
					<%-- <c:if test="${empty registerList}">
						<div class="panel panel-danger">
							<div class="panel-heading text-center">
								<strong>수강중인 강의가 없습니다.</strong>
							</div>
						</div>									
					</c:if> --%>
					<div class="row">
						<c:forEach var="lecture" items="${registerList}">
							<div class="col-sm-4">
								<button type="button" class="btn btn-default btn-block">${lecture.subName}</button>
							</div>
						</c:forEach>
					</div>
					<hr>
					<!-- <div class="panel panel-danger">
						<div class="panel-heading text-center">
							<strong>해당 과목의 시험기간이 아닙니다.</strong>
						</div>
					</div>  -->
					
					<div class="row">
						<div class="col-sm-6">
							<div class="panel panel-danger">
								<div class="panel-heading">
									<h3 class="panel-title">시험 주의사항</h3>
								</div>
								<div class="panel-body">
									<p><strong>반드시 TEST시험을 먼저 응시해야 합니다.</strong></p>
									<p>시험시간은 전과목 동일한 <strong>60분</strong>입니다.</p>
									<p><strong>응시여부가 Y로 바뀐 것을 꼭 확인 하세요.</strong></p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="panel panel-danger">
								<div class="panel-heading">
									<h3 class="panel-title">상세정보</h3>
								</div>
								<div class="panel-body">
									<p><strong>과목 : </strong>경영학개론</p>
									<p><strong>학기 : </strong>2020-1</p>
									<p><strong>시험기간 : </strong>2020-2-25 ~ 2020-2-28 <strong>[4일간]</strong></p>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12">	
							<table class="table table-bordered text-center">
								<thead>
									<tr>
										<th class="text-center">학기</th>
										<th class="text-center">과목명</th>
										<th class="text-center">응시여부</th>
										<th class="text-center">시험응시</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2020-1</td>
										<td>경영학개론</td>
										<td>
											<c:if test="${examStatus eq 'complete'}">
												Y
											</c:if>
											<c:if test="${examStatus eq 'failure'}">
												N
											</c:if>
											<c:if test="${empty examStatus}">
												N
											</c:if>
										</td>
										<td>
											<c:if test="${examStatus eq 'complete'}">
												<button type="button" id="examPopup" class="btn btn-xs btn-danger" disabled>시험응시</button>
											</c:if>
											<c:if test="${examStatus eq 'failure'}">
												<button type="button" id="examPopup" class="btn btn-xs btn-danger">시험응시</button>
											</c:if>
											<c:if test="${empty examStatus}">
												<button type="button" id="examPopup" class="btn btn-xs btn-danger">시험응시</button>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$("#examPopup").on('click', function() {
		var examUrl = "/student/exam/checkExamTerm.hta";
		var name = "examPopup";
		var options = "location=no, menubar=no, toolbar=no, width=2000, height=900, scrollbars=no";
		window.open(examUrl, name, options);
	});
</script>
</html>