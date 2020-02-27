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
</head>
<body>
<%@include file="../../common/navheader.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2">
			<%@include file="../../common/navleft.jsp" %>
		</div>
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-11">
					<div class="page-header">
						<h2>수강신청 및 수정/삭제</h2>
					</div>
					<form class="form-inline">
						<table class="table table-bordered">
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
											<option value="0"> -- 선택 -- </option>
											<c:forEach var="department" items="${departments}">
												<option value="${department.no}">${department.name}</option>
											</c:forEach>
										</select>
									</th>
									<th>학년선택</th>
									<th>
										<select name="year" id="class-year">
											<option value="0"> -- 선택 -- </option>
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</select>
										<button type="button" class="btn btn-primary btn-xs pull-right" id="btn-search">검색</button>
									</th>
								</tr>
							</thead>
						</table>
					</form>
					
					<form class="form-inline">
						<table class="table table-bordered text-center" id="register-table">
							<colgroup>
								<col width="6%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="*%">
								<col width="15%">
								<col width="8%">
								<col width="6%">
								<col width="6%">
								<col width="12%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">선택</th>
									<th class="text-center">강의번호</th>
									<th class="text-center">과목번호</th>
									<th class="text-center">학과번호</th>
									<th class="text-center">이수구분</th> 
									<th class="text-center">학점</th>
									<th class="text-center">강의명</th>
									<th class="text-center">강의시간/강의실</th>
									<th class="text-center">담당교수</th>
									<th class="text-center">대상학년</th>
									<th class="text-center">인원</th>
									<th class="text-center">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="12"><pre class="text-center"><strong>선택사항 선택 후 검색버튼을 누르세요.</strong></pre></td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>
					<form class="form-inline">
						<table class="table table-bordered text-center" id="result-table">
							<colgroup>
								<col width="6%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="*%">
								<col width="15%">
								<col width="8%">
								<col width="6%">
								<col width="6%">
								<col width="12%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">선택</th>
									<th class="text-center">강의번호</th>
									<th class="text-center">과목번호</th>
									<th class="text-center">학과번호</th>
									<th class="text-center">이수구분</th>
									<th class="text-center">학점</th>
									<th class="text-center">강의명</th>
									<th class="text-center">강의시간/강의실</th>
									<th class="text-center">담당교수</th>
									<th class="text-center">대상학년</th>
									<th class="text-center">인원</th>
									<th class="text-center">신청일자</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty registeredList}">
									<tr id="tr-list-empty">
										<td colspan="12" id="td-list-empty"><pre class="text-center"><strong>수강신청 목록이 비어있습니다.</strong></pre></td>
									</tr>								
								</c:if>
								<c:forEach var="lecture" items="${registeredList}">
									<tr id="lectno-${lecture.lectNo}">
										<td><button type='button' id='btn-lect-${lecture.lectNo}' class='btn btn-danger btn-xs text-center btn-remove-class' >DELETE</button></td>
										<td>${lecture.lectNo}</td>
										<td>[${lecture.subNo}]</td>
										<td>${lecture.deptNo}</td>
										<td>${lecture.major}</td>
										<td>${lecture.credit}</td>
										<td>${lecture.subName}</td>
										<td>${lecture.place}${lecture.room}호</td>
										<td>${lecture.proName}</td>
										<td>${lecture.targetYear}</td>
										<td>${lecture.totalNumber}</td>
										<td><fmt:formatDate value="${lecture.createDate}" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					
					<!-- 모달창 -->
					<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="myModalLabel"><strong>수강신청 재확인</strong></h4>
								</div>
								<div class="modal-body">
									<table class="table table-bordered text-center">
										<thead>
											<tr>
												<th colspan="2" class="text-center info"><strong>[경영학과]</strong></th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
									<div class="row text-center">
										<h4><strong>위의 사항을 모두 확인하고 수강신청 합니다.</strong></h4>
									</div>			
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-danger btn-final-register" data-dismiss="modal">신청하기</button>
								</div>
							</div>
						</div>
					</div>
					
					<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="myModalLabel"><strong>수강 삭제 확인</strong></h4>
								</div>
								<div class="modal-body"></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-danger btn-final-delete" data-dismiss="modal">삭제하기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-danger">
						<div class="panel-heading text-center">
							<strong>[ 신청과목수 : <span id="subCount">${subCntAndCreditCnt.subCount}</span> 신청학점  : <span id="creditCount">${subCntAndCreditCnt.creditCount}</span> ]</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	// 검색버튼 클릭
	$("#btn-search").click(function(event) {
		event.preventDefault();
	
		var dept = $("#class-dept").val();
		
		if (dept == 0) {
			alert("학과를 선택하세요.");
			return;
		}
	
		var year = $("#class-year").val();
		
		if (year == 0) {
			alert("학년을 선택하세요.");
			return;
		}
		
		var $tbody = $("#register-table tbody").empty();
		  
		var dept = $("#class-dept").val();
		var year = $("#class-year").val();
		var ismajor = $("input:radio[name='ismajor']:checked").val();
		
		// console.log(year);
		// console.log(dept);
		// console.log(ismajor);
		
		$.getJSON("/student/class/registerList.hta", {dept:dept, year:year, ismajor:ismajor}, function(result) {
			
			console.log("결과 : ",result);
			
			var row = "";  
			if (result.length == 0) {    
				row += "<tr>";
				row += "<td colspan='12' class='text-center'><strong>해당 조건의 검색 결과가 없습니다.</strong></td>";
				row += "</tr>";
			} else {
				$.each(result, function(index, item) {
					row += "<tr id='lectno-" + item.lectNo + "'>";
					if (item.registeredLectNo == null) { // 이미 신청한 강의면 버튼을 disabled, 아니면 활성화
						row += "<td><button type='button' id='btn-lect-" + item.lectNo + "' class='btn btn-success btn-xs text-center btn-add-class'>REGISTER</button></td>";
					} else {
						row += "<td><button type='button' id='btn-lect-" + item.lectNo + "' class='btn btn-success btn-xs text-center btn-add-class disabled'>REGISTER</button></td>";
					}
					row += "<td>" + item.lectNo + "</td>";   
					row += "<td id='subno-" + item.lectNo + "'>" + '[' + item.subNo + ']' + "</td>";   
					row += "<td>" + item.deptNo + "</td>";   
					row += "<td>" + item.major + "</td>";
					row += "<td>" + item.credit + "</td>";
					row += "<td id='subname-" + item.lectNo + "'>" + item.subName + "</td>";
					row += "<td>" + item.place + item.room + '호' + "</td>";
					row += "<td id='proname-" + item.lectNo + "'>" + item.proName + "</td>";
					row += "<td>" + item.targetYear + "</td>";
					row += "<td>" + item.totalNumber + "/20</td>";
					row += "<td></td>";
					row += "</tr>";
				});
			};
			$tbody.append(row);
		});
	});
	
	// 모달창의 신청하기 버튼 클릭시
	$("#registerModal").on('click', '.btn-final-register', function() {
		//console.log("버튼이 눌려집니다");
		
		var lectNo = $(this).parents().find("#lect-no").text();
		//console.log("강의번호는", lectNo);
		
		$.getJSON("/student/class/registerOneLecture.hta", {lectNo:lectNo}, function(result) {
		
			var status = result.status;
			
			if (status == 'success') {    
				var row = $("#lectno-" + lectNo).clone();
				//console.log("복사된 row는", row);
				$("#tr-list-empty").remove();
				$("#result-table tbody").append(row);
				$("#result-table tbody tr").find("td:eq(0):not('#td-list-empty')").html("<button type='button' class='btn btn-danger btn-xs text-center btn-remove-class'>DELETE</button>");
				$("#result-table tbody tr:last-child").find("td:last-child").html("<td class=''><strong>신규</strong></td>");
				
				var creditCount = result.countsInRegister.creditCount + 3
				var subCount = result.countsInRegister.subCount + 1
				//console.log("결과서브카운트는", subCount);
				
				$("#subCount").empty().append(subCount);
				$("#creditCount").empty().append(creditCount);
				
				$("#register-table tbody").find("#btn-lect-" + lectNo).addClass("disabled");
			} else {
				alert("정상적으로 처리되지 않았습니다.");
			}
			 
		});
	});
		
	// REGISTER버튼 클릭시 모달창에 해당 행의 데이터 띄우기
	$("#register-table tbody").on('click', '.btn-add-class', function() { 
		
		var lectNo = $(this).parent().next().text();
		//console.log("고유번호는: ", lectNo);
		
		var subNo = $("#subno-" + lectNo).text();
		var subName = $("#subname-" + lectNo).text();
		var proName = $("#proname-" + lectNo).text();
		//console.log("학과번호는 : ", subNo);
		//console.log("강의명은: ", subName);
		
		// 학과 가져오기
		var deptName = $("#class-dept option:selected").text();
		//console.log("학과이름은 :", deptName);
		
		var $table = $("#registerModal table").empty();
		
		var row = "";
		row += "<thead>";
		row += "<tr>";
		row += "<th colspan='2' class='text-center info'><strong>[" + deptName + "]</strong></th>";
		row += "</tr>";
		row += "</thead>";
		row += "<tbody>";
		row += "<tr>";
		row += "<td><strong>강의번호</strong></td>";   
		row += "<td id='lect-no'>" + lectNo + "</td>";
		row += "</tr>";
		row += "<tr>";
		row += "<td><strong>과목번호</strong></td>";   
		row += "<td>" + subNo + "</td>";
		row += "</tr>";
		row += "<tr>";
		row += "<td><strong>강의명</strong></td>";   
		row += "<td>" + subName + "</td>";
		row += "</tr>";
		row += "<tr>";
		row += "<td><strong>담당교수</strong></td>";   
		row += "<td>" + proName + "</td>";
		row += "</tr>";
		row += "</tbody>";
		
		$table.append(row);
		
		$("#registerModal").modal('show')
	});
	
	// DELETE버튼 클릭시 띄워질 모달창
	$("#result-table tbody").on('click', '.btn-remove-class', function() {
		
		// console.log("버튼클릭");
		var lectNo = $(this).parent().next().text();
		// console.log("고유번호", lectNo);
		
		var $modalBody = $("#deleteModal .modal-body").empty();

		var row = "";

		row += "<table class='table table-bordered text-center'>";
		row += "<tbody>";
		row += "<tr>";
		row += "<td>강의번호</td>";
		row += "<td id='delete-lect-no'>" + lectNo + "</td>";
		row += "</tr>";
		row += "</tbody>";
		row += "</table>";
		row += "<div class='row text-center'>";
		row += "<h4 style='color: red'><strong>수강신청 내역을 삭제 합니다.</strong></h4>";
		row += "</div>";
		
		$modalBody.append(row);
		
		$("#deleteModal").modal("show");
	});
	

	// 모달창의 삭제하기 버튼 클릭시
	$("#deleteModal").on('click', '.btn-final-delete', function() {
		var lectNo = $(this).parent().prev().find("#delete-lect-no").text();
				
		$.getJSON("/student/class/deleteOneLecture.hta", {lectNo:lectNo}, function(result) {
			var deleteStatus = result.deleteStatus;
			
			if (deleteStatus == 'success') {
				$("#result-table tbody").find("#lectno-" + lectNo).remove();
				
				var creditCount = result.countsInDelete.creditCount -3;
				var subCount = result.countsInDelete.subCount -1;
				//console.log("결과서브카운트는", subCount);
				//console.log("결과크레딧카운트는", creditCount);
				
				$("#subCount").empty().append(subCount);
				$("#creditCount").empty().append(creditCount);
				
				$("#register-table tbody").find("#btn-lect-" + lectNo).removeClass("disabled");
			} else {
				alert("정상적으로 처리되지 않았습니다.");
			}
		});
	});
</script>
</body>
</html>