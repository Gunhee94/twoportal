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

	th {text-align: center;}
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
						<h2>등록금 결제 내역</h2>
					</div>
					<div class="col-sm-4">
						<c:choose>
							<c:when test="${param.result eq 'duplicate' }">
								<div class="alert alert-danger" role="alert">
									<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
									<strong>이번 학기 등록금을 이미 결제하셨습니다</strong> 
								</div>
							</c:when>
							<c:when test="${param.result eq 'fake' }">
								<div class="alert alert-danger" role="alert">
									<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
									<strong>파라미터 값이 변조되었습니다</strong> 
								</div>
							</c:when>
							<c:when test="${param.result eq 'success' }">
								<div class="alert alert-success" role="alert">
									<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
									<strong>등록금 결제가 완료되었습니다.</strong> 
								</div>
							</c:when>
						</c:choose>
					</div> 
					<div class="col-sm-12">
						<form id="tution-histories-form" class="form-inline">
							<div class="form-group" id="year">
								<label>연도</label> 
								<select name="year"class="form-control" id="tution-year" @change="getPayHisList()">
									<option value="전체">전체</option>
									<option value="2020">2020</option>
									<option value="2019">2019</option>
									<option value="2018">2018</option>
								</select>
							</div>
							<div class="form-group">
								<label>분기</label>
								<select name="quarter"class="form-control" id="tution-quarter" @change="getPayHisList()">
									<option value="전체">전체</option>
									<option value="전반기">전반기</option>
									<option value="후반기">후반기</option>
								</select>
							</div>
						</form>
					</div>
				</div>


				<div class="row" style="margin-top: 30px;">
					<div class="col-sm-12">
						<table class="table table-bordered" id="tuition-histories-table" style="text-align: center">
								<colgroup>
									<col width="16%"/>
									<col width="16%"/>
									<col width="16%"/>
									<col width="16%"/>
									<col width="16%"/>									
									<col width="16%"/>									
								</colgroup>
							<thead>
								<tr>
									<th>연도</th>
									<th>학과명</th>
									<th>분기</th>
									<th>등록금 금액</th>
									<th>결제 방식</th>
									<th>결제 날짜</th>
								</tr>
							</thead>
							<tbody id="tution-tbody">
								<tr v-for="List in jsonLists">
									<td>{{List.year}}년</td>
									<td>{{List.deptName}}</td>
									<td>{{List.quarter}}</td>
									<td>{{List.price}}원</td>
									<td>{{List.payWay}}</td>
									<td>{{List.dateToDate}}</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>

	</div>
</body>

<script type="text/javascript">	
	
	$(document).ready(function() {
		list.getPayHisList();
	})
	
	var list = new Vue({
		el: '.container-fluid',
		data: {
			jsonLists: []
		},
		methods:{
			getPayHisList: function() {
				var formInfos = $("#tution-histories-form").serialize();
				$.ajax({
					url:"/getJsonTuitionPayHistories.hta",
					type: "GET",
					dataType: "json",
					data: formInfos
					
				}).done(function(json){
					list.jsonLists = json
					console.log(list.jsonLists)
				}) 
			}
		}
	})
	
	
</script>
</html>