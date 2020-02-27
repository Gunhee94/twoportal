<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>학생성적조회</title>
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
				<h4>학생 성적 조회<button type="button" class="btn btn-warning pull-right" data-toggle="modal" data-target="#gradecheckModal">성적산출확인 <strong>({{lectures.length}})</strong></button></h4>
			</div>
			
			<div class="row">        
				<div class="col-sm-12">
					<form class="form-inline">
						<div class="form-group">
							<label>개설년도</label>  
							<input type="text" class="form-control" placeholder="년도를 입력하세요." v-model="param.year" maxlength="4" id="lecture-year">
						</div>  
						<div class="form-group">
							<label>학기</label>    
							<select class="form-control" v-model="param.semester">
								<option value="0" selected> -- 전체 --</option>  
								<option value="1" > 1 학기</option>
								<option value="2" > 2 학기</option>
							</select>   
						</div>    
						<div class="form-group">
							<label>학과</label>    
							<select class="form-control" v-model="param.dept" id="dept-grade"  @change="selectLectures()">
								<option value="0" selected> -- 전체 --</option>  
								<option v-for="dept in departments" v-bind:value="dept.no" > {{dept.name}}</option>
							</select>   
						</div>       
						<div class="form-group">
							<label>과목</label>    
							<select class="form-control" v-model="param.subject">
								<option value="0" selected> -- 전체 --</option>  
								<option v-if="subjects.length == 0" > 학과를 먼저 선택해주세요.</option>
								<option v-for="sub in subjects" v-bind:value="sub.no" > {{sub.name}}</option>
							</select>   
						</div>    
						<button type="button" class="btn btn-default" @click="lectureChecks()">검색</button>
						<button type="button" class="btn btn-success glyphicon glyphicon-folder-open pull-right" @click="excel()"> EXCEL</button>
					</form>
					<div style="margin-top: 10px;">  
						<span class="pull-right">학생 인원수 : <strong> [ {{count}} ]</strong> 명 </span>    
					</div>
				</div>             
			</div>     
			
			<div class="row">
				<div class="col-sm-12">
					<table class="table">
						<thead>
							<tr>
								<th>개설년도</th>
								<th>학기</th>
								<th>학과</th>  
								<th>학년</th>
								<th>과목</th>
								<th>학번</th>
								<th>이름</th>
								<th>점수<button class="lghbtn glyphicon glyphicon-triangle-bottom"  @click="btnorderby()" id="lgh-btn"></button></th>  
								<th>석차</th>
								<th>등급</th>  
							</tr>
						</thead>   
						<tbody>
							<tr v-if="gradeLectures.length == 0">
								<td colspan="10" class="text-center"> 검색 후 조회 바랍니다.</td>
							</tr>
							<tr v-for="grade in gradeLectures">
								<td>{{grade.year}}</td>
								<td>{{grade.lectSemester}}</td>
								<td>{{grade.deptName}}</td>
								<td>{{grade.stuGrade}}</td>
								<td>{{grade.subName}}</td>
								<td>{{grade.stuId}}</td>
								<td>{{grade.stuName}}</td>
								<td>{{grade.gradeScore}}</td>
								<td>{{grade.gradeRank}}</td>
								<td>{{grade.gradeRating}}</td>
							</tr>         
						</tbody>     
					</table>
				</div>
			</div>
			<div class="row text-center">
				<ul class='btn-group pagination' id="pageBtn">
					<li v-if="pageInfo.prev">
	    				<a id="prevPage">
	    				<i class='fa fa-chevron-left glyphicon glyphicon-chevron-left'></i></a>
					</li>
					<li v-for="number in pageInfo.endPage" id="pageNumberOn">
						<a @click="pageChange(number)" id="pageNumber" >{{number}}</a>
					</li>		
					<li v-if="pageInfo.next && pageInfo.endPage > 0">
						<a id="nextPage">
						<i class='fa fa-chevron-left glyphicon glyphicon-chevron-right'></i></a>
					</li>
				</ul>	  
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table class="table table-bordered table-condensed text-center">
						<thead>
							<tr>
								<th colspan="10" class="text-center info">[등급 및 평점표]</th>
							</tr>   
						</thead>
						<tbody>  
							<tr>
								<th class="text-center active">등급</th>
								<td>A+</td>
								<td>A0</td>
								<td>B+</td>
								<td>B0</td>
								<td>C+</td>
								<td>C0</td>
								<td>D+</td>
								<td>D0</td>
								<td>F</td>
							</tr>
							<tr>
								<th class="text-center active">평점</th>
								<td>4.5</td>
								<td>4.0</td>
								<td>3.5</td>
								<td>3.0</td>
								<td>2.5</td>
								<td>2.0</td>
								<td>1.5</td>
								<td>1.0</td>
								<td>0.0</td>
							</tr>
							<tr>
								<th class="text-center active">실점</th>
								<td>100 ~ 95</td>
								<td>94 ~ 90</td>
								<td>89 ~ 85</td>
								<td>84 ~ 80</td>
								<td>79 ~ 75</td>
								<td>74 ~ 70</td>
								<td>69 ~ 65</td>
								<td>64 ~ 60</td>
								<td>59 이하</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 성적 산출확인을 눌렀을 때  -->
			<div id="gradecheckModal" class="modal fade" role="dialog">
  				<div class="modal-dialog">
    				<div class="modal-content">
      					<div class="modal-header">
        					<button type="button" class="close" data-dismiss="modal">&times;</button>
        					<h4 class="modal-title">성적 산출 안된 강의</h4>
      					</div>
      					<div class="modal-body">   
       	 					<table class="table">
       	 						<thead>
       	 							<tr>
       	 								<th>개설년도</th>
       	 								<th>학기</th>
       	 								<th>과목명</th>
       	 								<th></th>
       	 							</tr>
       	 						</thead>
       	 						<tbody>
       	 							<tr v-if="lectures.length == 0">
       	 								<td colspan="4" class="text-center">성적 산출이 모두 완료되어 있습니다.</td>
       	 							</tr>
       	 							<tr v-for="lecture in lectures">
       	 								<td>{{lecture.year}}</td>
       	 								<td>{{lecture.lectSemester}}</td>
       	 								<td>{{lecture.subName}}</td>
       	 								<td><button type="button" class="btn btn-warning btn-sm" @click="insertgrade(lecture.lectNo)">성적산출하기</button></td>       	 								
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
<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			lectures: [],
			messages: [],
			year:'',
			semester:'0',
			dept:'0',
			subject:'0',
			departments:[],
			subjects:[],
			pageInfo:{},
			gradeLectures:[],
			param:{
				subject:"0",
				semester: 0,
				dept: 0,
				subject: 0,
				order:true
			},
			page:'',
			count:'0'
		},
		created: function() {
			var data = this.param;
			$.getJSON('/professor/grade/listcri.hta', data, function(result) { 
				app.lectures = result.isLectures;
				app.departments = result.departments;
			});
		},
		methods: {
			pageChange: function(number) {
				console.log(number);	
				app.lectureChecks(number);
			},
			
			// select 박스 학과를 변경했을 때 
			selectLectures : function() {
				
				var that = this;
				var dept = $("#dept-grade option:selected").val();
				
				$.getJSON('/professor/grade/listcri.hta', {dept: dept},function(result) {
					app.subjects = result.subjects;	
					that.param.subject = 0;
				});
			},  
			// 성적 산출하기 버튼 눌렀을 때 
			insertgrade : function(lectNo) {
				
				$.getJSON('/professor/grade/insertgrade.hta',{lectNo: lectNo}, function(result) {
					app.messages = result.message;
					alert(app.messages);
					window.location.reload();
				});
			},
			// 조건별 검색 버튼 눌렀을 때 
			lectureChecks : function(number) {
				
				if (!this.param.year) {
					alert("개설년도를 입력하세요.");
					$("#lecture-year").focus();
					return;
				}
				
				if(number == ''){
					number = 1;
				}
			
				var data = this.param;
				data.page = number;
				
				$.getJSON('/professor/grade/listcri.hta', data, function(result) {
					app.gradeLectures = result.gradeLectures;
					app.pageInfo = result.pageInfo;
					app.count = result.count;
				});
			},
			// 점수 오름차순 내림차순 했을 때 
			btnorderby : function() {
				if (app.gradeLectures.length == 0) {
					alert("검색 후 정렬 바랍니다.");
					return;
				}
				
				var data = this.param;
				data.order = this.isDescending();
				
				$.getJSON('/professor/grade/listcri.hta', data, function(result) {
					app.gradeLectures = result.gradeLectures;
				});
			},
			// 엑셀 다운 했을 때 
			excel : function() {
				if (app.gradeLectures.length == 0) {
					alert("검색 후 엑셀다운 바랍니다.");
					return;
				}
				
				var data = this.param;
				data.order = this.isDescending()
				
				location.href="/professor/grade/excel.hta?" + $.param(data);

			},
			// false, true 점수 오름, 내림차순으로 
			isDescending: function() {
				return this.param.order = !this.param.order;
			}
		}
	});       
	
	
	$("#lecture-year").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
/*
	$(".lghbtn").on('click', function() {
		if ($(this).hasClass("glyphicon-triangle-top")) {
			$(this).removeClass("glyphicon-triangle-top");
			$(this).addClass("glyphicon-triangle-bottom");
			return;
		} 
		if ($(this).hasClass("glyphicon-triangle-bottom")) {
			$(this).removeClass("glyphicon-triangle-bottom");
			$(this).addClass("glyphicon-triangle-top");		
			return;
		} 
	});
 */
	
	        
</script>
</body> 
</html>