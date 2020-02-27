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
	<style>
	.table-striped th {
		text-align: center;
	}
	#review-panel-table {
		display: none;
	}
	</style>   
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
				<h4>강의 평가</h4>
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
				</div>        
			</div>    
			
			<div class="row">     
				<div class="col-sm-6">
					<table class="table table-hover" id="review-table">
						<thead>
							<tr>
								<th>개설년도</th>
								<th>학기</th>
								<th>학과</th>
								<th>교수명</th>
								<th>과목명</th>
								<th>강의평가여부</th>
								<th>총평가점수</th>
							</tr>
						</thead>      
						<tbody></tbody>  
					</table>
				</div> 
			
		  		<div class="col-sm-6 panel panel-info" style="padding-left: 0px; padding-right: 0px;" id="review-panel-table">
		  			<div class="panel-heading">강의평가하기</div>
		  			<div class="panel-body">
		  				<form>
				  			<table class="table table-striped text-center" id="">
								<thead>
									<tr>
										<th>순번</th>
										<th>평가항목</th>
										<th>그렇다(5점)</th>
										<th>보통이다(3점)</th>
										<th>아니다(1점)</th>
									</tr>   
								</thead>      
								<tbody>  
									<tr>   
										<td>1</td>
										<td>교수님은 학생들의 참여와 소통을 독려하였다.</td>
										<td><input type="radio" name="eva-1" value="5" class="eva-class-1"></td>
										<td><input type="radio" name="eva-1" value="3" class="eva-class-1"></td>
										<td><input type="radio" name="eva-1" value="1" class="eva-class-1"></td>
									</tr>
									<tr>
										<td>2</td>
										<td>교수님은 열의를 가지고 강의를 진행하였다.</td>
										<td><input type="radio" name="eva-2" value="5" class="eva-class-2"></td>
										<td><input type="radio" name="eva-2" value="3" class="eva-class-2"></td>
										<td><input type="radio" name="eva-2" value="1" class="eva-class-2"></td>
									</tr>
									<tr>
										<td>3</td>
										<td>본 강의를 다른 학생에게 추천하고 싶다.</td>
										<td><input type="radio" name="eva-3" value="5" class="eva-class-3"></td>
										<td><input type="radio" name="eva-3" value="3" class="eva-class-3"></td>
										<td><input type="radio" name="eva-3" value="1" class="eva-class-3"></td>
									</tr>
									<tr>
										<td>4</td>
										<td>본 강의는 전반적으로 유익하였다.</td>
										<td><input type="radio" name="eva-4" value="5" class="eva-class-4"></td>
										<td><input type="radio" name="eva-4" value="3" class="eva-class-4"></td>
										<td><input type="radio" name="eva-4" value="1" class="eva-class-4"></td>
									</tr>
									<tr>
										<td>5</td>
										<td>나는 전체적으로 이 강의에 만족한다.</td>
										<td><input type="radio" name="eva-5" value="5" class="eva-class-5"></td>
										<td><input type="radio" name="eva-5" value="3" class="eva-class-5"></td>
										<td><input type="radio" name="eva-5" value="1" class="eva-class-5"></td>
									</tr>
								</tbody>  
							</table>
							<button type="button" class="btn btn-primary btn-block" id="review-do" >평가제출하기</button>
		  				</form>
		  			</div>
		  		</div>   
		  		
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
		
		$.getJSON("/professor/lecture/reviewcri.hta", {semester:semester, year:year}, function(result) {  
			
			var row = "";  
			if (result.length == 0) {      
				row += "<tr>";
				row += "<td colspan='7' class='text-center'>평가할 강의가 없습니다.</td>";
				row += "</tr>";
			} else {
				  
				$.each(result, function(index, item) {
					
					row += "<tr>";
					row += "<td>"+item.date+"</td>";
					row += "<td>"+item.lectSemester+"</td>"; 
					row += "<td>"+item.deptName+"</td> ";
					row += "<td>"+item.proName+"</td>";
					row += "<td>"+item.subName+"</td>";
					if (item.iscompleted == null) {
						row += "<td><button type='button' class='btn btn-success btn-xs'>강의평가완료</button></td>";
						row += "<td><strong style='color: #eea236'>"+item.star+"</strong></td>";
					} else {						
						row += "<td><button type='button' class='btn btn-warning btn-xs uncompleted' data-lect-no="+item.lectListNo+">강의평가하기</button></td>";
						row += "<td></td>";
					}
					row += "</tr>";  
				});
			};
				$("#review-table tbody").append(row);
		});       
	};
	
	// 강의평가하기를 눌렀을 때 
	$("#review-table tbody").on('click', '.uncompleted[data-lect-no]', function(event) {
		event.preventDefault();
		
		var lectListNo = $(this).data("lect-no");
		
		$("#review-panel-table").show();
		
		// 평가제출하기를 눌렀을 때 
		$("#review-do").click(function() {
			var eva1 = $(".eva-class-1:checked").val();
			if (eva1 == null) {
				alert('1 문항이 선택이 안되어있습니다.');
				return;
			}
			var eva2 = $(".eva-class-2:checked").val();
			if (eva2 == null) {
				alert('2 문항이 선택이 안되어있습니다.');
				return;
			}
			var eva3 = $(".eva-class-3:checked").val();
			if (eva3 == null) {
				alert('3 문항이 선택이 안되어있습니다.');
				return;
			}
			var eva4 = $(".eva-class-4:checked").val();
			if (eva4 == null) {
				alert('4 문항이 선택이 안되어있습니다.');
				return;
			}
			var eva5 = $(".eva-class-5:checked").val();
			if (eva5 == null) {
				alert('5 문항이 선택이 안되어있습니다.');
				return;
			}
			
			eva1 *= 1;
			eva2 *= 1;
			eva3 *= 1;
			eva4 *= 1;
			eva5 *= 1;
			
			var total = eva1 + eva2 + eva3 + eva4 + eva5;
			console.log('총점' , total);
			
			$.getJSON("/professor/lecture/reviewinsert.hta", {lectListNo:lectListNo, total:total}, function(result) {
				alert(result.message);
			});
			window.location.reload();
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
		  
		var $tbody = $("#review-table tbody").empty();
		  
		var semester = $("#lecture-semester").val();
		var year = $("#lecture-year").val();
		console.log(year);
		
		$.getJSON("/professor/lecture/reviewcri.hta", {semester:semester, year:year}, function(result) {  
			
			var row = "";  
			if (result.length == 0) {      
				row += "<tr>";
				row += "<td colspan='7' class='text-center'>평가할 강의가 없습니다.</td>";
				row += "</tr>";
			} else {
				  
				$.each(result, function(index, item) {
					
					row += "<tr>";
					row += "<td>"+item.date+"</td>";
					row += "<td>"+item.lectSemester+"</td>"; 
					row += "<td>"+item.deptName+"</td> ";
					row += "<td>"+item.proName+"</td>";
					row += "<td>"+item.subName+"</td>";
					if (item.iscompleted == null) {
						row += "<td><button type='button' class='btn btn-success btn-xs'>강의평가완료</button></td>";
						row += "<td><strong style='color: #eea236'>"+item.star+"</strong></td>";
					} else {						
						row += "<td><button type='button' class='btn btn-warning btn-xs uncompleted' data-lect-no="+item.lectListNo+">강의평가하기</button></td>";
						row += "<td></td>";
					}
					row += "</tr>";
				});
			};
				$("#review-table tbody").append(row);
		});  
		
	});  
	
	
</script>
</body>  

</html>