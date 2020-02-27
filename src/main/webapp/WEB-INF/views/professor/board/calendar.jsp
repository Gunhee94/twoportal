<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>시간표</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
  
	<style>
		#lghtimetable th, td {
			text-align: center;
		}
	</style>   
</head>     
<body onload="onload()">  
<div class="container-fluid" id="app"> 
	<%@include file="../../common/navheader.jsp" %>     
	<div class="row" >
		<div class="col-sm-2">
			<%@include file="../../common/navleft.jsp" %>
		</div>
		<div class="col-sm-10" >
			<div class="page-header" style="margin-top: 0px;">
				<h4 id="year-semester"></h4>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
					<table class="table table-bordered" id="lghtimetable">
						<colgroup>
							<col width="1%">
							<col width="11%">
							<col width="11%">   
							<col width="11%">
							<col width="11%">
							<col width="11%">
							<col width="11%">
							<col width="11%">
							<col width="11%">
							<col width="11%">
						</colgroup>
						<thead>
							<tr class="info">
								<th></th>
								<th>1교시</th>
								<th>2교시</th>
								<th>3교시</th>
								<th>4교시</th>
								<th>5교시</th>
								<th>6교시</th>
								<th>7교시</th>
								<th>8교시</th>
								<th>9교시</th>
							</tr>
						</thead>   
						<tbody> 
							<tr>
								<th class="active" id="mon">월요일</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>  
							<tr>
								<th class="active" id="tues">화요일</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>  
							<tr>
								<th class="active" id="wed">수요일</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>  
							<tr>
								<th class="active" id="thur">목요일</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>  
							<tr>
								<th class="active" id="fri">금요일</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>  
						</tbody>
					</table>
				</div>
			</div>
		</div>       
	</div>	  
</div>

<script type="text/javascript">	
	
	$("#lghtimetable td").css('vertical-align', 'middle');
	
	function onload() {
		
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var semester = Math.ceil(month/6);
		   
		$("#year-semester").text(year + '년 ' + semester + '학기 시간표');
		
		$.getJSON('/professor/board/timetable.hta',{lectDay : '월' }, function(result) {
			if (result.monlect.length == 0) {
				$("#mon").nextAll().empty();
				$("#mon").nextAll().eq(0).prop('colspan', 9);
				$("#mon").nextAll().eq(0).addClass('text-center');
				$("#mon").nextAll().eq(0).text('해당 요일의 강의가 없습니다.');
				$("#mon").nextAll().eq(0).nextAll().remove();
			} else {
				$.each(result.monlect, function(index, item) {
					if (item.thirdPeriod != 0) {
						$("#mon").nextAll().eq(item.thirdPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}  
					if (item.secondPeriod != 0) {
						$("#mon").nextAll().eq(item.secondPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}
					$("#mon").nextAll().eq(item.firstPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
				});
			}
		});
		$.getJSON('/professor/board/timetable.hta',{lectDay : '화' }, function(result) {
			if (result.monlect.length == 0) {
				$("#tues").nextAll().empty();
				$("#tues").nextAll().eq(0).prop('colspan', 9);
				$("#tues").nextAll().eq(0).addClass('text-center');
				$("#tues").nextAll().eq(0).text('해당 요일의 강의가 없습니다.');
				$("#tues").nextAll().eq(0).nextAll().remove();
			} else {
				$.each(result.monlect, function(index, item) {
					if (item.thirdPeriod != 0) {
						$("#tues").nextAll().eq(item.thirdPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}  
					if (item.secondPeriod != 0) {
						$("#tues").nextAll().eq(item.secondPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}
					$("#tues").nextAll().eq(item.firstPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
				});  
			}
		});
		$.getJSON('/professor/board/timetable.hta',{lectDay : '수' }, function(result) {
			if (result.monlect.length == 0) {
				$("#wed").nextAll().empty();
				$("#wed").nextAll().eq(0).prop('colspan', 9);
				$("#wed").nextAll().eq(0).addClass('text-center');
				$("#wed").nextAll().eq(0).text('해당 요일의 강의가 없습니다.');
				$("#wed").nextAll().eq(0).nextAll().remove();
			} else {
				$.each(result.monlect, function(index, item) {
					if (item.thirdPeriod != 0) {
						$("#wed").nextAll().eq(item.thirdPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}  
					if (item.secondPeriod != 0) {
						$("#wed").nextAll().eq(item.secondPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}
					$("#wed").nextAll().eq(item.firstPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
				});
			}
		});
		$.getJSON('/professor/board/timetable.hta',{lectDay : '목' }, function(result) {
			if (result.monlect.length == 0) {
				$("#thur").nextAll().empty();
				$("#thur").nextAll().eq(0).prop('colspan', 9);
				$("#thur").nextAll().eq(0).addClass('text-center');
				$("#thur").nextAll().eq(0).text('해당 요일의 강의가 없습니다.');
				$("#thur").nextAll().eq(0).nextAll().remove();
			} else {       
				$.each(result.monlect, function(index, item) {
					if (item.thirdPeriod != 0) {
						$("#thur").nextAll().eq(item.thirdPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}  
					if (item.secondPeriod != 0) {
						$("#thur").nextAll().eq(item.secondPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}
					$("#thur").nextAll().eq(item.firstPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
				});
			}
		});
		$.getJSON('/professor/board/timetable.hta',{lectDay : '금' }, function(result) {
			if (result.monlect.length == 0) {
				$("#fri").nextAll().empty();
				$("#fri").nextAll().eq(0).prop('colspan', 9);
				$("#fri").nextAll().eq(0).addClass('text-center');
				$("#fri").nextAll().eq(0).text('해당 요일의 강의가 없습니다.');
				$("#fri").nextAll().eq(0).nextAll().remove();
			} else {
				$.each(result.monlect, function(index, item) {
					if (item.thirdPeriod != 0) {
						$("#fri").nextAll().eq(item.thirdPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}  
					if (item.secondPeriod != 0) {
						$("#fri").nextAll().eq(item.secondPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
					}
					$("#fri").nextAll().eq(item.firstPeriod-1).text(item.subjectName +" "+ item.lectPlace +" "+ item.lectureRoom + "호");
				}); 
			}
		});
	}
</script>
</body> 
</html>