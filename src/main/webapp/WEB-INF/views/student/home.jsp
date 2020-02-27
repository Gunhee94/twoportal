<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style type="text/css">
	#timetable {
		table-layout: fixed;
		width: 1000px;
		height: 400px;
	}
</style>
</head>
<body>
<%@include file="../common/navheader.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2">
			<%@include file="../common/navleft.jsp"%>
		</div>
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">성적 분포</h3>
						</div>
						<div class="panel-body">
							<div class="panel panel-default">
								<div class="panel-body text-center">
									바로 전 학기 성적이 출력됩니다.
								</div>
							</div>
							<div style="width:300px; height:350px ;margin:0 auto;">
								<canvas id="myChart" class="chartjs" style="display: block; width: 100%; height: 100%;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">나의 시간표</h3>
						</div>
						<div class="panel-body">
							<table class="table table-bordered" id="timetable" style="text-align: center;">
								<colgroup>
									<col width="10%">
									<col width="18%">
									<col width="18%">
									<col width="18%">
									<col width="18%">
									<col width="18%">
								</colgroup>
								<tr> 
									<th class="text-center col-sm-">구분</th>
									<th class="text-center">월</th>
									<th class="text-center">화</th>
									<th class="text-center">수</th>
									<th class="text-center">목</th>
									<th class="text-center">금</th>
								</tr>
								<tr>
									<td>1</td>
									<td style="background-color: lightsalmon;">경영학개론</td>
									<td></td>
									<td></td>
									<td></td>
									<td style="background-color: lightgrey;">유전공학이론</td>
								</tr>
								<tr>
									<td>2</td>
									<td style="background-color: lightsalmon;">경영학개론</td>
									<td></td>
									<td></td>
									<td></td>
									<td style="background-color: lightgrey;">유전공학이론</td>
								</tr>
								<tr>
									<td>3</td>
									<td style="background-color: lightsalmon;">경영학개론</td>
									<td></td>
									<td></td>
									<td style="background-color: thistle;">일반화학</td>
									<td></td>
								</tr>
								<tr>
									<td>4</td>
									<td></td>
									<td style="background-color: darkseagreen">과학글쓰기의이해</td>
									<td></td>
									<td style="background-color: thistle;">일반화학</td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td style="background-color: tan;">노사관계론</td>
									<td style="background-color: thistle;">일반화학</td>
									<td></td>
								</tr>
								<tr>
									<td>6</td>
									<td></td>
									<td></td>
									<td style="background-color: lightpink;">마케팅</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>7</td>
									<td style="background-color: darkseagreen">과학글쓰기의이해</td>
									<td></td>
									<td style="background-color: lightpink;">마케팅</td>
									<td style="background-color: lavender;">조직경영론</td>
									<td></td>
								</tr>
								<tr>
									<td>8</td>
									<td style="background-color: darkseagreen">과학글쓰기의이해</td>
									<td></td>
									<td></td>
									<td style="background-color: lavender;">조직경영론</td>
									<td></td>
								</tr>
								<tr>
									<td>9</td>
									<td style="background-color: darkseagreen">과학글쓰기의이해</td>
									<td></td>
									<td></td>
									<td style="background-color: lavender;">조직경영론</td>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">공지사항</h3>
						</div>
						<div class="panel-body">
							<p>- 장학 관련 문의는 <strong>학생장학팀</strong>으로 문의하세요.</p>
							<p><strong>학생장학팀 (장학부서) : 02-760-4221</strong></p>
							<p>- 학사 관련 문의는 <strong>학사관리팀</strong>으로 문의하세요.</p>
							<p><strong>학사관리팀 (행정부서) : 02-760-5229</strong></p>
							<p>- 시험(중간고사/기말고사) 관련 문의는 <strong>교육팀</strong>으로 문의하세요.</p>
							<p><strong>교육팀 (행정부서) : 02-831-9449</strong></p>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: data = {
			    datasets: [{
			        data: [10, 20, 30, 40],
			        backgroundColor: ["lightsalmon", "lavender", "dartseagreen", "lightcyan"]
			    }],
			    labels: [
			        'A(A+)',
			        'B(B+)',
			        'C(C+)',
			        'D(D+)'
			    ]
			}
	})
</script>
</html>