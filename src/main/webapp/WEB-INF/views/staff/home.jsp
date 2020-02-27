<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">  
	<%@include file="../common/navheader.jsp" %>
	<div class="row" >
		<div class="col-sm-2">
				<%@include file="../common/navleft.jsp"%>		
			</div>
		<div class="col-sm-10" >
			<div class="page-header" style="margin-top: 0px;">
				<h4>교직원 메인페이지</h4>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-info">
						<div class="panel-heading">휴강신청<a class="pull-right"><small> > 자세히보기</small></a></div>
					  	<div class="panel-body">
					  		<table class="table">
					  			<thead>
					  				<tr>
					  					<th>학과</th>
					  					<th>과목명</th>			  					
					  					<th>휴강사유</th>
					  					<th>학점</th>
					  					<th>전공여부</th>
					  					<th></th>
					  				</tr>
					  			</thead>
					  			<tbody>
					  				<tr>
					  					<td>경영학과</td>
					  					<td>경영학개론</td>
					  					<td>경영세미나 참석</td>
					  					<td>3 학점</td>
					  					<td>전공</td>
					  					<td></td>
					  				</tr>
					  			</tbody>
					  		</table>
					  	</div>
					</div>							
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-info">
						<div class="panel-heading">게시판<a class="pull-right"><small> > 자세히보기</small></a></div>
					  	<div class="panel-body">
					  		<table class="table">
						  		<thead>
						  			<tr>
						  				<th>번호</th>
						  				<th>닉네임</th>			  					
						  				<th>제목</th>
						  				<th>작성날짜</th>
						  				<th>조회수</th>
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
		
	<script type="text/javascript">
	
	</script>
	
	</div>
</body>
</html>