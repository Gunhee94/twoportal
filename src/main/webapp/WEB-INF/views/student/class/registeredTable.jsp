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
						<h2>수강신청 내역</h2>
					</div>
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="2%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="*%">
							<col width="12%">
							<col width="5%">
							<col width="5%">
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
								<th class="text-center">인원</th>
								<th class="text-center">비고</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>[A040]</td>
								<td><a href="">P010001</a></td>
								<td>전공</td>
								<td>3</td>
								<td><a href="">생명공학의 미래</a></td>
								<td>탐구관506 수 4~6</td>
								<td><a href="">박지윤</a></td>
								<td>30/40</td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>[A040]</td>
								<td><a href="">P010731</a></td>
								<td>교양</td>
								<td>2</td>
								<td><a href="">영국문학과 문화1</a></td>
								<td>상상관 307 금 1~2</td>
								<td><a href="">황정현</a></td>
								<td>1/40</td>
								<td>재수강반</td>
							</tr>
							<tr>
								<td>3</td>
								<td>[D132]</td>
								<td><a href="">P052401</td>
								<td>교양</td>
								<td>2</td>
								<td><a href="">경제수학</a></td>
								<td>상상관707 화 8~9</td>
								<td><a href="">이천우</td>
								<td>7/40</td>
								<td></td>
							</tr>
							<tr>
								<td>4</td>
								<td>[D132]</td>
								<td><a href="">J101001</a></td>
								<td>전공</td>
								<td>3</td>
								<td><a href="">경제원론2(거시경제기초)</a></td>
								<td>탐구관307 목 4~6</td>
								<td><a href="">김정렬</a></td>
								<td>18/40</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered text-center">
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tbody>
							<tr>
								<td class="danger"><strong>신청교과목수</strong></td>
								<td><strong>4과목</strong></td>
								<td class="danger"><strong>신청학점</strong></td>
								<td><strong>10학점</strong></td>
							</tr>
						</tbody>
					</table>
					<div class="panel panel-danger">
						<div class="panel-heading text-center">
							<strong>현재 화면에서 수정하거나 변경할 수 없습니다.</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>