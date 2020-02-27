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
	<div class="container-fluid"> 
		<%@include file="../../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp"%>		
			</div>
			<div class="col-sm-10">
				<div class="" style="margin-bottom:30px;">
					<h4>글 수정하기 </h4>
				</div>
				
			<form action="/staff/boardUpdate.hta" method="post" id="" enctype="multipart/form-data">
				<c:if test="${loginInfo.job == 'staff'}">
					<input type="hidden" value="${loginInfo.staff.no }" name="staffNo" id="staff-No">							
				</c:if>
				<c:if test="${loginInfo.job == 'professor'}">
					<input type="hidden" value="${loginInfo.professor.no }" name="proNo" id="pro-No">							
				</c:if>
				<c:if test="${loginInfo.job == 'student'}">
					<input type="hidden" value="${loginInfo.student.no }" name="stuNo" id="stu-No">							
				</c:if>
				
       				<div class="form-group">
             			<label>제목</label>
           				<input type="text" class="form-control" id="title" name="title" placeholder="제목을 작성해주세요." value="${update.title }">
          			</div>
        			<div>
        				<label>비밀번호</label>
        				<input type="password" class="form-control" name="pwd" id="pwd">
        			</div>
         			<div class="form-group">
            			<label>내용</label>
            			<textarea class="form-control" name="content" rows="10" id="content"></textarea>
         	 		</div>
         	 		<div>
         	 			파일 올리기 : <input type="file" id="file-upload" multiple="multiple" name="BoardImageName">
         	 		</div>
         	 		<div style="margin-top:30px;">
	        			<button type="submit" class="btn btn-info" >등록하기</button>
	        			<button type="button" class="btn btn-secondary">목록으로</button>         	 		
         	 		</div>
    		</form>
			</div>
		</div>

	</div>
</body>
	<script type="text/javascript">

	</script>
</html>