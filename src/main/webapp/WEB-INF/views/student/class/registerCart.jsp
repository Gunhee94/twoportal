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
		#timetable {
			table-layout: fixed;
			width: 880px;
			height: 730px;
		}
		.search-table-row:hover {
			background-color: lightgrey;
		}
	</style>
</head>
<body onload="onloadCartPage()">
<%@include file="../../common/navheader.jsp" %>
<div class="container-fluid">
	<div class="row">
	<div class="col-sm-2">
		<%@include file="../../common/navleft.jsp" %>
	</div>
		<div class="col-sm-10">
			<div class="row"> 
				<div class="col-sm-5">
					<div class="page-header">
						<h2>수강신청 장바구니 담기</h2> 
					</div>	
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title text-center">
								<strong>필독공지사항</strong>
							</h3>
						</div>
						<div class="panel-body">
							<p> 1. 수강신청 장바구니 시행 기간 : [2020년] 1월 1일(수) ~ 1월 일(금) [3일간 10:00~17:00까지]</p>
							<p> 2. 수강신청 장바구니 대상 : 2020학년도 1학기 재학생 대상 (2020학년도 1학기 복학예정자 포함)</p>
							<p> 3. 수강신청 장바구니 가능 학점 : 16학번 이후 21학점, 15학번 이전 23학점 (3학점 초과 반영)</p>
							<p> 4. 수업 시간 중복 허용, 주.야 교차 수강 불허</p>
						</div>
					</div>
					<form class="form-inline">
						<table class="table table-bordered" id="search-box">
							<thead>
								<tr>
									<th>
										<label class="radio-inline">
											<input type="radio" name="ismajor" value="전체" checked> 전체
										</label>
										<label class="radio-inline">
											<input type="radio" name="ismajor" value="전공"> 전공
										</label>
										<label class="radio-inline">
											<input type="radio" name="ismajor" value="교양"> 교양
										</label>
									</th>
									<th>학과선택</th>
									<th>
										<select name="dept" id="class-dept">
											<c:forEach var="department" items="${departments}">
												<option value="${department.no}">${department.name}</option>
											</c:forEach>
										</select>
									</th>
									<th>학년선택</th>
									<th>
										<select name="year" id="class-year">
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</select>
										<button type="button" class="btn btn-primary btn-xs pull-right" id="btn-search-lectures">검색</button>
									</th>
								</tr>
							</thead>
						</table>
					</form>
					<form class="form-inline">
						<table class="table table-bordered text-center" id="search-table">
							<colgroup>
								<col width="8%">
								<col width="8%">
								<col width="*%">
								<col width="15%">
								<col width="8%">
								<col width="10%"> 
								<col width="25%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">선택</th>
									<th class="text-center">이수</th>
									<th class="text-center">강의명</th>
									<th class="text-center">담당교수</th>
									<th class="text-center">학점</th>
									<th class="text-center">인원</th>
									<th class="text-center">강의</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="7"><pre class="text-center"><strong>선택사항 선택 후 검색버튼을 누르세요.</strong></pre></td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="page-header">
						<h3>나의 장바구니</h3>
					</div>	
					<div class="panel panel-default">
						<div class="panel-heading text-center">
							<strong>신청과목수 : </strong> 3과목 <strong>신청학점  : </strong> 7학점
						</div>
					</div>						
					<form class="form-inline">
						<table class="table table-bordered text-center" id="cart-table">
							<colgroup>
								<col width="8%">
								<col width="8%">
								<col width="*%">
								<col width="15%">
								<col width="8%">
								<col width="10%">
								<col width="25%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">선택</th>
									<th class="text-center">이수</th>
									<th class="text-center">강의명</th>
									<th class="text-center">담당교수</th>
									<th class="text-center">학점</th>
									<th class="text-center">인원</th>
									<th class="text-center">강의</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty cartList}">
									<tr id="tr-cart-empty">
										<td colspan="7" id="td-list-empty"><pre class="text-center"><strong>장바구니 목록이 비어있습니다.</strong></pre></td>
									</tr>								
								</c:if>
								<c:forEach var="cartItem" items="${cartList}">
									<tr>
										<td>
											<button type="button" id="btn-lectno-${cartItem.lectNo}" class="btn btn-danger btn-xs btn-remove-cart text-center" data-lectno="${cartItem.lectNo}">삭제</button>
										</td>
										<td>${cartItem.major}</td>
										<td>${cartItem.subName}</td>
										<td>${cartItem.proName}</td>
										<td>${cartItem.credit}</td>
										<td>${cartItem.totalNumber}/20</td>
										<td>
										<c:forEach var="timeTables" items="${cartItem.timeTables}">
											<span class='label label-default'>${timeTables.lectDay}:${timeTables.firstPeriod},${timeTables.secondPeriod},${timeTables.thirdPeriod}</span>
										</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- <button type="button" class="btn btn-danger btn-block text-center">바 로 신 청</button> -->
					</form>
				</div>
				<div class="col-sm-7">
					<div class="page-header">
						<h2>장바구니 시간표 출력 부분</h2>
					</div>
					<table class="table table-bordered" id="timetable" style="text-align: center;">
						<colgroup>
							<col width="10%">
							<col width="18%">
							<col width="18%">
							<col width="18%">
							<col width="18%">
							<col width="18%">
						</colgroup>
						<tr> 
							<th class="text-center col-sm-">구분</th>
							<th class="text-center">월</th>
							<th class="text-center">화</th>
							<th class="text-center">수</th>
							<th class="text-center">목</th>
							<th class="text-center">금</th>
						</tr>
						<tr>
							<td>1</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td>
							
							</td>
							<td>
							
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td>5</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
						
							</td>
						</tr>
						<tr>
							<td>6</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td>7</td>
							<td>
							
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td>8</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
							
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td>9</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

	// 페이지 처음 로딩시
	function onloadCartPage() {

		$.getJSON("/student/class/onloadCartList.hta", function(result) {
			//console.log("응답받은 데이터는", result);
			
			// 결과를 하나씩 돈다.
			$.each(result, function(index, item) {
				//console.log("each아이템은? : ", item);
				var subName = item.subName;
				
				$.each(item.timeTables, function(index, timetable) {
					//console.log("each내의 timeTables는 : ", timetable);
					var day = timetable.lectDay;
					//console.log("day를 찍어보자 : ", day);
					var first = parseInt(timetable.firstPeriod);
					//console.log("first에 담긴 것은 : ", first);
					var second = parseInt(timetable.secondPeriod);
					//console.log("second에 담긴 것은 : ", second);
					var third = parseInt(timetable.thirdPeriod);
					//console.log("third에 담긴 것은 : ", third);
				
					var dayToNum = 0;
					if (day == '월') {
						dayToNum = 1;
					} else if (day == '화') {
						dayToNum = 2;
					} else if (day == '수') {
						dayToNum = 3;
					} else if (day == '목') {
						dayToNum = 4;
					} else if (day == '금') {
						dayToNum = 5;
					}
					
					var styles = ["LightSalmon", "LightPink", "LightYellow", 'Khaki', 'MistyRose', 'Tan', 'DarkSeaGreen', 'LightCyan', 'Gainsboro', 'Lavender', 'LavenderBlush', 'SkyBlue', "Linen", "PaleGoldenrod", "PaleGreen", "PowderBlue", "Wheat", "Cornsilk", "BurlyWood"]
					var colorIndex = (Math.trunc(Math.random()*1000))%11;
					
					//var test = $("#timetable tr:eq(" + first + ") td:eq(" + dayToNum + ")")
					//console.log("test나오나?:", test);
					
					$("#timetable tr:eq(" + first + ") td:eq(" + dayToNum + ")").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
					$("#timetable tr:eq(" + second + ") td:eq(" + dayToNum + ")").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
					$("#timetable tr:eq(" + third + ") td:eq(" + dayToNum + ")").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
				})
			})
		});
	}
	// 검색버튼 클릭시
	$("#btn-search-lectures").click(function(event) {
		event.preventDefault();
	
		var dept = $("#class-dept").val();
		var year = $("#class-year").val();
		var ismajor = $("input:radio[name='ismajor']:checked").val();
		
		var $tbody = $("#search-table tbody").empty();
		
		$.getJSON("/student/class/registerCartList.hta", {dept:dept, year:year, ismajor:ismajor}, function(result) {
			//console.log("결과값 result는 : ", result);
			
			var row = "";
			if (result.length == 0) {    
				row += "<tr>";
				row += "<td colspan='7' class='text-center'><strong>해당 조건의 검색 결과가 없습니다.</strong></td>";
				row += "</tr>";
			} else {
				$.each(result, function(index, item) {
					row += "<tr id='lectno-" +item.lectNo+ "' class='search-table-row'>";
					
					if (item.existInCart == null) { // 장바구니에 담겨있으면 버튼을 disabled, 아니면 활성화
						row += "<td><button type='button' class='btn btn-primary btn-xs text-center btn-add-cart' data-lectno='" + item.lectNo + "' id='btn-lect-" + item.lectNo + "'>담기</button></td>";
					} else {
						row += "<td><button type='button' class='btn btn-primary btn-xs text-center disabled btn-add-cart' data-lectno='" + item.lectNo + "' id='btn-lect-" + item.lectNo + "'>담기</button></td>";
					}
					row += "<td>" + item.major + "</td>";
					row += "<td>" + item.subName + "</td>";
					row += "<td>" + item.proName + "</td>";
					row += "<td>" + item.credit + "</td>";
					row += "<td>" + item.totalNumber + "/20</td>";
					row += "<td>";
					$.each(item.timeTableList, function(index, item) {
						row += "<span class='label label-default'>"+item+"</span> "
					})
					row += "</td>";
					row += "</tr>";
				});
			};
			$tbody.append(row);
		});
	});
	
	// 담기 버튼 클릭시 : 장바구니에 담기고(DB), 아래 장바구니목록에 추가되고, 담기버튼이 비활성화되고, 테이블에 표시된다. (마우스오버는 따로)
	$("#search-table").on('click', '.btn-add-cart', function() {
		
		var lectNo = $(this).data("lectno");
		var $row = $("#lectno-" + lectNo).clone();
		//console.log("복사된row는 : ", $row);
		
		//console.log("담기버튼클릭발생한 버튼번호는 : ", lectNo); 
		// 정상 --> 삭제버튼 번호가 다 동일해진다. // 버튼에 아이디가 제대로 안들어가는듯하당.. // 삭제버튼눌러도 lectNo가 제대로 전달되지않는다.
		
		// active인게 발견되면  종료 : DB에 담지도 않아야 하고 튕겨야한다. "같은 시간에 넣을 수 없습니다." 출력하기
		// active --> 복사된 row의 화:6,9,7 화:1,2,3 찾아서 하나라도 active가 있으면 튕겨내기.
		
		// lecture_time 객체가 여러개일 때를 대비해 하나씩 돈다.
		var isExist = false;
		$row.find("td:last span").each(function(index, item) {
			
			var timeTable = $(item).text();
			var day = timeTable.substr(0, 1); // 요일(하나)
			var times = timeTable.substr(2).split(","); // 시간배열

			var dayToNum = 0;
			if (day == '월') {
				dayToNum = 1;
			} else if (day == '화') {
				dayToNum = 2;
			} else if (day == '수') {
				dayToNum = 3;
			} else if (day == '목') {
				dayToNum = 4;
			} else if (day == '금') {
				dayToNum = 5;
			}
			//console.log("요일을 숫자로 바꾼 변수에 들어있는 값은 : ", dayToNum);
			
			// 요일에 해당하는 시간 td 찾아서 active인지 검사하고 아니면 return
			// 시간배열에서 하나 빼서 비교하여 돌림
			$.each(times, function(no, time) {				
				//해당 요일의 해당 교시가 active이면 alert and return
				var status = $("#timetable tr:eq(" + parseInt(time) + ") td:eq(" + dayToNum + ")").data("status");
				// console.log("active인가요 아닌가요? : ", status);
				if (status == 'active') {
					isExist = true;
				}
			})
		})
		
		if (isExist) {
			alert("선택한 시간에 이미 강의가 존재합니다. 강의 시간을 확인하세요.");
			return;
		}
		
		$.getJSON("/student/class/insertOneLectureToCart.hta", {lectNo:lectNo}, function(result) {
		
			var status = result.status;
			
			if (status == 'success') {    
				var subName = $row.find("td:eq(2)").text();
				//console.log("복사된 row는", row);
				$("#tr-cart-empty").remove();
				$("#cart-table tbody").append($row);
				//console.log("부착될 row는 : ", row);
				// 정확한 버튼을 찾아서 그 버튼의 값만 변경해주어야 한다.
				
				var styles = ["LightSalmon", "LightPink", "LightYellow", 'Khaki', 'MistyRose', 'Tan', 'DarkSeaGreen', 'LightCyan', 'Gainsboro', 'Lavender', 'LavenderBlush', 'SkyBlue', "Linen", "PaleGoldenrod", "PaleGreen", "PowderBlue", "Wheat", "Cornsilk", "BurlyWood"]
				var colorIndex = (Math.trunc(Math.random()*1000))%11;

				$row.find("td:last span").each(function(index, item) {
					
					var timeTable = $(item).text();
					var day = timeTable.substr(0, 1);
					var times = timeTable.substr(2).split(",");
					
					$.each(times, function(no, time) {
						
						if (day == "월") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(1)").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
						} else if (day == "화") {
							$("#timetable tr:eq("+(parseInt(time))+") td:eq(2)").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
						} else if (day == "수") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(3)").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
						} else if (day == "목") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(4)").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
						} else if (day == "금") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(5)").css('background-color', styles[colorIndex]).text(subName).attr("data-status", "active");
						} 
					})					
				})
				//$("#cart-table tbody tr").find("td:eq(0):not('#td-list-empty')").html("<button type='button' id='btn-lectno-" + lectNo + "' class='btn btn-danger btn-remove-cart btn-xs text-center' data-lectno='" + lectNo + "'>삭제</button>");
				$("#cart-table tbody tr").find("button").removeClass("btn-primary").addClass("btn-danger");
				$("#cart-table tbody tr").find("button").text("삭제");
				$("#cart-table tbody tr").find("button").removeClass("btn-add-cart").addClass("btn-remove-cart");
				$("#cart-table tbody tr").find("#btn-lect-" + lectNo).attr("id", "btn-lectno-" + lectNo);
				//console.log("삭제버튼들어가는lectNo : ", lectNo);
				
				$("#search-table tbody").find("#btn-lect-" + lectNo).addClass("disabled");
			} else {
				alert("정상적으로 처리되지 않았습니다.");
			}
		});
	});
	
	// 삭제버튼 클릭시 : 장바구니지우고(DB), 장바구니목록에서 삭제하고, 담기버튼 활성화하고, 테이블에서 삭제된다. (마우스오버는 따로)
	$("#cart-table").on('click', '.btn-remove-cart', function() {
		//console.log("버튼이 눌립니다.");		
		var lectNo = $(this).data("lectno");
		//console.log("lectNo는 : ", lectNo);
		
		$.getJSON("/student/class/deleteOneLectureFromCart.hta", {lectNo:lectNo}, function(result) {
			
			var status = result.deleteCartStatus;
			//console.log("status는 : ", status);
			
			if (status == 'success') {    
				// 해당 테이블의 정보 찾아서 1.active삭제 2.배경화면투명 3.text삭제
				var $currentTr = $("#btn-lectno-" + lectNo).closest("tr");
				console.log("삭제버튼누른행은?: ", $currentTr);
				
				$currentTr.find("td:last span").each(function(index, item) {
					
					var timeTable = $(item).text();
					var day = timeTable.substr(0, 1);
					var times = timeTable.substr(2).split(",");
					
					$.each(times, function(no, time) {
						
						if (day == "월") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(1)").css('background-color', 'white').text("").attr("data-status", "inactive");
						} else if (day == "화") {
							$("#timetable tr:eq("+(parseInt(time))+") td:eq(2)").css('background-color', 'white').text("").attr("data-status", "inactive");
						} else if (day == "수") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(3)").css('background-color', 'white').text("").attr("data-status", "inactive");
						} else if (day == "목") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(4)").css('background-color', 'white').text("").attr("data-status", "inactive");
						} else if (day == "금") {
							$("#timetable  tr:eq("+(parseInt(time))+") td:eq(5)").css('background-color', 'white').text("").attr("data-status", "inactive");
						} 
					});
				});
				
				$("#btn-lectno-" + lectNo).closest("tr").remove();
				$("#search-table tbody").find("#btn-lect-" + lectNo).removeClass("disabled");
				//console.log("삭제버튼클릭시 lectNo", lectNo);
				
			} else {
				alert("정상적으로 처리되지 않았습니다.");
			}
		})
	});
	
	
	// 마우스오버시
	$("#search-table").on("mouseenter", ".search-table-row", function() {
		console.log("마우스엔터")
	});
	
	$("#search-table").on("mouseleave", ".search-table-row", function() {
		console.log("마우스아웃")
	});

	
</script>
</html>