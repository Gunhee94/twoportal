<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style type="text/css">
		#test-main {
			padding-bottom: 15px;
			padding-left: 15px;
			padding-right: 15px;
		}
		.test-main {
			overflow: auto;
			max-height: 706px;
			position: relative;
		}
		.info-box {
			padding: 10px;
			margin: 40px;
		}
		.each-question {
			border: 1px solid black;
			padding: 10px;
			margin-left: 40px;
			margin-right: 40px;
			margin-bottom: 40px;
		}
		.background-div {
			background-image: url('../../../../../resources/images/exam/testmain.jpg');
			background-repeat: no-repeat;
			background-size: cover;
		}
		.each-answer {
			cursor: pointer;
		}
		.each-answer:hover {
			background-color: lightgrey;
		}
		.question-group:hover {
			background-color: lightyellow;
			cursor: pointer;
		}
		.num {
			margin-left: 40px;
			margin-right: 40px;
		}
		.re-check {
			border: 2px solid red;
			color: red;
			font-weight: bold;
			margin-left: 8px;
			margin-bottom: 10px;
			padding: 3px;
		}
	</style>
</head>
<body onload="onloadExamPage()" oncontextmenu="return blockRightClick()" ondragstart="return blockSelect()" onselectstart="return false">

<div class="container-fluid">
	
	<!-- <div class="progress">
		<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
			60%
		</div>
	</div> -->
	<!-- <span class='re-check'>다시풀기</span> -->
	<div class="row">
		<div class="col-sm-10">
			<table class="table table-bordered">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<p><strong>학과 : </strong>경영학과 <strong>학번 : 116502</strong></p>
							<p><strong>이름 : 홍길동</strong></p>
						</td>
						<td class="text-center">
							<p style="font-size: 40px;"><strong>디지털공학개론</strong></p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-sm-2">
			<table class="table table-bordered"> 
				<tbody>
					<tr>
						<td>
							<div class="row">
								<div class="col-sm-3" style="padding-top: 5px;">
									<img src="../../../../../resources/images/exam/clock.jpg" style="width: 55px; height: 55px;"/>
								</div>
								<div class="col-sm-9" style="padding-top: 5px;">
									<p><span style="font-weight: bolder; font-size: medium;">시험시간</span> : 01시 00분 00초</p>
									<p><span style="font-weight: bolder; font-size: medium;">남은시간</span> : 0<span id="hourCounter"></span>시 <span id="minuteCounter"></span>분 <span id="secondCounter"></span>초</p>
								</div>
							</div>
						
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-10 test-main">
			<div class="row"  id="test-main">
				<div class="col-sm-12 background-div">
				
				</div>
			</div>
			<!-- <table class="table table-bordered" id="test-main">
				<tbody class="background-tbody">
				</tbody>
			</table> -->
		</div>
		<div class="col-sm-2">
			<table class="table table-bordered" id="test-answer">
				<col width="20%">
				<col width="80%">
				<tbody>
					<tr>
						<td colspan="2" class="text-center warning" style="font-weight: bolder; font-size: medium;">답안 체크현황</td>
					</tr>
					<tr class="question-group" data-target="#group-1" data-toggle="tooltip" data-placement="left" title="클릭시 문제그룹으로 이동합니다.">
						<td class="text-center"><!--  style="background-color: #ffecb3;"  -->
							<p><span class="answer-no" style="font-weight: bolder;">1번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">2번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">3번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">4번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">5번</span></p> 
						</td>
						<td><!-- 2번째 td  -->
							<p data-question="1">
							<!--  style="background-color: lightsalmon;" -->
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
								<!-- <span>&#9733;</span> -->
							</p>
							<p data-question="2">
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p data-question="3">
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p data-question="4">
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p data-question="5">
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
						</td>
					</tr>
					<tr class="question-group" data-target="#group-2" data-toggle="tooltip" data-placement="left" title="클릭시 문제그룹으로 이동합니다.">
						<td class="text-center">
							<p><span class="answer-no" style="font-weight: bolder;">6번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">7번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">8번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">9번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">10번</span></p>
						</td>
						<td>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span> 
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
						</td>
					</tr>
					<tr class="question-group" data-target="#group-3" data-toggle="tooltip" data-placement="left" title="클릭시 문제그룹으로 이동합니다.">
						<td class="text-center">
							<p><span class="answer-no" style="font-weight: bolder;">11번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">12번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">13번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">14번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">15번</span></p>
						</td> 
						<td>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
						</td>
					</tr>
					<tr class="question-group" data-target="#group-4" data-toggle="tooltip" data-placement="left" title="클릭시 문제그룹으로 이동합니다.">
						<td class="text-center">
							<p><span class="answer-no" style="font-weight: bolder;">16번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">17번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">18번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">19번</span></p>
							<p><span class="answer-no" style="font-weight: bolder;">20번</span></p>
						</td>
						<td>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
							<p>
								<span>&#9312;</span>
								<span>&#9313;</span>
								<span>&#9314;</span>
								<span>&#9315;</span>
								<span>&#9316;</span>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<button class="btn btn-large btn-primary pull-right" id="btn-test-submit" style="margin-right: 20px;">제출하기</button>
			</div>
		</div>
		
	</div>	
</div>

















<div class="modal fade" id="testSubmitModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel"><strong>시험 제출 확인</strong></h4>
			</div>
			<div class="modal-body">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<strong>한 번 제출하면 되돌릴 수 없습니다. 정말 제출하시겠습니까?</strong>
					</div>
				</div>			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger btn-final-submit">제출하기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="testUncheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel"><strong>시험 제출 확인</strong></h4>
			</div>
			<div class="modal-body">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<strong>체크하지 않은 내역이 있습니다. 정말 제출하시겠습니까?</strong>
					</div>
				</div>			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="find-uncheck">취소</button>
				<button type="button" class="btn btn-danger btn-final-submit">제출하기</button>
			</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">

	function onloadExamPage() {
		var $testmain = $("#test-main .background-div")
		//console.log("테스트메인 출력부분 찾기 : ", testmain);
		var testInfoNo = 33338;
		
		// 시험출력될부분 다 비우기
		$testmain.empty();
		
		// 시험문제 불러오기
		$.getJSON("/student/exam/getTestQuestions.hta", {testInfoNo:testInfoNo}, function(result) {
			
			//console.log("받은데이터 result는 : ", result);
			$testmain.empty();
			
			var row = "";
			row += "<div class='alert alert-danger info-box text-center' role='alert'><strong>시간이 종료되면 자동 제출되니 주의하시기 바랍니다.</strong></div>";

			$.each(result, function(index, item) {

				if (item.no == 1) {
					row += "<p class='num top' id='group-1'><span style='font-weight: bolder; font-size: medium;'>문제"+item.no+".</span><button type='button' data-btnno='"+item.no+"' class='pull-right btn btn-default btn-xs btn-warning recheck'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span> 다시풀기 체크버튼</button>";				
				} else if (item.no == 6) {
					row += "<p class='num ' id='group-2'><span style='font-weight: bolder; font-size: medium;'>문제"+item.no+".</span> <button type='button' data-btnno='"+item.no+"' class='pull-right btn btn-default btn-xs btn-warning recheck'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span> 다시풀기 체크버튼</button>";				
				} else if (item.no == 11) {
					row += "<p class='num ' id='group-3'><span style='font-weight: bolder; font-size: medium;'>문제"+item.no+".</span> <button type='button' data-btnno='"+item.no+"' class='pull-right btn btn-default btn-xs btn-warning recheck'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span> 다시풀기 체크버튼</button>";				
				} else if (item.no == 16) {
					row += "<p class='num ' id='group-4'><span style='font-weight: bolder; font-size: medium;'>문제"+item.no+".</span> <button type='button' data-btnno='"+item.no+"' class='pull-right btn btn-default btn-xs btn-warning recheck'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span> 다시풀기 체크버튼</button>";				
				} else {
					row += "<p class='num'><span style='font-weight: bolder; font-size: medium;'>문제"+item.no+".</span> <button type='button' data-btnno='"+item.no+"' class='pull-right btn btn-default btn-xs btn-warning recheck'><span class='glyphicon glyphicon-ok' aria-hidden='true'></span> 다시풀기 체크버튼</button>";				
				}
				
				row += "<div class='each-question'>"
				row += "<p><span style='font-weight:bold;'>" +item.content+ " [" + item.scoring + "점]</span></p>";
				row += "<p><span class='each-answer' data-no='" + item.no + "' data-answerno='1'>ⓛ" +item.firstQuestion+ "</span></p>";
				row += "<p><span class='each-answer' data-no='" + item.no + "' data-answerno='2'>②" +item.secondQuestion+ "</span></p>";
				row += "<p><span class='each-answer' data-no='" + item.no + "' data-answerno='3'>③" +item.thirdQuestion+ "</span></p>";
				row += "<p><span class='each-answer' data-no='" + item.no + "' data-answerno='4'>④" +item.forthQuestion+ "</span></p>";
				row += "<p><span class='each-answer' data-no='" + item.no + "' data-answerno='5'>⑤" +item.fifthQuestion+ "</span></p>";
				row += "</div>";
				
				$testmain.append(row);
				row = "";
			})
		})
	}
	
	// 시험 남은시간 카운트다운
	var hour = 3600;
	function getCountDown() {
		//console.log("CountDoun함수 실행!")
		
		var days = hour/ 60 / 60 / 24;
		var daysRound = Math.floor(days);
		//console.log("남은날짜는 : ", daysRound);
		
		var hours = hour / 60 / 60 - (24 * daysRound); 
		var hoursRound = Math.floor(hours);
		// hours = dday까지남은시간
		//console.log("남은시간은 : ", hoursRound);
		var minutes = hour / 60 - (24 * 60 * daysRound) - (60 * hoursRound); 
		var minutesRound = Math.floor(minutes);
		// minutes = dday까지남은분-날짜분단위-시간분단위
		//console.log("남은분은 : ", minutesRound);
		var seconds = hour - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
		var secondsRound = Math.round(seconds);
		//console.log("남은초는: ", secondsRound);
		
		$("#hourCounter").text(hoursRound);
		$("#minuteCounter").text(minutesRound);
		$("#secondCounter").text(secondsRound);
		
		hour--;
		//console.log("남은hour(초)는 :", hour);
		
		if (hour == 1800) {
			alert("30분 경과하였습니다.");
		}
		
		if (hour == 900) {
			alert("15분 남았습니다.");
		}
		
		if (hour == 300) {
			alert("5분 남았습니다. 5분 후 자동제출됩니다.");
		}
		
		// 시간땡하면 제출
		if (hour == 0) {
			// 제출될 함수 실행
		} else {
			// 카운트다운 계속 실행
			window.setTimeout("getCountDown()", 1000);
		}
	}
	getCountDown()
	
	// 툴팁
	$('[data-toggle="tooltip"]').tooltip()

	// 스크롤스파이
	$(".question-group").click(function() {
		var targetId = $(this).attr("data-target");
		var $target = $(targetId);
		
		if (!$target.hasClass('top')) {
			var scrollPosition = $target.offset().top + $(".test-main").scrollTop();
			// $(".test-main").scrollTop()은 현재 스크롤이 있는 위치에서 맨 위까지의 거리이다.
			// $target.offset().top은 우리가 가고자 하는 스크롤위치부터 화면 위까지의 거리?
			
			$(".test-main").animate({
		        scrollTop: scrollPosition - 140
		    }, 500);
			
			$("p[id^=group]").removeClass('top');
			$target.addClass('top');
		}
	});
	
	/*
	
	정답체크 : 1.background-color: lightgrey; 2.(답안체크현황)문제번호 붉은색 3.선택지 ★로 바꾸기
	정답체크 : Ajax로 돌린 데이터 중 정답지에 active 클래스를 주기 --> 그 번호 받아서 답안체크현황 span 찾아서 별표시, 그 tr찾아서 붉은색 표시
	--> 해당 문제의 나머지 번호의 active 지우기
	--> 해당 문제의 답안체크현황 찾아서(별은 항상 hidden으로 해놓고 보였다 안보였다 하기?)
	
	data-selected="active"
	
	*/
	
	// 선택지 클릭
	var answerArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	$("#test-main").on('click', ".each-answer", function(event) {
		
		var answerNo = $(this).data("answerno");
		
		// background-color손보기, 답안번호붉은색
		$(this).css("background-color", 'lightgrey');
		$(this).parent().siblings().find('span').css("background-color", '');

		var questNo = $(this).data("no");
		//console.log("문제번호가져왔나? : ", questNo);
		//var $answerNo = $("#test-answer tbody").find(".answer-no:eq(" + (questNo-1) + ")");
		//$answerNo.attr('style', 'color:red; font-weight: bolder;');
		
		// 답지표시
		
		var row = "";
		row += "<span> &#9312; </span>";
		row += "<span> &#9313; </span>";
		row += "<span> &#9314; </span>";
		row += "<span> &#9315; </span>";
		row += "<span> &#9316; </span>";
		
		var rowWithText = "";
		rowWithText += "<span> &#9312; </span>";
		rowWithText += "<span> &#9313; </span>";
		rowWithText += "<span> &#9314; </span>";
		rowWithText += "<span> &#9315; </span>";
		rowWithText += "<span> &#9316; </span>";
		rowWithText += "<span class='pull-right' style='color: red; font-weight: bolder;''>재 검 토</span>"

		var spanLength = $(".question-group").find("td:eq(1)").find("p").eq(questNo-1).find("span").length;
		
		if (spanLength == 5) {
			$(".question-group").find("td:eq(1)").find("p").eq(questNo-1).empty();
			$(".question-group").find("td:eq(1)").find("p").eq(questNo-1).append(row); 
		} else {
			$(".question-group").find("td:eq(1)").find("p").eq(questNo-1).empty();
			$(".question-group").find("td:eq(1)").find("p").eq(questNo-1).append(rowWithText); 
		}
		
		
		$(".question-group").find("td:eq(1)").find("p").eq(questNo-1).find("span:eq(" + (answerNo-1) + ")").empty().text("★");
		//console.log("✔⬤⭕")
		$(".question-group").find("td:eq(1)").find("p").eq(questNo-1).find("span:eq(" + (answerNo-1) + ")").attr("data-selected", "selected");
		$(".question-group").find("td:eq(1)").find("p").eq(questNo-1).find("span:not(:eq(" + (answerNo-1) + "))").attr("data-selected", '');
		
		var $selectedAnswer = $(".question-group").find("td:eq(1)").find("p").eq(questNo-1).find("[data-selected='selected']");
		var answerNo = $selectedAnswer.index();
		//console.log("찍은답의index+1", answerNo+1);
		
		answerArray[questNo-1] = answerNo+1;
		//console.log("정답배열출력!", answerArray);
	});
	
	// 재검토
	$("#test-main").on('click', '.recheck', function() {
		var btnNo = $(this).data("btnno");
		//console.log("누른 버튼 문제번호는 : ", btnNo);
		var $answerNo = $("#test-answer tbody").find(".answer-no:eq(" + (btnNo-1) + ")").parent();
		$answerNo.attr('style', 'background-color: #ffecb3;');
		
		// 재검토 필요 (문제번호 옆에:붉은색으로) , 답체크현황에 background-color : 색깔주고, 재검토 추가하기
		// after로 선택된 span태그 뒤에 추가하기
		var text = "<span class='pull-right' style='color: red; font-weight: bolder;''>재 검 토</span>"
		$(".question-group").find("td:eq(1)").find("p").eq(btnNo-1).append(text);
	});
	
	// 우클릭, 드래그 방지
	function blockRightClick() {
		alert("오른쪽 버튼을 사용할 수 없습니다.");
		return false;
	}
	
	function blockSelect() {
		alert("드래그할 수 없습니다.");
		return false;
	}
	
	// 새로고침 방지
	function blockRefresh() {
		if(event.keyCode == 116) { // F5키
			event.keyCode = 0;
			alert("새로고침할 수 없습니다.");
			return false;
		} else if ((event.keyCode == 78) && (event.ctrlKey == true)) { // ctrl+n키
			event.keyCode = 0;
			alert("새로고침할 수 없습니다.");
			return false;
		}
	}
	document.onkeydown = blockRefresh;
	
	$("#btn-test-submit").on('click', function() {
		// p를 다 찾았다 --> 그 중 자식이 data-selected:selected를 가지고있지 않은 것 선택
		//var notSelected = $(".question-group").find("td:eq(1)").find("p").has("span[data-selected='selected']");
		var notSelected = $(".question-group").find("td:eq(1)").find("p").not("p:has(span[data-selected='selected'])");
		//console.log("선택되지않은행찾을수있나?:", notSelected);
		
		if (notSelected.length == 0) {
			$("#testSubmitModal").modal('show')
		} else {
			$("#testUncheckModal").modal('show')
		}
	});
	
	$(".modal").on('click', '.btn-final-submit', function() {
		var testInfoNo = 33338;
		
		$.getJSON("/student/exam/finishExam.hta", {testInfoNo:testInfoNo, answerArray:answerArray}, function(result) {
			var testStatus = result.testStatus;
			//console.log("json응답의 status응답은 : ", testStatus);
			
			if (testStatus == "success") {
				alert("시험 응시가 완료되었습니다.");
				//window.opener.top.location.reload();
				var requestValue = "examStatus=complete";
				window.opener.top.location.href="/student/exam/examMain.hta?" + requestValue;
				window.close();
			} else {
				alert("시험 응시에 오류가 있습니다. 관리자에게 문의하세요.");
				var requestValue = "examStatus=failure";
				window.opener.top.location.href="/student/exam/examMain.hta?" + requestValue;
				window.close();
			}
		});
	});
	
	// 제출취소 클릭시 풀지않은문제 하이라이팅
	$("#testUncheckModal").on('click', "#find-uncheck", function() { 
		$(".question-group").find("td:eq(1)").find("p").not("p:has(span[data-selected='selected'])").css("background-color", 'firebrick');
	});
</script>
</html>