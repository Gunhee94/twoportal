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
						<h2>시간표 및 수업계획조회 화면</h2>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title text-center">
								<strong>조회 전 알림사항</strong>
							</h3>
						</div>
						<div class="panel-body">
							<p> 1. 수강신청기간 동안 교수명 클릭시, 강의평가 결과가 조회됩니다.</p>
							<p> 2. 과목코드에 마우스를 올리면 과목 해설이 표시됩니다.</p>
							<p> 3. The English title will be shown when you place your mouse pointer on Korean subject name.</p>
						</div>
					</div>
					<hr>
					<form class="form-inline" action="">
						<div class="form-group">
							<label>학년도 학기</label>
							<select name="semester" class="form-control">
								<option value="0" selected> -- 전체 -- </option>
								<option value="1">2020년 1학기</option>
								<option value="2">2019년 2학기</option>
								<option value="3">2019년 1학기</option>
								<option value="4">2018년 2학기</option>
								<option value="5">2018년 1학기</option>
								<option value="6">2017년 2학기</option>
								<option value="7">2017년 1학기</option>
							</select>
						</div>
						<div class="form-group">
							<label>전공선택</label>
							<select class="form-control">
								<option> -- 전체 -- </option>
								<option>경영학과</option>
								<option>생명공학과</option>
								<option>시각디자인학과</option>
								<option>컴퓨터공학과</option>
								<option>전자물리학과</option>
								<option>조소과</option>
							</select>
						</div>
					</form>
					<hr>
					<div class="panel panel-info">
						<div class="panel-heading"><strong>시간표 및 수업계획서</strong></div>
						<div class="panel-body">
							<p>학기 : <strong>2020년 1학기</strong></p>
							<p>학과 : <strong>경영학과</strong></p>
							<p></p>
						</div>
						<table class="table table-bordered">
						<colgroup>
							<col width="2%">
							<col width="8%">
							<col width="5%">
							<col width="8%">
							<col width="5%">
							<col width="*%">
							<col width="15%">
							<col width="8%">
							<col width="12%">
						</colgroup> 
						<thead>
							<tr>
								<th class="text-center">No</th>
								<th class="text-center">과목번호</th>
								<th class="text-center">학과번호</th>
								<th class="text-center">이수구분</th>
								<th class="text-center">학점</th>
								<th class="text-center">강의명</th>
								<th class="text-center">강의시간/강의실</th>
								<th class="text-center">담당교수</th>
								<th class="text-center">비고</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center">1</td>
								<td class="text-center">[A040]</td>
								<td class="text-center"><a href="">P010001</a></td>
								<td class="text-center">전공</td>
								<td class="text-center">3</td>
								<td class="text-center"><a href="">생명공학의 미래</a></td>
								<td class="text-center">탐구관506 수 4~6</td>
								<td class="text-center"><a href="">박지윤</a></td>
								<td class="text-center">
									<button type="button" class="btn btn-warning btn-xs text-center">수업계획서</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">2</td>
								<td class="text-center">[A040]</td>
								<td class="text-center"><a href="">P010731</a></td>
								<td class="text-center">교양</td>
								<td class="text-center">2</td>
								<td class="text-center"><a href="">영국문학과 문화1</a></td>
								<td class="text-center">상상관 307 금 1~2</td>
								<td class="text-center"><a href="">황정현</a></td>
								<td class="text-center">
									<button type="button" class="btn btn-warning btn-xs text-center">수업계획서</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">3</td>
								<td class="text-center">[D132]</td>
								<td class="text-center"><a href="">P052401</td>
								<td class="text-center">교양</td>
								<td class="text-center">2</td>
								<td class="text-center"><a href="">경제수학</a></td>
								<td class="text-center">상상관707 화 8~9</td>
								<td class="text-center"><a href="">이천우</td>
								<td class="text-center">
									<button type="button" class="btn btn-warning btn-xs text-center">수업계획서</button>
								</td>
							</tr>
							<tr>
								<td class="text-center">4</td>
								<td class="text-center">[D132]</td>
								<td class="text-center"><a href="">J101001</a></td>
								<td class="text-center">전공</td>
								<td class="text-center">3</td>
								<td class="text-center"><a href="">경제원론2(거시경제기초)</a></td>
								<td class="text-center">탐구관307 목 4~6</td>
								<td class="text-center"><a href="">김정렬</a></td>
								<td class="text-center">
									<button type="button" class="btn btn-warning btn-xs text-center">수업계획서</button>
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
</body>
</html>