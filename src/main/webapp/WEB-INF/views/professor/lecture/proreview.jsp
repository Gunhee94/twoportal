<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>강의평가</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
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
				<h4>강의 평가</h4>
			</div>
			
			<div class="row">     
				<div class="col-sm-12">
					<form class="form-inline">
						<div class="form-group">
							<label>개설년도</label>  
							<input type="text" class="form-control" placeholder="년도를 입력하세요." v-model="year" maxlength="4" id="lecture-year">
						</div>  
						<div class="form-group">
							<label>학기 </label>    
							<select class="form-control" v-model="semester">
								<option value="0" selected> -- 전체 --</option>  
								<option value="1" > 1 학기</option>
								<option value="2" > 2 학기</option>
							</select>   
						</div>    
						<button type="button" class="btn btn-default" @click="lectureChecks(year, semester)">조회</button>
					</form>  
				</div>        
			</div>    
			
			<div class="row"> 
			    
				<div class="col-sm-12">
					<table class="table table-hover">
						<colgroup>
							<col width="12%">
							<col width="8%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>개설년도</th>
								<th>학기</th>
								<th>과목명</th>
								<th>전공/교양</th>
								<th>학점</th>
								<th>총정원</th>
								<th>강의평점</th>
								<th></th>
							</tr>  
						</thead>      
						<tbody>
							<tr v-for="lect in lectures">
								<td>{{lect.date}}</td>
								<td>{{lect.lectSemester}}</td>
								<td>{{lect.subName}}</td>
								<td>{{lect.subMajor}}</td>
								<td>{{lect.subCredit}}</td>
								<td>{{lect.lectTotalNumber}} / 20</td>
								<td v-if="lect.lectavg == 0"><strong>평가자 없음</strong></td>
								<td style='color: #eea236' v-else>{{lect.star}}</td>
								<td><button type="button" class="btn btn-info btn-sm" @click="reviewOKStudent(lect.lectNo)">평가한 학생 확인</button></td>
							</tr>
							<tr v-if="lectures.length == 0">
								<td colspan="8" class="text-center">조회된 강의가 없습니다.</td>   
							</tr>   
						</tbody>  
					</table>       
				</div> 
			
				<div id="lghModal" class="modal fade" role="dialog">
					<div class="modal-dialog modal-lg">  
				    	<div class="modal-content">
				      		<div class="modal-header">
				        		<button type="button" class="close" data-dismiss="modal">&times;</button>
				        		<h4 class="modal-title">평가여부 및 점수확인</h4>
				      		</div>
					      	<div class="modal-body">
					        	<table class="table">
					        		<thead>
					        			<tr>
					        				<th>학과명</th>
					        				<th>학년</th>
					        				<th>학번</th>
					        				<th>이름</th>  
					        				<th>핸드폰</th>
					        				<th>이메일</th>
					        				<th>평가여부</th>
					        				<th>평점</th>
					        			</tr>
					        		</thead>
					        		<tbody>
					        			<tr v-for="review in reviewOks">
					        				<td>{{review.stuDeptName }}</td>
					        				<td>{{review.stuGrade }}</td>
					        				<td>{{review.stuId }}</td>
					        				<td>{{review.stuName }}</td>
					        				<td>{{review.stuPhone }}</td>
					        				<td>{{review.stuEmail }}</td>
					        				<td v-if="review.iscompleted == null"><button type="button" class="btn btn-success btn-xs">평가완료</button></td>
					        				<td v-else><button type="button" class="btn btn-warning btn-xs">평가 미완료</button></td>
					        				<td v-if="review.stuTotal == 0"></td>
					        				<td v-else style='color: #eea236'>{{review.stuTotalStar}}</td>
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



<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			lectures:[],
			semester:'0',  
			year:'',
			reviewOks: []
		},
		methods: {
			lectureChecks: function(yearValue, semesterValue) {
				var param = {};
				if (yearValue) {
					param.year = yearValue;
				}
				if (semesterValue) {
					param.semester = semesterValue;
				}
				
				$.getJSON('/professor/lecture/reviewcheckcri.hta', param, function(result) {
					app.lectures = result;
				});
			},
			reviewOKStudent : function(lectNo) {
				
				$.getJSON('/professor/lecture/reviewOk.hta', {lectNo: lectNo}, function(result) { 
					app.reviewOks = result;
					
					$("#lghModal").modal('show');
				});
			}
		}
	});
	
	app.lectureChecks();
	
	$("#lecture-year").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
</script>
</body> 
</html>