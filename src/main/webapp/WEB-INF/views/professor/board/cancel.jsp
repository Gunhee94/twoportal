<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>휴강신청</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
  
  <script src="/resources/js/zabuto_calendar.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/resources/js/zabuto_calendar.min.css">
  <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    
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
				<h4>휴강신청/조회<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#lghModalcancel">휴강 신청</button></h4>
			</div>
			
			<div class="row">
				<div class="col-sm-7">
					<table class="table">
						<colgroup>
							<col width="12%">
							<col width="12%">
							<col width="20%">
							<col width="32%">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th>신청일자</th>
								<th>시작일자</th>
								<th>과목명</th>
								<th>사유</th>
								<th>종료일자</th>
								<th>승인일자</th>
							</tr>
						</thead>	
						<tbody class="calcelNo-class">
							<tr v-if="cancels.length == 0">
								<td colspan="6" class="text-center">조회된 휴강이 없습니다.</td>
							</tr>
							<tr v-for="cancel in cancels">  
								<td>{{cancel.mycancellReqDate}}</td>
								<td>{{cancel.mycalcellStartDate}}</td>
								<td><a :data-cancel-no="cancel.cacellNo" class="cancela" href="" @click.prevent="canceltable(cancel.mycalcellStartDate, cancel.mycalcellEndDate)">{{cancel.subName}}</a></td>
								<td>{{cancel.cancellReason}}</td>
								<td>{{cancel.mycalcellEndDate}}</td>
								<td v-if="cancel.cancellRespDate == null">
									<button type="button" class="btn btn-danger" @click="deletecancel(cancel.cacellNo)" >승인전 삭제</button>
								</td>
								<td v-else>{{cancel.mycancellRespDate}}</td>
							</tr>
						</tbody>
					</table>   
				</div>
				<div class="col-sm-5" id="calendar-box">
					<div id="my-calendar"></div>				
				</div>
				
				<div id="lghModalcancel" class="modal fade" role="dialog">
					<div class="modal-dialog">  
				    	<div class="modal-content">
				      		<div class="modal-header">
				        		<button type="button" class="close" data-dismiss="modal">&times;</button>
				        		<h4 class="modal-title">휴강신청하기</h4>
				        	</div>
					      	<div class="modal-body">
								<form class="form-horizontal well">
						  			<div class="form-group">
										<label class="control-label col-sm-2">시작일자</label>    
										<div class="col-sm-6">
											<input type="date" class="form-control" v-model="param.startdate" >
										</div>
									</div>
									<div class="form-group">           
										<label class="control-label col-sm-2">종료일자</label>    
										<div class="col-sm-6">
											<input type="date" class="form-control" v-model="param.enddate" >
										</div>
										<button type="button" class="btn btn-default" @click="dateGet">해당날짜 강의 조회하기</button>
									</div>					     
									<div class="form-group">   
										<label class="control-label col-sm-6" style="text-align: left;">해당날짜의 강의목록</label> 
									</div>
									<div class="form-group">
										<div class="col-sm-12">      
											<ul class="list-group" v-if="lectureDays.length == 0" style="margin-bottom: 0px;">
												<li class="list-group-item">없음</li>
											</ul> 
											<ul class="list-group" v-for="day in lectureDays" style="margin-bottom: 0px;">
												<li class="list-group-item" v-bind:value="day.lectNo">{{day.subjectName}}</li>
											</ul> 
										</div>   
									</div>      
									<div class="form-group">
										<label class="control-label col-sm-2">휴강사유</label>									
									</div>
						  			<div class="form-group" >    
										<div class="col-sm-12">
											<textarea class="form-control" rows="5" cols="12" style="width: 100%;" v-model="param.object"></textarea>
										</div>
									</div>
									<button type="button" class="btn btn-primary btn-block" @click="cancelApply">휴강신청하기</button>
				 				</form>
							</div>  
				    	</div>
				  	</div>    
				</div>
			</div>
		
		</div>       
	</div>	  
</div>

<script type="text/javascript">

	function getDateRange(startDate, endDate) {
		var listDate = [];
	    var dateMove = new Date(startDate);
	    var strDate = startDate;
	    if (startDate == endDate) {
	        var strDate = dateMove.toISOString().slice(0,10);
	        listDate.push(getEventData(strDate));
	    } else {
	        while (strDate < endDate) {
	            var strDate = dateMove.toISOString().slice(0, 10);
	            listDate.push(getEventData(strDate));
	            dateMove.setDate(dateMove.getDate() + 1);
	        }
	    }
	    return listDate;
	};	
	
	function getEventData(date) {
		return {"date":date,"badge":false,"title":"Example 1"};
	}

	function drawCalendar(data) {
		$("#calendar-box").empty().append('<div id="my-calendar"></div>');
		$("#my-calendar").zabuto_calendar({
		    language: "kr",
		    data: data,
		    cell_border: true,
		    today: true,
		    show_days: true,
		    weekstartson: 0,
		    legend: [
		        {type: "block", label: "휴강신청 일자"}
		      ],
		  });
	}

	var app = new Vue({
		el:"#app",
		data: {
			cancels:[],
			lectureDays:[],
			param:{
				startdate:'',
				enddate:'',
				object:''
			},
		},
		beforeCreate:function() {
			$.getJSON('/professor/board/cancellist.hta', function(result) { 
				app.cancels = result.cancels;
			});
			drawCalendar([]);
		},
		methods: {
			canceltable : function(startdate, enddate) {
				var eventData = getDateRange(startdate, enddate);
				
				drawCalendar(eventData);
			},
			deletecancel:function(cancelNo) {
				$.getJSON('/professor/board/cancelcancel.hta', {cancelNo:cancelNo}, function(result) {
					window.location.reload();
					alert("휴강 삭제가 성공적으로 완료되었습니다.");
				});
			},
			cancelApply: function () {
				var start = app.param.startdate;
				if (start == "") {
					alert("휴강 시작날짜를 입력하세요");
					return;
				}
				var end = app.param.enddate;	
				if (end == "") {
					alert("휴강 종료날짜를 입력하세요");
					return;					
				}
				if (app.lectureDays.length == 0) {
					alert("휴강날짜에 해당되는 강의가 없어서 신청할 수 없습니다.");
					return;										
				} else {
					var lectNoArr = [];
					$(".list-group-item").each(function(index, item) {
						lectNoArr.push($(item).val());
					});   
					console.log('강의번호', lectNoArr);
					var data = this.param;
					data.lectNo = lectNoArr.join();
				}  
				$.getJSON('/professor/board/cancelapply.hta', data, function(result) {
					window.location.reload();
					alert("휴강신청이 성공적으로 완료되었습니다.");
				});
			},
			// 해당 강의 날짜 눌렀을 때 
			dateGet: function() {
				
				var start = app.param.startdate;
				var end = app.param.enddate;
				if (start == "") {
					alert("휴강 시작날짜를 입력하세요");
					return;
				}
				if (end == "") {
					alert("휴강 종료날짜를 입력하세요");
					return;					
				}
				
				var datecheck = end.substr(8,9) - start.substr(8,9);
				if (datecheck >= 3) {
					alert("휴강일자는 4일 이상 선택할 수 없습니다.");
					return;
				}
				
				var listDate = [];
				console.log(listDate);
				
				function getDate(startDate, endDate, listDate) {
				    var dateMove = new Date(startDate);
				    var strDate = startDate;
				    if (startDate == endDate) {
				        var strDate = dateMove.toISOString().slice(0,10);
				        listDate.push(strDate);
				    } else {
				        while (strDate < endDate) {
				            var strDate = dateMove.toISOString().slice(0, 10);
				            listDate.push(strDate);
				            dateMove.setDate(dateMove.getDate() + 1);
				        }
				    }
				    return listDate;
				};
				
				getDate(start, end, listDate);
				
				var week = ['일', '월', '화', '수', '목', '금', '토']; 
				
				var dayArr = [];
				for (var i=0; i<listDate.length; i++) {
					dayArr += week[new Date(listDate[i]).getDay()];
				}
				
				$.getJSON('/professor/board/daycheck.hta',{dayArr:dayArr} ,function(result) { 
					app.lectureDays = result.lectureDay;
				});
			},
		}
	});          


	  
	
</script>
</body> 
</html>