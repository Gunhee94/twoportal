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
						<h2>성적 조회</h2>
					</div>
					 
					 
					 
					 
		 
					 
					 
					<table class="table table-bordered text-center">
						<tbody>
							<tr class="warning"> 
								<td><strong>이름</strong></td>
								<td>박지현</td>
								<td><strong>학번</strong></td>
								<td>116398</td>
								<td><strong>전공</strong></td>
								<td>생명유전공학</td>
								<td><strong>상태</strong></td>
								<td>재학</td>
							</tr>
						</tbody>
					</table>
					 
					<div class="row">
						<div class="col-sm-4">
							<button type="button" class="btn btn-default btn-block">전체보기</button>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-default btn-block">전공과목</button>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-default btn-block">교양과목</button>
						</div>
					</div>
					<hr>
					
					<!-- 성적사항 -->
					<div class="row">
						<div class="col-sm-6">
							<div class="panel panel-primary">
								<div class="panel-heading text-center">2020년 1학기</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">신청학점</div>
												<div class="panel-body">13</div>
											</div>
											</div>
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">취득학점</div>
												<div class="panel-body">13</div>
												</div>
											</div>
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">평점총계</div>
												<div class="panel-body">34.5</div>
											</div>
										</div>
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">평점총계</div>
												<div class="panel-body">2.65</div>
											</div>
										</div>
										<table class="table text-center">
											<thead>
												<tr class="danger">
													<th class="text-center">구분</th>
													<th class="text-center">교과명</th>
													<th class="text-center">교과코드</th>
													<th class="text-center">학점</th>
													<th class="text-center">성적</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>전공</td>
													<td>디지털 미디어의 이해와 실제</td>
													<td>CBNE008</td>
													<td>3</td>
													<td>C+</td>
												</tr>
												<tr>
													<td>전공</td>
													<td>디지털 미디어의 이해와 실제</td>
													<td>CBNE008</td>
													<td>3</td>
													<td>C+</td>
												</tr>
												<tr>
													<td>전공</td>
													<td>디지털 미디어의 이해와 실제</td>
													<td>CBNE008</td>
													<td>3</td>
													<td>C+</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="panel panel-primary">
								<div class="panel-heading text-center">2020년 1학기</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">신청학점</div>
												<div class="panel-body">13</div>
												</div>
											</div>
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">취득학점</div>
												<div class="panel-body">13</div>
												</div>
											</div>
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">평점총계</div>
												<div class="panel-body">34.5</div>
											</div>
										</div>
										<div class="col-sm-3">
											<div class="panel panel-info">
												<div class="panel-heading">평점총계</div>
												<div class="panel-body">2.65</div>
											</div>
										</div>
										<table class="table text-center">
											<thead>
												<tr class="danger">
													<th class="text-center">구분</th>
													<th class="text-center">교과명</th>
													<th class="text-center">교과코드</th>
													<th class="text-center">학점</th>
													<th class="text-center">성적</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>전공</td>
													<td>디지털 미디어의 이해와 실제</td>
													<td>CBNE008</td>
													<td>3</td>
													<td>C+</td>
												</tr>
												<tr>
													<td>전공</td>
													<td>디지털 미디어의 이해와 실제</td>
													<td>CBNE008</td>
													<td>3</td>
													<td>C+</td>
												</tr>
												<tr>
													<td>전공</td>
													<td>디지털 미디어의 이해와 실제</td>
													<td>CBNE008</td>
													<td>3</td>
													<td>C+</td>
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
		</div>
	</div>
</div> 
</body>
</html>