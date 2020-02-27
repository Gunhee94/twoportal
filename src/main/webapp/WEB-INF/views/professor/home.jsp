<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>메인 홈</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
	<style type="text/css">
	</style>
	
</head>
<body>
<div class="container-fluid" id="app">  
	<%@include file="../common/navheader.jsp" %>
	<div class="row" >
		<div class="col-sm-2">
			<%@include file="../common/navleft.jsp" %>
		</div>
		<div class="col-sm-10" >
			<div class="page-header" style="margin-top: 0px;">
				<h4>교수 메인페이지</h4>
			</div>
			
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-info">
						<div class="panel-heading"><strong>주간 일정</strong><a class="pull-right" href="/professor/board/calendar.hta"><small> > 자세히보기</small></a></div>
					  	<div class="panel-body" style="height: 200px;">  
					  		<table class="table" id="lghtable">   
					  			<tr>    
				 					<th>월</th>
				 					<td v-if="subjects1.length == 0" colspan="3"></td>
				 					<td v-for="sub in subjects1" >{{sub.name}}</td>
				 					<td v-if="subjects1.length == 1" colspan="2"></td>
				 					<td v-if="subjects1.length == 2" colspan="1"></td>
				 				</tr>  
					  			<tr>   
				 					<th>화</th>
				 					<td v-if="subjects2.length == 0" colspan="3"></td>
				 					<td v-for="sub in subjects2" >{{sub.name}}</td>
				 					<td v-if="subjects2.length == 1" colspan="2"></td>
				 					<td v-if="subjects2.length == 2" colspan="1"></td>
				 				</tr>
					  			<tr>
				 					<th>수</th>   
				 					<td v-if="subjects3.length == 0" colspan="3"></td>
				 					<td v-for="sub in subjects3" >{{sub.name}}</td>
				 					<td v-if="subjects3.length == 1" colspan="2"></td>
				 					<td v-if="subjects3.length == 2" colspan="1"></td>
				 				</tr>  
					  			<tr>    
				 					<th>목</th>
				 					<td v-if="subjects4.length == 0" colspan="3"></td>
				 					<td v-for="sub in subjects4" >{{sub.name}}</td>
				 					<td v-if="subjects4.length == 1" colspan="2"></td>
				 					<td v-if="subjects4.length == 2" colspan="1"></td>
				 				</tr>
					  			<tr>
				 					<th>금</th>
				 					<td v-if="subjects5.length == 0" colspan="3"></td>
				 					<td v-for="sub in subjects5" >{{sub.name}}</td>
				 					<td v-if="subjects5.length == 1" colspan="2"></td>
				 					<td v-if="subjects5.length == 2" colspan="1"></td>
				 				</tr>
					  		</table> 
					  	</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="panel panel-info">
						<div class="panel-heading"><strong>자유게시판</strong><a class="pull-right" href="/staff/boardList.hta"><small> > 자세히보기</small></a></div>
					  	<div class="panel-body" style="height: 200px;">
					  		<p v-if="boards.length == 0">자유게시판 없음</p>
					  		<p v-for="board in boards" style="padding-top: 8px; padding-bottom: 8px; margin-bottom: 0px;"> > <strong>[{{board.title}}]</strong> {{board.content}} <span class="badge pull-right">{{board.viewCount}}</span></p>
					  	</div>
					</div>				       
				</div>   
			</div>   
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-info">
						<div class="panel-heading"><strong>강의현황</strong><a class="pull-right" href="/professor/lecture/list.hta"><small> > 자세히보기</small></a></div>
					  	<div class="panel-body">
					  		<table class="table">
					  			<thead>
					  				<tr>
					  					<th>학과</th>
					  					<th>과목명</th>			  					
					  					<th>강의목적</th>
					  					<th>학점</th>
					  					<th>전공여부</th>
					  				</tr>
					  			</thead>
					  			<tbody>
					  				<tr v-if="lectures.length == 0">
					  					<td colspan="5" class="text-center">조회된 강의 없음</td>
					  				</tr>
					  				<tr v-for="lecture in lectures">
					  					<td>{{lecture.deptName}}</td>
					  					<td>{{lecture.subjectName}}</td>
					  					<td>{{lecture.subjectObject}}</td>
					  					<td>{{lecture.subjectCredit}}</td>
					  					<td>{{lecture.subjectMajor}}</td>
					  				</tr>
					  			</tbody>
					  		</table>
					  	</div>
					</div>							
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-info">
						<div class="panel-heading"><strong>안내</strong><a></a></div>
					  	<div class="panel-body">
					  		{{proName}} 교수님 메인화면 입니다.
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
			subjects1: [],
			subjects2: [],
			subjects3: [],
			subjects4: [],   
			subjects5: [],
			lectures: [],
			boards:[],
			proName:[]
		},
		beforeCreate:function() {
			$.getJSON("/professor/homedate.hta", function(result) {
				app.subjects1 = result.subject1;		
				app.subjects2 = result.subject2;		
				app.subjects3 = result.subject3;		
				app.subjects4 = result.subject4;		
				app.subjects5 = result.subject5;		
			});
			$.getJSON("/professor/homelecture.hta", function(result) {
				app.lectures = result.lectures;
				app.proName = result.proName;
			});
			$.getJSON("/professor/homeboard.hta", function(result) {
				app.boards = result.boards;		
			});
			
		},
		methods: {  
		}   
	}); 
</script>

</body>
</html>