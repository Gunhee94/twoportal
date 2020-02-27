<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp"%>
			</div>
			<div class="col-sm-10">
				<div class="page-header" style="margin-top: 0px;">
					<h4>학생정보</h4>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<form class="form-inline">
							<div class="form-group" id="year">
								<label for="sel1">입학년도 :</label> <input type="text"
									class="form-control" name="year" id="student-year"
									maxlength="4">
							</div>
							<div class="form-group" id="year">
								<label for="sel1">학과</label> <select name="departmentNo"
									class="form-control" id="student-dept">
									<option value="0" selected="selected">-- 선택 --</option>
									<c:forEach var="department" items="${listDept}">
										<option value="${department.no}">${department.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group" id="year">
								<label for="sel1">학년</label> <select name="grade"
									class="form-control" id="student-grade">
									<option value="0" selected="selected">-- 전체 --</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
							<div class="form-group" class="form-control">
								<label for="sel1">이름</label> <input type="text"
									name="studentName" class="form-control" id="student-name">
							</div>
							<div class="form-group">
								<button class="btn btn-primary pull-right" id="btn-get">검색</button>
							</div>
						</form>
					</div>
				</div>


				<div class="row" style="margin-top: 70px;">
					<div class="col-sm-12">
						<table class="table table-bordered" id="student-table">
							<colgroup>
								<col width="4%" />
								<col width="8%" />
								<col width="12%" />
								<col width="20%" />
								<col width="15%" />
								<col width="10%" />
								<col width="5%" />
								<col width="15%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="first-chk"></th>
									<th>이름</th>
									<th>학번</th>
									<th>Email</th>
									<th>학과</th>
									<th>재학상태</th>
									<th>학년</th>
									<th>휴대폰 번호</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="curt-stu-info"></tbody>
						</table>
						 <span class="pull-right"><button type="button"
								class="btn btn-danger" id="btn-sel-del"
								style="margin-right: 5px;">선택삭제</button></span>
						<div id="pageStu"></div>
					</div>
				</div>

				<div id="stuModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">수강 학생</h4>
							</div>
							<div class="modal-body">
								<form id="student-detail-table" action="studentInfoUpdate.hta" method="post">
									<input type="hidden" name="no" id="modal-no">
									<div style="margin-bottom:40px; text-align:center;">
										<img alt="studentImg" id="model-stuphoto-img" style="width:150px; height:150px;">
										<input type="file" id="modal-stuphoto-imgupload" name="imageName">
									</div>
									<div style="margin-bottom:15px;">
										<label>이름</label>
										<input type="text" id="modal-stuname" name="name" style="margin-right:50px;">
										<label>학번</label>
										<input type="text" id="modal-stuid" name="id">
									</div>
									<div style="margin-bottom:15px;">
										<label>생년월일</label>
										<input type="text" id="modal-stuage" style="margin-right:50px;" name="age">
										<label>email</label>
										<input type="text" id="modal-stuemail" name="email">
									</div>
									<div style="margin-bottom:15px;">
										<label>상태</label>
										<input type="text" id="modal-stustatus" style="margin-right:50px;" name="status">
										<label>학년</label>
										<input type="text" id="modal-stugrade" name="grade">
									</div>
									<div style="margin-bottom:15px;">
										<label>입학날짜</label>
										<input type="text" id="modal-stuadmission" style="margin-right:50px;" name="admission">
										<label>졸업날짜</label>
										<input type="text" id="modal-graduated" name="graduated">
									</div>
									<div style="margin-bottom:15px;">
										<label>주소</label>
										<input type="text" id="modal-stuaddress" style="width:400px;" name="address">
									</div>
									<div style="margin-bottom:15px;">
										<label>휴대폰</label>
										<input type="text" id="modal-stuphone" style="margin-right:50px;" name="phone">
										<label>계좌은행</label>
										<input type="text" id="modal-stubankname" name="bankName">
									</div>
									<div style="margin-bottom:15px;">
										<label>계좌번호</label>
										<input type="text" id="modal-stubanknum" style="margin-right:50px;" name="accountNumber">
										<label>학과</label>
										<input type="text" id="modal-studepart" name="deptNo">
									</div>
									<div style="text-align:center;">
										<button type="button"  class="btn btn-info" id="stu-detail-btn">변경하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	<%@include file="../../common/footer.jsp"%>
</body>


<script type="text/javascript">


	

	function searchStudent(page, year, departmentNo, grade, studentName) {
		$.getJSON("/staff/studentInfoCri.hta",{page : page, year : year, departmentNo : departmentNo, grade : grade, studentName : studentName},
			function(result) {
			var row = "";
			var page = "";
			if (result.list.length == 0) {
				row += "<tr>";
				row += "<td colspan='9' class='text-center'>조회된 학생이 없습니다.</td>";
				row += "</tr>";
			} else {
				$.each(
					result.list,
					function(index, stu) {
					row += "<tr>";
					row += "<td><input type='checkbox' id='sel-chk' name='selchk' data-chk-no="+stu.no+"></td>";
					row += "<td>" + stu.name+ "</td>";
					row += "<td>" + stu.id+ "</td>";
					row += "<td>" + stu.email	+ "</td>";
					row += "<td>"+ stu.deptName+ "</td>";
					row += "<td>" + stu.status+ "</td>";
					row += "<td>" + stu.grade+ "</td>";
					row += "<td>" + stu.phone+ "</td>";
					row += "<td><button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-stu-no="+stu.no+" data-target='#stuModal' id='student-no'>상세 정보</button></td>";
					row += "</tr>";

									});
					page += "<ul class='btn-group pagination'>";
					if ((result.pageInfo.prev)) {
						page += "<li>";
						page += "<a href='"
								+ (result.pageInfo.startPage - 1)
								+ "'>";
						page += "<i class='fa fa-chevron-left glyphicon glyphicon-chevron-left'></i>";
						page += "</a></li>";
					}
					;
					for (var i = (result.pageInfo.startPage); i <= (result.pageInfo.endPage); i++) {
						page += "<li>";
						page += "<a href='" + (i) + "'>";
						page += "<i class='fa'>" + i + "</i>";
						page += "</a></li>";
					}
					;
					if ((result.pageInfo.next)
							&& (result.pageInfo.endPage) > 0) {
						page += "<li>";
						page += "<a href='"+ (result.pageInfo.endPage + 1)+ "'>";
						page += "<i class='fa fa-chevron-left glyphicon glyphicon-chevron-right'></i>";
						page += "</a></li>";
					}
					;
					page += "</ul>";

				}
				;``
				$("#student-table #curt-stu-info").empty().append(row);
				$("#first-chk").prop('checked',false);
				$("#pageStu").empty().append(page);
			});
	}
	//학생 페이지에 값을 넣어주기
	$("#pageStu").on("click", '.pagination a', function(event) {
		event.preventDefault();
		var page = $(this).attr("href");

		var year = $("#student-year").val();
		var departmentNo = $("#student-dept").val();
		var grade = $("#student-grade").val();
		var studentName = $("#student-name").val();

		searchStudent(page, year, departmentNo, grade, studentName);
	});

	//년도,학과, 학년 , 이름을 검색했을 때 나옴
	$("#btn-get").click(function(event) {
		event.preventDefault();

		var year = $("#student-year").val();

		if (!year) {
			alert("년도를 입력해주세요");
			$("#student-year").focus();
			return;  
		}

		var departmentNo = $("#student-dept").val();
		var grade = $("#student-grade").val();
		var studentName = $("#student-name").val();

		console.log(departmentNo);
		searchStudent(1, year, departmentNo, grade, studentName);
	});

	//날짜가 숫자로만 사용할수 있게끔 
	$("#lecture-year").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});

	//상세정보를 클릭했을때 상세정보 창 보여주기
	$("#curt-stu-info").on('click','button[data-stu-no]',function(event) {
		event.preventDefault();
		var studentNo = $(this).data("stu-no");


		$("#student-detail-table tbody").empty();
	
		selectmodalStudent("/staff/studentInfoDetail.hta",studentNo);
	})

	//상세 정보를 변경할때 
	$("#stu-detail-btn").on("click", function(event) {
		event.preventDefault();
		
		var formData = new FormData();
		if ($("#modal-stuphoto-imgupload").val() != "") {
			formData.append("imgFile", $("#modal-stuphoto-imgupload")[0].files[0]);

		}
		
		formData.append("name", $("#modal-stuname").val());
		formData.append("no", $("#modal-no").val());
		formData.append("id", $("#modal-stuid").val());
		formData.append("age", $("#modal-stuage").val());
		formData.append("email", $("#modal-stuemail").val());
		formData.append("status", $("#modal-stustatus").val());
		formData.append("grade", $("#modal-stugrade").val());
		formData.append("admission", $("#modal-stuadmission").val());
		formData.append("graduated", $("#modal-graduated").val());
		formData.append("address", $("#modal-stuaddress").val());
		formData.append("phone", $("#modal-stuphone").val());
		formData.append("bankName", $("#modal-stubankname").val());
		formData.append("accountNumber", $("#modal-stubanknum").val());
		formData.append("deptNo", $("#modal-studepart").val());
		
		$.ajax({
			url:"/staff/studentInfoUpdate.hta",
			data : formData,
            type : 'POST',
            enctype : 'multipart/form-data',
            processData : false,
            contentType : false,
            cache : false,
			success : function(stuDetail) {

					var image = stuDetail.imageName;
					var no = stuDetail.no;
					var name = stuDetail.name;
					var id = stuDetail.id;
					var age = stuDetail.age;
					var status = stuDetail.status;
					var grade = stuDetail.grade;
					var admission = stuDetail.admission;
					var graduated = stuDetail.graduated;
					var address = stuDetail.address;
					var email = stuDetail.email;
					var phone = stuDetail.phone;
					var bankName = stuDetail.bankName;
					var accountNumber = stuDetail.accountNumber;
					var dept = stuDetail.deptName;
					var access = stuDetail.stuAccess;

					$("#model-stuphoto-img").attr("src","/resources/images/student/"+ image + "");
					$("#modal-stuname").attr("value",name);
					$("#modal-stuid").attr("value",id);
					$("#modal-stuage").attr("value",age);
					$("#modal-stustatus").attr("value",status);
					$("#modal-stugrade").attr("value",grade);
					$("#modal-stuadmission").attr("value",admission);
					$("#modal-graduated").attr("value",graduated);
					$("#modal-stuaddress").attr("value",address);
					$("#modal-stuemail").attr("value",email);
					$("#modal-stuphone").attr("value",phone);
					$("#modal-stubankname").attr("value",bankName);
					$("#modal-stubanknum").attr("value",accountNumber);
					$("#modal-studepart").attr("value",dept);
					$("#modal-access").attr("value",access);
					$("#modal-no").attr("value",no);
	        },
	        error : function(stuDetail) {
	        	alert("변경실패");
	        }
		});
		
	})
	//모달에 들어갈 학생 정보 조회
	function selectmodalStudent (url,studentNo){
		$.getJSON(url, {studentNo : studentNo},
			function(stuDetail) {

			var image = stuDetail.imageName;
			var no = stuDetail.no;
			var name = stuDetail.name;
			var id = stuDetail.id;
			var age = stuDetail.age;
			var status = stuDetail.status;
			var grade = stuDetail.grade;
			var admission = stuDetail.admission;
			var graduated = stuDetail.graduated;
			var address = stuDetail.address;
			var email = stuDetail.email;
			var phone = stuDetail.phone;
			var bankName = stuDetail.bankName;
			var accountNumber = stuDetail.accountNumber;
			var dept = stuDetail.deptName;
			var access = stuDetail.stuAccess;

			$("#model-stuphoto-img").attr("src","/resources/images/student/"+ image + "");
			$("#modal-stuname").attr("value",name);
			$("#modal-stuid").attr("value",id);
			$("#modal-stuage").attr("value",age);
			$("#modal-stustatus").attr("value",status);
			$("#modal-stugrade").attr("value",grade);
			$("#modal-stuadmission").attr("value",admission);
			$("#modal-graduated").attr("value",graduated);
			$("#modal-stuaddress").attr("value",address);
			$("#modal-stuemail").attr("value",email);
			$("#modal-stuphone").attr("value",phone);
			$("#modal-stubankname").attr("value",bankName);
			$("#modal-stubanknum").attr("value",accountNumber);
			$("#modal-studepart").attr("value",dept);
			$("#modal-access").attr("value",access);
			$("#modal-no").attr("value",no);
			

			$("#stuModal").modal("show");
		});
	}
	
	//전체클릭을 선택하면 전체선택/전체해제
	$(document).ready(function(){
		$("#first-chk").click(function(event){ 
			 if($("#first-chk").prop("checked")) { 
				 $("input[type=checkbox]").prop("checked",true);  
			 }
			 else {
			 	$("input[type=checkbox]").prop("checked",false); 
			 }
		});
		$("#curt-stu-info").on('change',$("#sel-chk"),function(event){
			$("#first-chk").prop('checked',false);
			$("input[name=selchk]:checked").each(function(i){
				if(i == 4){
					$("#first-chk").prop('checked',true);
				}				
			})
			
		});
		$("#btn-sel-del").click(function(evnet){
			
			if(confirm("삭제하시겠습니까?")){
				var studentNoList =new Array();
				var checkbox = $("input:checkbox[name=selchk]:checked");
				
				checkbox.each(function (i) {
					var no =$(this).data("chk-no");
					
					studentNoList.push(no) ;
				})
				console.log(studentNoList);
				if(studentNoList.length == 0){
					alert("삭제할 학생을 찾아주세요");
				}else{
					
					jQuery.ajaxSettings.traditional = true;
					$.ajax({
						type:'POST',
						url : '/staff/deleteStudent.hta',
						data : {studentNo:studentNoList},
						success : function pageReload(){
							alert("삭제완료")
							location.href="/staff/studentInfo.hta";
														
						},
						error:function () {
							alert("삭제하지 못함");
						}
					})
				}
					
							
			}else{
				return false;
			};
		});
	});

	
	
	searchStudent(1);
</script>

</html>