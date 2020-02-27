<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>급여내역</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
	<style>

	</style>   
</head>     
<body>  
<div class="container-fluid" id="app"> 
	<%@include file="../../common/navheader.jsp" %>  
	<div class="row" >
		<div class="col-sm-2">
			<%@include file="../../common/navleft.jsp" %>
		</div>
		<div class="col-sm-10" >
			<div class="page-header" style="margin-top: 0px;">
				<h4>급여 내역 </h4>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
					<form class="form-inline" action="">
						<div class="form-group">
							<label>년도</label>  
							<input type="text" class="form-control" name="year" placeholder="년도를 입력하세요." id="salary-year" maxlength="4" >
						</div>     
						<button type="button" class="btn btn-default" @click="btnGetyear">조회</button>
					</form>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-6">
					<table class="table">
						<thead>
							<tr>
								<th>월</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody>
							<tr v-if="salarylist.length == 0">
								<td colspan="2" class="text-center">조회된 급여가 없습니다.</td>
							</tr>
							<tr v-for="salary in salarylist">
								<td>{{salary.month}} 월</td>
								<td>{{salary.salarycommma}} 원</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm-6">
					<div class="panel panel-info">
						<div class="panel-heading"><strong id="salary-name"></strong>님 2020년 월별급여</div>
						<div class="panel-body">
							<canvas id="canvas" ></canvas>
						</div>
					</div>
				</div>
			</div>  
			
		</div>       
	</div>	  
</div>
<script type="text/javascript" src="/resources/js/chart.js"></script>
<script type="text/javascript" src="/resources/js/utils.js"></script>
<script type="text/javascript">

	var app = new Vue({
		el:"#app",
		data: {
			salarylist: []
		},
		methods: {
			btnGetyear : function() {
				var year = $("#salary-year").val();
				
				if (!year) {
					alert("년도를 입력하세요.");
					$("#salary-year").focus();
					return;
				}
				
				$.getJSON('/professor/board/salarycri.hta',{year:year}, function(result) { 
					app.salarylist = result.salaries;
				});
			},
			
		}
	}); 

	window.onload = function() {
		
		$.getJSON('/professor/board/salarylist.hta', function(result) {
			
			var salaries = result.salary;   
			$("#salary-name").text(result.proName);
			
			var labels = ['2019년평균', '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
			var barChartData = {
				labels: labels.slice(0, salaries.length),
				datasets: [{
					label: '(단위: 원)',
					backgroundColor: 'lightblue',
					borderWidth: 1,
					data: salaries
				}]
			};
			
			var ctx = document.getElementById('canvas').getContext('2d');
			new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
								userCallback:function(value, index, values) {
									value = value.toString();
									value = value.split(/(?=(?:...)*$)/);
									value = value.join(',');
									return value;
								},
							}
						}]
					}
				}
			});
		});
	}
	$("#salary-year").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	
	
</script>
</body> 
</html>