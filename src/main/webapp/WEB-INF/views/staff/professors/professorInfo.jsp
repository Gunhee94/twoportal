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
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <style type="text/css"> 

  </style>
</head>
<body>
<div class="container-fluid" id="professor"> 
<%@include file="../../common/navheader.jsp" %>
<div class="row" >
	<div class="col-sm-2">
		<%@include file="../../common/navleft.jsp"%>		
	</div>
	<div class="col-sm-10">
		<div class="" style="margin-bottom:30px;">
			<label>교수정보</label>
		</div>
			<div class="row">
				<div class="col-sm-12">
					<form class="form-inline">
						<div class="form-group" id="">
							<label for="sel1">직급</label> <select name="" v-model="param.position"
								class="form-control" id="professor-position">
								<option value="" selected="selected">-- 전체 --</option>
								<option value="교수">교수</option>
								<option value="부교수">부교수</option>
							</select>
						</div>
						<div class="form-group" id="">
							<label for="sel1">학과</label> 
							<select name="" v-model="param.deptNo" class="form-control" id="professor-dept">
								<option value="" selected="selected" >-- 선택 --</option>
								<c:forEach var="department" items="${listDept}">
									<option value="${department.no}">${department.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group" class="form-control" >
							<label for="sel1">이름</label> 
							<input type="text" v-model="param.proName"
								class="form-control" id="professor-name" v-on:keydown.enter.prevent='searchProfessor()'>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-primary pull-right" id="btn-get" @click="smallJson()">검색</button>
						</div>
					</form>
				</div>
			</div>
		
		<div style="margin-top:70px;">
			<form>
				<table class="table table-bordered" id="professor-table">
					<colgroup>
						<col width="4%" />
						<col width="12%" />
						<col width="12%" />
						<col width="20%" />
						<col width="12%" />
						<col width="15%" />
						<col width="*%" />
					</colgroup>
				    <thead>
				     	<tr>
				        	<th><input type="checkbox" id="first-chk"></th>
				        	<th>아이디</th>
				       		<th>이름</th>
				        	<th>Email</th>
				        	<th>직급</th>
				        	<th>학과</th>
				       		<th></th>
				      	</tr>
				    </thead>
				    <tbody id="curt-pro-info">
				    	<tr v-if="professors.length == 0">
				    		<td colspan="9" class="text-center">조회된 결과가 없습니다.</td>
				    	</tr>	
					    <tr v-for="pro in professors">
					       <td><input type="checkbox"  name='selchk' v-model="checkedPro" v-bind:value="pro.no"></td>
					       <td>{{pro.id}}</td>
					       <td>{{pro.name}}</td>
					       <td>{{pro.email}}</td>
					       <td>{{pro.position}}</td>
					       <td>{{pro.deptName}}</td>
					       <td><button class="btn btn-primary" type="button" data-toggle='modal'  data-target='#proModal' @click="modalPage(pro.no)">
					       상세보기</button></td>
					    </tr>
				    </tbody>
				 </table>
				<ul class='btn-group pagination' id="pageBtn">
						<li v-if="pageInfo.prev">
		    				<a id="prevPage">
		    				<i class='fa fa-chevron-left glyphicon glyphicon-chevron-left'></i></a>
						</li>
						<li v-for="number in pageInfo.endPage" id="pageNumberOn">
							<a @click="pageChange(number)" id="pageNumber" >{{number}}</a>
						</li>		
						<li v-if="pageInfo.next && pageInfo.endPage > 0">
							<a id="nextPage">
							<i class='fa fa-chevron-left glyphicon glyphicon-chevron-right'></i></a>
						</li>
				  </ul>	
				  <button class="btn btn-danger pull-right" style="margin-right:50px;" @click="deleteProfessor()">삭제</button>
			  </form>
		</div>
	</div>
	
	<div id="proModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">교수 소개</h4>
							</div>
							<div class="modal-body">
								<form id="professor-detail-table" action="professorInfoUpdate.hta" method="post">
									<div style="margin-bottom:40px; text-align:center;">
										<img alt="교수사진" style="width:150px; height:150px;"
										 v-bind:src="'/resources/images/professor/'+ professor.imageName" >
										<input type="file" id="modal-prophoto-imgupload" name="imageName">
									</div>
									<div>	
										<label>이름</label>
										<input type="text" name="" class="form-control" v-model="professor.name" style="width:300px;">
										<label>아이디</label>
										<input type="text" name="" class="form-control" v-model="professor.id" style="width:300px;">
									</div>
									<div>
										<label>직급</label>
										<input type="text" name="" class="form-control" v-model="professor.position" style="width:300px;">
										<label>교수 임용 날짜</label>
										<input type="text" name="" class="form-control" v-model="professor.createDate" style="width:300px;">
									</div>
									<div>
										<label>계좌 은행</label>
										<input type="text" name="" class="form-control" v-model="professor.bankName" style="width:300px;">
										<label>계좌 번호</label>
										<input type="text" name="" class="form-control" v-model="professor.accountNumber" style="width:300px;">
									</div>
									
									<div style="text-align:center;">
										<button type="button"  class="btn btn-info" id="pro-detail-btn" @click="modalUpdatePage()">변경하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
	
</div>


</div>
	<script type="text/javascript">
	
		var getProfessor = new Vue({
			el : "#professor",
			data : {
				professors:[],
				professor:{},
				pageInfo:{},
				checkedPro:[],
				param : {
					page:'',
					deptNo:'',
					position:'',
					proName:''
				}
			},
			methods :{
				pageChange: function(number) {
					console.log(number);	
					getProfessor.smallJson(number);
				},
				smallJson: function(number) {
					
					if(number ==''){
						number =1 ;
					}
					$.ajax({
						url:"/staff/professorInfoCri.hta",
						type : 'get',
						data : {
							page : number,
							deptNo: getProfessor.param.deptNo,
							position : getProfessor.param.position,
							proName : getProfessor.param.proName
						},
						success : function(result) {
							console.log(result);
							getProfessor.professors = result.list;	
							getProfessor.pageInfo = result.pageInfo;	

						}
					})
				},
				modalPage : function(proNo){
					$.ajax({
						url:"/staff/professorInfoDetail.hta",
						type : 'get',
						data : {proNo : proNo},
						success : function(result) {
							getProfessor.professor = result;
							console.log(getProfessor.professor);
						}
						
					})
				},
				modalUpdatePage : function(){
					var formData = new FormData();
					if($("#modal-prophoto-imgupload").val() != ""){
						formData.append("imageName", $("#modal-prophoto-imgupload")[0].files[0]);
					}
						formData.append("no",getProfessor.professor.no);
						formData.append("name",getProfessor.professor.name);
						formData.append("id",getProfessor.professor.id);
						formData.append("position",getProfessor.professor.position);
						formData.append("createDate",getProfessor.professor.createDate);
						formData.append("bankName",getProfessor.professor.bankName);
						formData.append("email",getProfessor.professor.email);
						formData.append("accountNumber",getProfessor.professor.accountNumber);
						formData.append("deptNo",getProfessor.professor.deptNo);
						formData.append("deptName",getProfessor.professor.deptName);
						formData.append("access",getProfessor.professor.access);

						console.log(formData);
					$.ajax({
						url:"/staff/professorInfoUpdate.hta",
						type : 'POST',
						data : formData,
						enctype : 'multipart/form-data',
			            processData : false,
			            contentType : false,
			            cache : false,
			            success : function (result) {
			            	getProfessor.professor = result;
			            	
			            }
					})
				},
				deleteProfessor : function() {
					//이것을 안써주면 배열로 안담겨옴
					jQuery.ajaxSettings.traditional = true;
				 	$.ajax({
				 		url:"/staff/professorDelete.hta",
				 		type:'post',
				 		data : {checkNo : getProfessor.checkedPro},
				 		success : function checkedSelect(){
				 			alert("삭제완료");
				 			
				 		}, error: function(){
				 			alert("삭제하지 못함");
				 		}
				 	});	
				}
			}
		});
		//전체클릭을 선택하면 전체선택 /해제
		$(document).ready(function(){
			$("#first-chk").click(function(event){
				if($("#first-chk").prop("checked")) { 
					 $("input[type=checkbox]").prop("checked",true);  
				 }
				 else {
				 	$("input[type=checkbox]").prop("checked",false); 
				 }
			});
		});
		
		
		
		
		$(document).ready(function(){
			getProfessor.smallJson();
		})
		
		
	</script>
</body>
<%@include file="../../common/footer.jsp"%>
</html>