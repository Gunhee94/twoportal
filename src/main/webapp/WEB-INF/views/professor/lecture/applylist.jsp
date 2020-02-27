<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>강의개설신청</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style>
		.lgh #period-group {
			display: none;
		}  
		.lgh .lgh-show-hide {
			display: none;
		}
		.lgh #period-group .selected-label {
			color:red;
			font-weight: bolder;
		}
	</style>   
</head>  
<body>  
<div class="container-fluid"> 
	<%@include file="../../common/navheader.jsp" %>  
	<div class="row" >
		<div class="col-sm-2">
			<%@include file="../../common/navleft.jsp" %>
		</div>
		<div class="col-sm-10" >
			<div class="page-header" style="margin-top: 0px;">
				<h4>강의 신청 목록<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#lghModalapply">강의 신청</button></h4>
			</div>
			
			<div class="row lgh">
				<div class="col-sm-12"> 
					<table class="table" id="apply-list">
						<thead>
		        			<tr>     
		        				<th>개설년도</th>
		        				<th>학기</th>
		        				<th>학과</th>  
		        				<th>학년</th>
		        				<th>과목명</th>    
		        				<th>전공/교양</th>
		        				<th>강의관/강의실</th>
		        				<th>강의시간</th>
		        				<th>강의상태</th>
		        				<th></th>
		        			</tr>
		        		</thead>
		        		<tbody>   
		        		<c:choose>
		        			<c:when test="${empty lectures }">
		        				<tr>
	        						<td colspan="10" class="text-center">신청한 강의가 없습니다.</td>
	        					</tr>
		        			</c:when>
		        			<c:otherwise>
		        				<c:forEach var="lect" items="${lectures }">
				        			<tr>
				        				<td><fmt:formatDate value="${lect.lectureCreateDate}" pattern="yyyy"/> </td>
				        				<td>${lect.lectSemester }</td>
				        				<td>${lect.deptName }</td>
				        				<td>${lect.targetYear }</td>
				        				<td><a href="" onclick="clickbox(${lect.lectNo}, event)" >${lect.subjectName }</a></td>
				        				<td>${lect.subjectMajor }</td>
				        				<td>${lect.lectPlace } ${lect.lectureRoom } 호</td>
				        				<td>${lect.time }</td>
				        				<td>${lect.lectStatus }</td>
				        				<c:if test="${lect.lectStatus == '신청' }">
					        				<td><button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#lghModalcancel-${lect.lectNo }" >삭제</button></td> 
				        				</c:if>
				        				<c:if test="${lect.lectStatus != '신청' }">
					        				<td></td> 
				        				</c:if>    
				        			</tr>
				        			<tr id="show-hide-${lect.lectNo }" class="lgh-show-hide">
				        				<td colspan="10" class="well"><strong>강의목적 : </strong> ${lect.subjectObject }</td>
				        			</tr>
	        						<div id="lghModalcancel-${lect.lectNo }" class="modal fade" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
									        		<button type="button" class="close" data-dismiss="modal">&times;</button>
									      		</div>
									      		<div class="modal-body">
									        		<p class="text-center">정말로 <strong>[ ${lect.subjectName } ]</strong> 강의를 삭제하시겠습니까?</p>
									      		</div>
									      		<div class="modal-footer">
										         	<button type="button" class="btn btn-danger btn-sm apply-cancel" data-lect-no="${lect.lectNo }">삭제</button>
										        </div>
									   		</div>   
									  	</div>
									</div>   
									
		        				</c:forEach>        
		        			</c:otherwise>         
		        		</c:choose>
		        		</tbody>
					</table>
					<div class="row text-center">
						<ul class="btn-group pagination">
						    <c:if test="${pageMaker.prev }">
						    <li>
						        <a href='<c:url value="applylist.hta?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left glyphicon glyphicon-chevron-left"></i></a>
						    </li>
						    </c:if>
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li>
						        <a href='<c:url value="applylist.hta?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
						    </li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li>
						        <a href='<c:url value="applylist.hta?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right glyphicon glyphicon-chevron-right"></i></a>
						    </li>
						    </c:if>
						</ul>
					</div>
				</div>
			</div>
			
			<div id="lghModalapply" class="modal fade" role="dialog">
				<div class="modal-dialog modal-lg">  
			    	<div class="modal-content">
			      		<div class="modal-header">
			        		<button type="button" class="close" data-dismiss="modal">&times;</button>
			        		<h4 class="modal-title">강의 신청하기</h4>
			        		
			      		</div>
				      	<div class="modal-body">
							<form class="form-horizontal lgh well" id="apply-apply-form" method="post" action="addlecture.hta">
								
								<div class="form-group">
									<label  class="control-label col-sm-2">강의시작일</label>    
									<div class="col-sm-4">
										<input type="date" class="form-control" name="date" id="lecture-date">
									</div>
									<div class="col-sm-6">
										<p style="margin-top: 10px; margin-bottom: 10px;">(현재 학기 강의만 신청 가능)</p>
									</div>
								</div>   
								<div class="form-group">
									<label class="control-label col-sm-2">대상학과</label> 
									<div class="col-sm-4">   
										<select name="department" class="form-control" id="apply-department">
											<option value="0" selected disabled > -- 선택하세요 --</option>
											<c:forEach var="department" items="${departments }">
												<option value="${department.no}"> ${department.name }</option>
											</c:forEach>
										</select>   
									</div>
									<label class="control-label col-sm-2">대상학년</label> 
									<div class="col-sm-4">   
										<select name="targetYear" class="form-control" id="apply-targetYear">
											<option value="0" selected disabled > -- 선택하세요 --</option>  
											<option value="1" > 1 학년</option>
											<option value="2" > 2 학년</option>
											<option value="3" > 3 학년</option>
											<option value="4" > 4 학년</option>
										</select>   
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">과목명</label> 
									<div class="col-sm-4">   
										<input type="text" class="form-control" name="subname" placeholder="과목명을 입력하세요." id="apply-subname" >
									</div>
									<label class="control-label col-sm-2">이수구분</label>  
									<div class="col-sm-4">   
										<div class="radio radio-inline">
								  			<label><input type="radio" name="credit" checked value="전공">전공</label>
								  		</div>  
								  		<div class="radio radio-inline">  
									  		<label><input type="radio" name="credit" value="교양">교양</label>
									  	</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-sm-2">강의관</label>  
									<div class="col-sm-4">  
										<select name="place" class="form-control" id="apply-place">
											<option value="0" selected disabled > -- 선택하세요 --</option>  
											<option value="탐구관" > 탐구관</option>
											<option value="상상관" > 상상관</option>
											<option value="예술관" > 예술관</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-sm-2">강의실</label>
									
									<div class="col-sm-4"> 
										<select name="room" class="form-control" id="apply-room">
											<option value="0" selected disabled > -- 선택하세요 --</option>  
											<option value="101" > 101 호</option>
											<option value="102" > 102 호</option>
											<option value="103" > 103 호</option>
											<option value="201" > 201 호</option>
											<option value="202" > 202 호</option>
											<option value="203" > 203 호</option>
											<option value="301" > 301 호</option>  
											<option value="302" > 302 호</option>
											<option value="303" > 303 호</option>
										</select>
									</div>
									
								</div>
								
								<div class="form-group">
									<label class="control-label col-sm-2">강의요일</label>
									<div class="col-sm-4"> 
										<select class="form-control" id="apply-day">
											<option value="0" selected disabled > -- 선택하세요 --</option>  
											<option value="월" > 월요일</option>
											<option value="화" > 화요일</option>
											<option value="수" > 수요일</option>
											<option value="목" > 목요일</option>
											<option value="금" > 금요일</option>
										</select>
									</div>
									<button type="button" class="btn btn-default btn-sm" id="apply-get">현재 강의실 조회</button>
								</div>
									
								<div class="form-group" id="period-group">	
									<label class="control-label col-sm-2">교시</label>
									<div class="col-sm-10">
										<label class="checkbox-inline"><input type="checkbox" value="1">1</label>
										<label class="checkbox-inline"><input type="checkbox" value="2">2</label>
										<label class="checkbox-inline"><input type="checkbox" value="3">3</label>
										<label class="checkbox-inline"><input type="checkbox" value="4">4</label>
										<label class="checkbox-inline"><input type="checkbox" value="5">5</label>
										<label class="checkbox-inline"><input type="checkbox" value="6">6</label>
										<label class="checkbox-inline"><input type="checkbox" value="7">7</label>
										<label class="checkbox-inline"><input type="checkbox" value="8">8</label>
										<label class="checkbox-inline"><input type="checkbox" value="9">9</label>
										<button type="button" class="btn btn-info btn-sm" id="apply-period">추가</button>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-2"></div>
									<div class="col-sm-10" id="add-remove-form"></div>
								</div>  
								   
								<div class="form-group" >  
									<label class="control-label col-sm-2">강의목적 </label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="3" cols="12" id="apply-object" style="width: 100%;" name="object"></textarea>
									</div>
								</div>
								
								<div class="form-group">  
									<div class="col-sm-2"></div>
									<div class="col-sm-10"></div>
									<button type="button" class="btn btn-primary btn-block" id="apply-btn-form">신청하기</button>
								</div>
							</form>
						</div>
			    	</div>
			  	</div>    
			</div>
		</div>       
	</div>
		  
</div>

<script type="text/javascript">

	$(".apply-cancel").click(function() {
		var lectNo = $(this).data("lect-no");
		
		$.getJSON("/professor/lecture/applycancel.hta", {lectNo:lectNo}, function(result) {
			window.location.reload();
			
		});
	});
	

	function clickbox(no, e) {
		e.preventDefault();
		
		if (document.querySelector("#show-hide-"+no).style.display === 'none') {
			document.querySelector("#show-hide-"+no).style.display = 'table-row';
			return;
		} else {
			document.querySelector("#show-hide-"+no).style.display = 'none';
			return;
		}
	}

	$("#apply-btn-form").click(function() {
		
		var date = $("#lecture-date").val();
		if (date == 0) {
			alert("강의 시작일을 선택하세요.");
			return;
		}
		
		var dept = $("#apply-department").val();
		if (dept == null) {
			alert("대상학과를 선택하세요.");
			return;
		}
		
		var targetYear = $("#apply-targetYear").val();
		if (targetYear == null) {
			alert("대상학년를 선택하세요.");
			return;
		}
		
		var subname = $("#apply-subname").val();
		if (subname == 0) {
			alert("과목명을 입력하세요.");
			return;
		}
		
		var credit = $("[name='apply-credit']:input:checked").val();
		if (credit == 0) {
			alert("이수구분을 선택하세요.");
			return;
		}
		
		var place = $("#apply-place option:selected").val();
		if (place == 0) {
			alert("강의관을 선택하세요.");
			return;
		}
		
		var room = $("#apply-room option:selected").val();
		if (room == 0) {
			alert("강의실을 선택하세요.");
			return;
		}
		
		if ($("#add-remove-form .lecture-time-add").length == 0) {
			alert("강의요일과 교시를 선택하세요.");
			return;
		}
		
		var object = $("#apply-object").val();
		if (object == 0) {
			alert("강의목적을 입력하세요.");
			return;
		}
		
		$("#apply-apply-form").submit();
		
	});
	
	// 현재 강의실 조회버튼을 누를때 
	$("#apply-get").click(function() {
		
		$("#period-group :checkbox").prop('checked', false);
		$("#period-group :checkbox").prop('disabled', false).closest("label").removeClass('selected-label');
		
		var place = $("#apply-place").val();
		var room = $("#apply-room").val();
		var day = $("#apply-day").val();
		
		if (place == 0) {
			alert("강의관을 선택하세요.");
			return;
		}
		if (room == 0) {
			alert("강의실을 선택하세요.");
			return;
		}
		if (day == 0) {
			alert("강의요일을 선택하세요.");
			return;
		}
		
		$.getJSON("/professor/lecture/apply.hta", {place:place, room:room, day:day}, function(result) {
			
			
			$.each(result, function(index, item) {
				
				var day = item.day;
				var firstPeriod = item.firstPeriod -1;     // 0
				if (firstPeriod >= 0) {
					$("#period-group :checkbox:eq("+firstPeriod+")").prop('disabled', true).closest("label").addClass('selected-label');
				}
				
				var secondPeriod = item.secondPeriod -1;	// 1
				if (secondPeriod >= 0) {
					$("#period-group :checkbox:eq("+secondPeriod+")").prop('disabled', true).closest("label").addClass('selected-label');
				}	
				
				var thirdPeriod = item.thirdPeriod -1;		// 2
				if (thirdPeriod >= 0) {
					$("#period-group :checkbox:eq("+thirdPeriod+")").prop('disabled', true).closest("label").addClass('selected-label');
				}
			});
		});
		
		$("#period-group").show();
		
	});  
	
	// 강의교시 추가를 눌렀을 때
	$("#apply-period").click(function() {
		
		var day = $("#apply-day").val();
		if (day == null) {
			alert("강의요일을 선택하세요.");
			return;  
		}
		  
		var periodArr = [];
		$("#period-group :checkbox:checked").each(function(index, item) {
			periodArr.push($(item).val());
		});
		if (periodArr.length == 0) {
			alert("강의교시를 선택하세요.");
			return;
		}
		if (periodArr.length > 3) {
			alert("강의교시는 최대 3개 선택가능합니다.");
			return;
		}
		
		var inputContent = "";
		inputContent += "<div class='form-inline'>";
		inputContent += "<input type='hidden' class='form-control lecture-time-add' data-day="+day+" data-periodArr="+periodArr+" name='dayandPeriodArr' value='" +day+ "/" +periodArr.join('/')+ "'>";  
		inputContent += "<input type='text' class='form-control lecture-time-add' data-day="+day+" data-periodArr="+periodArr+" disabled value='"+day+" "+periodArr.join()+"'>";         
		inputContent += "<button type='button' class='btn btn-danger btn-sm lecture-time-remove' data-day="+day+">삭제</button>";
		inputContent += "</div>"; 
		
		$("#add-remove-form").append(inputContent);
		
		$("#apply-day option[value='"+day+"']").prop('disabled', true);
		$("#apply-day option[value=0]").prop('selected', true);
		
		
		$("#period-group").css('display', 'none');
	});      
	
	// 삭제버튼을 눌렀을 때 
	$("#add-remove-form").on('click', '.lecture-time-remove', function() {
		var day = $(this).data("day");
		console.log(day);
		
		$("#apply-day option[value='"+day+"']").prop('disabled', false);
		$(this).prev().remove();
		$(this).remove();
	});  
  


</script>
</body> 
</html>  

