<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>강의조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body onload="onloadgetLecture()">   
<div class="container-fluid"> 
	<%@include file="../../common/navheader.jsp" %>  
	<div class="row" >       
		<div class="col-sm-2">
			<%@include file="../../common/navleft.jsp" %>
		</div>
		<div class="col-sm-10" >
			<div class="page-header" style="margin-top: 0px;">
				<h4>강의 조회</h4>
			</div>
			
			<div class="row">     
				<div class="col-sm-12">
					<form class="form-inline" action="">
						<div class="form-group">
							<label>개설년도</label>  
							<input type="text" class="form-control" name="year" placeholder="년도를 입력하세요." id="lecture-year" maxlength="4" >
						</div>  
						<div class="form-group">
							<label>학기 </label>    
							<select name="semester" class="form-control" id="lecture-semester">
								<option value="0" selected> -- 전체 --</option>  
								<option value="1" > 1 학기</option>
								<option value="2" > 2 학기</option>
							</select>   
						</div>    
						<button type="button" class="btn btn-default" id="btn-get">조회</button>
					</form>
					<span class="pull-right">총 강의 조회수 : <strong id="result-count"></strong> 건 </span>  
				</div>        
			</div>    
			
			<div class="row">
				<div class="col-sm-12">
					<table class="table table-hover" id="lecture-table">
						<thead>
							<tr>
								<th>개설년도</th>
								<th>학기</th>
								<th>과목명</th>
								<th>총정원</th>
								<th>강의상태</th>
								<th></th>
							</tr>
						</thead>      
						<tbody></tbody>  
					</table>
				</div>
			</div>
			
			<div id="lghModal" class="modal fade" role="dialog">
				<div class="modal-dialog">  
			    	<div class="modal-content">
			      		<div class="modal-header">
			        		<button type="button" class="close" data-dismiss="modal">&times;</button>
			        		<h4 class="modal-title">수강 학생</h4>
			      		</div>
				      	<div class="modal-body">
				        	<table class="table" id="student-table">
				        		<thead>
				        			<tr>
				        				<th>이름</th>
				        				<th>학번</th>  
				        				<th>학과</th>
				        				<th>학년</th>
				        				<th>핸드폰</th>
				        				<th>이메일</th>
				        			</tr>
				        		</thead>
				        		<tbody></tbody>
				        	</table>  
				      	</div>
			    	</div>   
			  	</div>    
			</div>
			
			<div id="lghTestModal" class="modal fade" role="dialog">
				<div class="modal-dialog">  
			    	<div class="modal-content" id="grade-page">
			      		<div class="modal-header">
			        		<button type="button" class="close" data-dismiss="modal">&times;</button>
			      		</div>
				      	<div class="modal-body"></div>
				      	<div class="modal-footer"></div>
			    	</div>   
			  	</div>    
			</div>
			
			<div class="row">
				<div class="col-sm-12">                                      
					<h5>상세 내용</h5>
					
					<div class="row">
						<div class="col-sm-12" id="lecture-detail">
							<table class="table">
								<colgroup>
									<col width="12%"/>
									<col width="12%"/>
									<col width="12%"/>
									<col width="12%"/>
									<col width="12%"/>  
									<col width="12%"/>
									<col width="12%"/>
									<col width="12%"/>
								</colgroup>
								<tr>  
									<th>교과목</th>
									<td id="lect-name"></td>
									<th>이수구분</th>
									<td id="lect-major"></td>
									<th>학점</th>
									<td id="lect-credit"></td>
									<th>강의실</th>
									<td id="lect-room"></td>
								</tr>
								<tr>
									<th>강의시간</th>
									<td colspan="3" id="lect-time"></td>
									<th>수강대상</th>
									<td colspan="3" id="lect-targer"></td>
								</tr> 
							</table>
							
							<h5>강의내용</h5>
							<div class="well" id='lect-object'></div>
						</div>
					</div>
				</div>    
			</div>
			
			<div class="row">
				<div class="col-sm-12">
					<table class="table">
						<thead>
							<tr>
								<th>평가요소</th>
								<th>출석</th>
								<th>시험</th>
								<th>계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>배점비율</td>
								<td>30</td>
								<td>70</td>
								<td>100</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>   
	</div>
	
<script type="text/javascript">
	
	$("#lecture-year").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 맨 처음 로딩 될때 
	function onloadgetLecture() {
		
		var semester;
		var year;
		$.getJSON("/professor/lecture/listcri.hta", {semester:semester, year:year}, function(result) {  
			
			var row = "";  
			if (result.length == 0) {      
				row += "<tr>";
				row += "<td colspan='7' class='text-center'>조회된 강의가 없습니다.</td>";
				row += "</tr>";
			} else {
				  
				$.each(result, function(index, item) {
					
					row += "<tr>";
					row += "<td>"+item.lectureCreateDateYear+"</td>";
					row += "<td>"+item.lectSemester+"</td>";
					row += "<td><a href='' data-lect-no="+item.lectNo+" >"+item.subjectName+"</a></td> ";
					row += "<td>"+item.lectureTotalNumber+" / 20</td>";
					row += "<td>"+item.lectStatus+"</td>";						
					row += "<td><button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-lect-no="+item.lectNo+" data-target='#lghModal'>수강 학생</button></td>";
					row += "</tr>";
				});
			};
				$("#lecture-table tbody").append(row);
				$("#result-count").text("[ "+result.length+" ]");		
		});  
	};
	      
	// 수강학생을 눌렀을 때 
	$("#lecture-table tbody").on('click', 'button[data-lect-no]', function(event) {
		event.preventDefault();
		var lectNo = $(this).data("lect-no");
		
		console.log(lectNo);
		
		var $tbody = $("#student-table tbody").empty();
		
		$.getJSON("/professor/lecture/stuLectList.hta", {lectno:lectNo}, function(result) {
			var row = "";
			if (result.length == 0) {
				row += "<tr>";
				row += "<td colspan='6' class='text-center'>수강 학생이 없습니다.</td>";
				row += "</tr>";
			} else {
				$.each(result, function(index, item) {
					row += "<tr>";
					row += "<td>"+item.stuName+"</td>";
					row += "<td>"+item.stuId+"</td>";
					row += "<td>"+item.deptName+"</td>";
					row += "<td>"+item.stuGrade+"</td>";
					row += "<td>"+item.stuPhone+"</td>";
					row += "<td>"+item.stuEmail+"</td>";
					row += "</tr>";
				});
			};
			$("#student-table tbody").append(row);
			$("#lghModal").modal('show');
		});
		
	});
	
	// 과목명 클릭했을 때 
	$("#lecture-table tbody").on('click', 'a[data-lect-no]', function (event) {
		event.preventDefault();
		
		var lectNo = $(this).data("lect-no");
		
		console.log("강의번호", lectNo); 
		var $tbody = $("#lecture-detail td, #lecture-detail div").empty();
		
		$.getJSON("/professor/lecture/detail.hta", {lectno:lectNo}, function(result) {
			var subjectName = result.subjectName;
			var credit = result.subjectCredit;
			var room = result.lectureRoom;
			var place = result.lectPlace;
			var number = result.lectureTotalNumber;
			var time = result.time;
			var deptname = result.deptName;
			var year = result.targetYear;
			var object = result.subjectObject;
			var major = result.subjectMajor;
			
			$("#lect-name").text(subjectName);
			$("#lect-major").text(major);
			$("#lect-credit").text(credit);
			$("#lect-room").text(place +" "+ room + " 호");
			$("#lect-time").text(time);
			$("#lect-targer").text(deptname+" "+year+ " 학년");  
			$("#lect-object").text(object);
			
		});    
	});   
	
	// 년도, 학기 로 조회 버튼 눌렀을 때 
	$("#btn-get").click(function(event) {
		event.preventDefault();
	
		var year = $("#lecture-year").val();
		
		if (!year) {
			alert("개설년도를 입력하세요.");
			$("#lecture-year").focus();
			return;
		}
		  
		var $tbody = $("#lecture-table tbody").empty();
		  
		var semester = $("#lecture-semester").val();
		var year = $("#lecture-year").val();
		console.log(year);
		$.getJSON("/professor/lecture/listcri.hta", {semester:semester, year:year}, function(result) {
			
			var row = "";  
			if (result.length == 0) {      
				row += "<tr>";
				row += "<td colspan='7' class='text-center'>조회된 강의가 없습니다.</td>";
				row += "</tr>";
			} else {
				  
				$.each(result, function(index, item) {
					
					row += "<tr>";
					row += "<td>"+item.lectureCreateDateYear+"</td>";
					row += "<td>"+item.lectSemester+"</td>";
					row += "<td><a href='' data-lect-no="+item.lectNo+" >"+item.subjectName+"</a></td> ";
					row += "<td>"+item.lectureTotalNumber+" / 20</td>";
					row += "<td>"+item.lectStatus+"</td>";		
					row += "<td><button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-lect-no="+item.lectNo+" data-target='#lghModal'>수강 학생</button></td>";
					row += "</tr>";
				});
			};
				$("#lecture-table tbody").append(row);
				$("#result-count").text("[ "+result.length+" ]");	
				
		});  
		$("#lecture-detail td, #lecture-detail div").empty();
	});  
</script>
</div>
</body>
</html>