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
				<div class="col-sm-9">
					<div class="page-header">
						<h2>학적 정보</h2>
					</div>
					<div class="btn-group btn-group-lg" role="group">
						<button type="button" class="btn btn-default">기본사항</button>
						<button type="button" class="btn btn-default">학적변동</button>
						<button type="button" class="btn btn-default">장학사항</button>
						<button type="button" class="btn btn-default">등록사항</button>
						<button type="button" class="btn btn-default">지도교수</button>
					</div>
					
					<hr>
					
					<!-- 기본사항 -->
					<div class="row">
						<div class="col-sm-2">
							<p>이미지</p>
						</div>
						<div class="col-sm-10">
							<table class="table table-striped table-bordered">
								<colgroup>
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="40%">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td colspan="3"></td>
									</tr>
									<tr>
										<th>학번</th>
										<td>test</td>
										<th>전공명</th>
										<td>test</td>
									</tr>
									<tr>
										<th>상태</th>
										<td>test</td>
										<th>학년</th>
										<td>test</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td>test</td>
										<th>이메일</th>
										<td>test</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3"></td>
									</tr>
									<tr>
										<th>은행명</th>
										<td>test</td>
										<th>계좌번호</th>
										<td>test</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-body text-center">
							<p><strong>학적정보 변경은 학적수정 메뉴에서 가능합니다.</strong></p>
						</div>
					</div>
					
					<!-- 학적변동 -->
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered text-center">
								<colgroup>
									<col width="5%">
									<col width="25%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">순번</th>
										<th class="text-center">학적 변동사항</th>
										<th class="text-center">일반휴학 학기수</th>
										<th class="text-center">변동시작일</th>
										<th class="text-center">변동종료일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="5" class="text-center">학적 변동사항 내역이 없습니다.</td>
									</tr>
									<tr>
										<td>1</td>
										<td>일반휴학</td>
										<td>2</td>
										<td>2020-01-01</td>
										<td>2020-01-02</td>
									</tr>
									<tr>
										<td>1</td>
										<td>일반휴학</td>
										<td>2</td>
										<td>2020-01-01</td>
										<td>2020-01-02</td>
									</tr>
									<tr>
										<td>1</td>
										<td>일반휴학</td>
										<td>2</td>
										<td>2020-01-01</td>
										<td>2020-01-02</td>
									</tr>
								</tbody>
							</table>							
						</div>
					</div>
					
					<!-- 성적사항 -->
					<div class="row">
						<div class="col-sm-12">
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
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">공지사항</h3>
						</div>
						<div class="panel-body">
							<p>자세한 장학 관련 문의는 <strong>학생장학팀</strong>으로 문의하세요.</p>
							<p><strong>학생장학팀 (장학부서) : 02-760-4221</strong></p>
						</div>
					</div>	
					
					<!-- 장학사항 -->
					<div class="row">
						<div class="col-sm-6">
							<table class="table table-bordered text-center">
								<thead>
									<tr class="info">
										<th class="text-center">학년도</th>
										<th class="text-center">학기</th>
										<th class="text-center">등록학년</th>
										<th class="text-center">상세보기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4"><strong>등록 내역이 없습니다.</strong></td>
									</tr>
									<tr>
										<td>2019</td>
										<td>1</td>
										<td>1</td>
										<td>
											<button type="button" class="btn btn-default btn-xs">상세보기</button>
										</td>
									</tr>
									<tr>
										<td>2019</td>
										<td>2</td>
										<td>1</td>
										<td>
											<button type="button" class="btn btn-default btn-xs">상세보기</button>
										</td>
									</tr>
									<tr>
										<td>2020</td>
										<td>1</td>
										<td>1</td>
										<td>
											<button type="button" class="btn btn-default btn-xs">상세보기</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-sm-6">
							<div class="panel panel-primary">
								<div class="panel-heading">등록금 납부 세부내역</div>
								<div class="panel-body">
									<p><strong>학번 : </strong>029301</p>
									<p><strong>2020학년도 1학기</strong></p>
								</div>
								<table class="table text-center table-bordered">
									<tbody>
										<tr>
											<td><strong>학과</strong></td>
											<td>생명공학과</td>
											<td><strong>등록금액</strong></td>
											<td>4,300,000</td>
										</tr>
										<tr>
											<td><strong>납부일자</strong></td>
											<td>2020-02-25</td>
											<td><strong>납부방법</strong></td>
											<td>지로</td>
										</tr>
									</tbody>
								</table>
							</div>			
						</div>
					</div>
					
					<!-- 등록사항 -->
					<div class="row">
						<div class="col-sm-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">공지사항</h3>
								</div>
								<div class="panel-body">
									<p>자세한 등록 관련 문의는 <strong>학사지원팀</strong>으로 문의하세요.</p>
									<p><strong>학사지원팀 (등록부서) : 02-760-4219</strong></p>
								</div>
							</div>	
							<table class="table table-bordered text-center">
								<thead>
									<tr>
										<th class="text-center">순번</th>
										<th class="text-center">학년도</th>
										<th class="text-center">학기</th>
										<th class="text-center">장학명</th>
										<th class="text-center">장학금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="5"><strong>장학 내역이 없습니다.</strong></td>
									</tr>
									<tr>
										<td>1</td>
										<td>2019</td>
										<td>1</td>
										<td>성적우수장학</td>
										<td>1,000,000</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 지도교수 -->
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>