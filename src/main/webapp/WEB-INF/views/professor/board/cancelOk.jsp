<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>휴강신청조회/허용</title>
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
				<h4>휴강신청조회/허용</h4>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
					<table class="table">
						<colgroup>
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="28%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th>신청일자</th>
								<th>교수명</th>
								<th>과목명</th>
								<th>사유</th>
								<th>시작일자</th>
								<th>종료일자</th>
								<th></th>
							</tr>
						</thead>	
						<tbody>
							<tr v-if="cancels.length == 0">
								<td colspan="6" class="text-center">조회된 휴강이 없습니다.</td>
							</tr>
							<tr v-for="cancel in cancels">  
								<td>{{cancel.mycancellReqDate}}</td>
								<td>{{cancel.proName}}</td>
								<td>{{cancel.subName}}</td>
								<td>{{cancel.cancellReason}}</td>
								<td>{{cancel.mycalcellStartDate}}</td>
								<td>{{cancel.mycalcellEndDate}}</td>
								<td v-if="cancel.cancellRespDate == null">
									<button type="button" class="btn btn-primary" @click="updatecancel(cancel.cacellNo)" >수락</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
		
		</div>       
	</div>	  
</div>
<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			cancels:[],
		},
		beforeCreate:function() {
			$.getJSON('/professor/board/cancelOklist.hta', function(result) { 
				app.cancels = result.cancels;
			});
			
		},
		methods: {
			updatecancel : function(cancelNo) {
				console.log(cancelNo);
				$.getJSON('/professor/board/updatecancel.hta', {cancelNo:cancelNo}, function(result) {
					window.location.reload();
					alert("휴강 허용이 성공적으로 완료되었습니다.");
				});
			},
		}
	});          

	  
	
</script>
</body> 
</html>