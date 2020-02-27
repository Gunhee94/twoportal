<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid" style="margin-bottom:300px;"> 
		<%@include file="../../common/navheader.jsp" %>  
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp" %>
			</div>
			<div class="col-sm-10">
				<div class="page-header" style="margin-top: 0px;">
					<h4>강의 신청 목록</h4>
				</div>
				
				<div class="row">
					<div class="col-sm-12">
						<table class="table" id="apply-list">
							<colgroup>
								<col width="8%" />
								<col width="5%" />
								<col width="10%" />
								<col width="5%" />
								<col width="10%" />
								<col width="8%" />
								<col width="8%" />
								<col width="8%" />
								<col width="18%" />
								<col width="15%" />
							</colgroup>
							<thead>
			        			<tr>     
			        				<th>개설년도</th>
			        				<th>학기</th>
			        				<th>학과</th>  
			        				<th>학년</th>
			        				<th>과목명</th>    
			        				<th>전공/교양</th>
			        				<th>강의관</th>
			        				<th>강의실</th>
			        				<th>강의시간</th>
			        				<th>강의상태</th>
			        			</tr>
			        		</thead>
			        		<tbody>
			        			<tr>
			        				<c:choose>
			        					<c:when test="${empty result}">
			        						<td colspan="10"></td>
			        					</c:when>
			        					<c:otherwise>
			        						<c:forEach items="${result }" var="lecture">
			        							<tr>
				        							<td><fmt:formatDate value="${lecture.lectureCreateDate }" pattern="yyyy" /></td>
				        							<td>${lecture.lectSemester }</td>
				        							<td>${lecture.deptName }</td>
				        							<td>${lecture.targetYear }</td>
				        							<td>${lecture.subjectName }</td>
				        							<td>${lecture.subjectMajor }</td>
				        							<td>${lecture.lectPlace }</td>
				        							<td>${lecture.lectureRoom } 호</td>
				        							<td>${lecture.time}</td>
				        							<td>  
							        					<button type="button" id="allowLecture" class="btn btn-primary" data-lect-ok="${lecture.lectNo}">수락</button>
							        					<button type="button" id="refuseLecture" class="btn btn-default" data-lect-no="${lecture.lectNo}">거절</button>
							        				</td>
						        				</tr>
			        						</c:forEach>
			        					</c:otherwise>
			        				</c:choose>
			        		</tbody>
			        	</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../../common/footer.jsp"%>
	<script type="text/javascript">
		$("#allowLecture").click(function(){
			event.preventDefault();
			
			var lectNo = $("#allowLecture").data("lect-ok");
			
			$.ajax({
				url : "/staff/lectureAllow.hta",
				data : {lectNo : lectNo},
				type : 'get',
				success : function(){
					location.href="/staff/allowLecture.hta"
					alert("수락되었습니다")
				},error : function(){
					alert("수락이 안되었습니다")
				}
			})
		})
		$("#refuseLecture").click(function(){
			event.preventDefault();
			
			var lectNo = $("#refuseLecture").data("lect-no");
			
			$.ajax({
				url : "/staff/refuseLecture.hta",
				data : {lectNo : lectNo},
				type : 'get',
				success : function(){
					location.href="/staff/allowLecture.hta"
					alert("거부하였습니다.")
				},error : function(){
					alert("거부하지 못했습니다")
				}
			})
		})
	</script>
</html>