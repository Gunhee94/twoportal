<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../../common/navheader.jsp" %>
		<div class="row" >
			<div class="col-sm-2" >
				<%@include file="../../common/navleft.jsp" %>
			</div>
			<div class="col-sm-10" >
				<div class="row">
					<div class="page-header">
						<h1>강사 출석체크 </h1>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<!--참조:http://goqr.me/api/doc/create-qr-code/#quickstart -->			
						<img src="https://api.qrserver.com/v1/create-qr-code/?data=http://ce62b95c.ngrok.io/student/dayCheck.hta?lecno=${lectureNo }
						&amp;size=500x500" alt="" title="" style=" padding-left: 50px;"/>
					</div>
					<div class="col-sm-6">
						<div class="col-sm-11">
							<div class="row">
								<div class="panel panel-info">
									<div class="panel-heading">강좌 정보</div>
								  	<div class="panel-body">
								  		<table class="table">
								  			<thead>
								  				<tr>
								  					<th>과목명</th>
								  					<th>강의건물</th>			  					
								  					<th>교수</th>
								  					<th>날짜</th>
								  				</tr>
								  			</thead>
								  			<tbody>
								  				<tr>
								  					<td>${dto.subjectName }</td>
								  					<td>${dto.place }</td>
								  					<td>${dto.proName }</td>
								  					<td>${dto.today }</td>
								  				</tr>
								  			</tbody>
								  		</table>
								  	</div>
								</div>				
							</div>
							<div class="row">
								<div class="text-center ">
									<h2>실시간 출석율</h2>
								</div>
								<div class="progress">
								  <div class="progress-bar progress-bar-striped active" id="progress-bar" role="progressbar"
								  aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
								    <p>0%</p>
								  </div>
								</div>
							</div>
							<div class="row"> <br/><br/></div>
							<div class="row ">
								<div class="col-sm-6">
									<table class="table table-bordered " id="checked-stu" style="text-align: center">
										<thead>
											<tr>
												<th class="bg-secondary" colspan="1" style="text-align: center">출석 완료</th>
											</tr>
										</thead>
										<tbody>
									
										</tbody>
									
									</table>
								</div>
								<div class="col-sm-6">
									<table class="table table-bordered"  id="not-checked-stu" style="text-align: center">
										<thead>
											<tr>
												<th class="page-header" colspan="1" style="text-align: center">출석 대기</th>
											</tr>
										</thead>
										<tbody>
										
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
</body>

<script type="text/javascript">

var checkedNum;
var NotcheckdNum;


$(document).ready(function(){
    setInterval(function(){
    	
    	$.ajax({
    		url: "/getJsonCheckedStudents.hta?lecno="+"${lectureNo}",
    		type: "GET",
    		dataType: "json"
    	}).done(function(json) {
    		var resultHTML = '';
    		var count = 0;
    		$.each(json,function(index,item) {
    			resultHTML += "<tr>";
    			resultHTML += "<td>"+item.name+"</td>";
    			resultHTML += "</tr>";
    			count++
    		})
    		checkedNum = count;
    		
    		$("#checked-stu tbody *").remove();
    		$("#checked-stu tbody").append(resultHTML);
    	});



    	$.ajax({
    		url: "/getJsonNotCheckedStudents.hta?lecno="+"${lectureNo}",
    		type: "GET",
    		dataType: "json"
    	}).done(function(json) {
    		var resultHTML = '';
    		var count = 0;
    		$.each(json,function(index,item) {
    			resultHTML += "<tr>";
    			resultHTML += "<td>"+item.name+"</td>";
    			resultHTML += "</tr>";
    			count++
    		})
    		NotcheckdNum = count;
    	    $("#not-checked-stu tbody *").remove();
    	    $("#not-checked-stu tbody").append(resultHTML);
    	}); 

    	
	    const checkedGage = String(parseInt((checkedNum/(checkedNum+NotcheckdNum))*100)) + "%";
	    var test =  $("#progress-bar").css("width",checkedGage);  
	    $("#progress-bar p").text(checkedGage);
    },1000);
}); 
</script>
