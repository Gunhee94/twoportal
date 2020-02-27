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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						<p>학생을 한명씩 등록하세요</p>
						<form class="well" method="post" action="addStudent.hta" enctype="multipart/form-data">
							<div class="form-group">
								<label>증명사진 올리기</label> 
								<input type="file" class="form-control" name="imageName" />
							</div>
							<div class="form-group">
								<label>학번</label>
								 <input type="text" class="form-control" name="id" />
							</div>
							<div class="form-group">
								<label>이름</label> <input type="text" class="form-control" name="name" />
							</div>
							<div class="form-group">
								<label>생년월일</label> <input type="date" class="form-control" name="age" />
							</div>
							<div class="form-group">
								<label>학과</label>
									<select class="form-control" id="sel2" name="deptNo">
					      				<option value="11" selected="selected">경영학과</option>
					       			 	<option value="12">생명공학과</option>
					       			 	<option value="13">시각디자인학과</option>
					       			 	<option value="14">컴퓨터공학과</option>
					       			 	<option value="15">전자물리학과</option>
					       			 	<option value="16">조소과</option>
								</select>
							</div>
							<div class="form-group">
								<label>학년</label>
									<select class="form-control" id="sel2" name="grade">
					      				<option value="1" selected="selected">1학년</option>
					       			 	<option value="2">2학년</option>
					       			 	<option value="3">3학년</option>
					       			 	<option value="4">4학년</option>
								</select>
							</div>
							<div class="form-group">
								<label>이메일</label> <input type="text" class="form-control" name="email" />
							</div>
							<div class="form-group">    
								<div><label>주소</label></div>               
								<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
							    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
							</div>
							<div class="form-group">
							    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
							</div>
							<div class="form-group">
							    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
							</div>
							<div class="form-group">
								<label>휴대폰번호</label> <input type="text" class="form-control" name="phone" />
							</div>
							<div class="form-group">
								<label>은행명</label> <input type="text" class="form-control" name="bankName" />
							</div>
							<div class="form-group">
								<label>계좌번호</label> <input type="text" class="form-control" name="accountNumber" />
							</div>
							<input type="hidden" id="address">
							<div class="text-right">
								<button type="submit" class="btn btn-primary">등록</button>
							</div>
						</form>
					</div>
					<div class="col-sm-6">
						<p>학생 엑셀 등록 해주세요</p>
						<form class="well" method="post" action="studentXlsAddInfo.hta"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>엑셀 파일로 올리기</label> <input type="file" class="form-control"
									name="xlsfile" accept=".xls, .xlxs">
							</div>
							<div class="text-right">
								<button type="submit" class="btn btn-primary">일괄등록</button>
							</div>
						</form>
						<p>사진을 등록 해주세요</p>
						<form class="well" id="multiUpLoad" method="post" action="multipartimg.hta" 
							enctype="multipart/form-data" accept=".jpg, .png, .jpeg">
							<div class="form-group">
								<label>학생 증명 사진 올려주기</label>
								<input multiple="multiple" type="file" name="file" class="" style="width:200px; height:30px">							
							</div>
							<div class="text-right">
								<button type="button" class="btn btn-primary" onclick="fileSubmit()">사진등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
	<%@include file="../../common/footer.jsp"%>
	<script type="text/javascript">
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=addr1]").val(data.zonecode);
               $("[name=addr2]").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
               
              
               
           }
        }).open();
    }
	function fileSubmit() {
		var form = $("#multiUpLoad")[0];
		var formData = new FormData(form);
		$.ajax({
			type: 'post',
			url : '/staff/multipartimg.hta',
			data : formData,
			processData : false,
			contentType : false,
			success : function(html){
				alert("파일 업로드 성공");
			},
			error : function(error){
				alert("파입 업로드 실패");
			}
		})
	}
	
	</script>

