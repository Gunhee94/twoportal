<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>교수 관리 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp"%>		
			</div>
			<div class="col-sm-10">

				<div class="row">
					<div class="col-sm-6">
						<p>교수 등록하세요</p>
						<form class="well" method="post" action="addProfessor.hta" 
							enctype="multipart/form-data">
							<div class="form-group">
								<label>증명사진 올리기</label> 
								<input type="file" class="form-control" name="imageName" />
							</div>
							<div class="form-group">
								<label>이름</label> <input type="text" class="form-control" name="name" />
							</div>
							<div class="form-group">
								<label>아이디</label> <input type="text" class="form-control" name="id" />
							</div>
							<div class="form-group">
								<label>비밀번호</label> <input type="password" class="form-control" name="pwd" />
							</div>
							<div class="form-group">
								<label>교수 임용 날짜</label> <input type="date" class="form-control" name="createDate" />
							</div>
							<div class="form-group" id="year">
								<label>학과</label> <select name="deptNo"
									class="form-control" id="student-dept">
									<option value="0" selected="selected">-- 선택 --</option>
									<c:forEach var="department" items="${listDept}">
										<option value="${department.no}">${department.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>직급</label>
									<select class="form-control" id="" name="position">
					      				<option value="전공" selected="selected">교수</option>
					       			 	<option value="교양">부교수</option>
								</select>
							</div>
							<div class="form-group">
								<label>이메일</label> <input type="text" class="form-control" name="email" />
							</div>
							<div class="form-group">
								<label>은행명</label> <input type="text" class="form-control" name="bankName" />
							</div>
							<div class="form-group">
								<label>계좌번호</label> <input type="text" class="form-control" name="accountNumber" />
							</div>
							<div class="text-right">
								<button type="submit" class="btn btn-primary">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../../common/footer.jsp"%>
</html>