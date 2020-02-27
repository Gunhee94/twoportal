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
				<div class="page-header" style="margin-top: 0px;">
					<h2>등록금 내역 및 수정</h2>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<form id="tution-histories-form" class="form-inline">
							<div class="form-group" id="year">
								<label>연도</label> 
								<select name="year"class="form-control" id="tution-year">
									<option value="2020">2020</option>
									<option value="2019">2019</option>
									<option value="2018">2018</option>
									<option value="2017">2017</option>
									<option value="2016">2016</option>
								</select>
							</div>
							<div class="form-group">
								<label>분기</label>
								<select name="quarter"class="form-control" id="tution-quarter">
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
									<col width="15%"/>									
								</colgroup>
							<thead>
								<tr>
									<th>학과명</th>
									<th>분기</th>
									<th>등록금 금액</th>
									<th>마감여부</th>
									<th>납부기간</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody id="tution-tbody">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

<script type="text/javascript">
	
	function getJson() {
		$.ajax({
			url: "/getJsontutionHistories.hta?year=" + $("#tution-year option:selected").val() + "&quarter=" + $("#tution-quarter option:selected").val(),
			type: "GET",
			dataType: "json"
		}).done(function(json) {
			console.log(json)
			resultHTML = '';
			$.each(json,function(index,item) {
				resultHTML += "<tr>"
				resultHTML += "<td>" +item.deptName + "</td>" 
				resultHTML += "<td>" +item.quarter + "</td>"
				resultHTML += "<td>" +item.price + "</td>"
				resultHTML += "<td>" +item.isClose + "</td>"
				resultHTML += "<td>" +item.dateToDate + "</td>"
				
				if(new Date().getFullYear() == item.year ){
					resultHTML += "<td> <button data-quarter='" +item.quarter +	"'data-deptNo='"+item.deptNo+"'"+"class='btn btn-info'>수정</button> </td>"
				} else {
					resultHTML += "<td>수정 불가</td>"
				}
				resultHTML += "</tr>"	
			})
			$("#tuition-histories-table tbody *").remove();
			$("#tuition-histories-table tbody").append(resultHTML);
		})
	}
	
	$(document).ready(function() {
		getJson();
	})
	
	$("#tution-histories-form *").on("change", function(event) {
		event.stopPropagation()
		getJson();
		
	})

	$("#tution-tbody").on("click","[data-deptNo]",function(event) {
		event.stopPropagation();
		location.href = "/staff/tuitionModify.hta?deptNo="+$(this).attr("data-deptNo")+"&quarter="+$(this).attr("data-quarter");
		
	})
</script>
</html>