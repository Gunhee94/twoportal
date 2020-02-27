<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>개인정보조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
	<style>

	</style>   
</head>     
<body>  
<div class="container-fluid" id="app"> 
	<%@include file="../../common/navheader.jsp" %>  
	<div class="row" >
		<div class="col-sm-2">
			<%@include file="../../common/navleft.jsp" %>
		</div>
		<div class="col-sm-10" >
			<div class="page-header" style="margin-top: 0px;">
				<h4>개인정보 조회/변경</h4>
			</div>
			
			<form class="form-horizontal lgh well" >
				<div class="row">		
					<div class="col-sm-6">
						<div class="form-group">
							<label class="control-label col-sm-4">이름</label>    
							<div class="col-sm-8">
								<input type="text" class="form-control" readonly v-bind:value="profiles.name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">아이디</label>    
							<div class="col-sm-8">
								<input type="text" class="form-control" readonly v-bind:value="profiles.id">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">비밀번호</label>    
							<div class="col-sm-8">
								<input type="password" class="form-control" name="pwd" v-model="param.pwd">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">이메일</label>    
							<div class="col-sm-8">
								<input type="text" class="form-control" name="email" v-model="profiles.email">
							</div>    
						</div>   
						<div class="form-group">
							<label class="control-label col-sm-4">담당학과</label>    
							<div class="col-sm-8">
								<input type="text" class="form-control" readonly v-bind:value="profiles.deptName">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">직급</label>    
							<div class="col-sm-8">
								<input type="text" class="form-control"  readonly v-bind:value="profiles.position">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">임용날짜</label>    
							<div class="col-sm-8">
								<input type="text" class="form-control" readonly v-bind:value="profiles.myCreateDate">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">프로필</label>    
							<div class="col-sm-8">
								<input type="file" class="form-control" name="imageName">
							</div>  
						</div>
					</div>     
					<div class="col-sm-4">
						<img v-bind:src="'/resources/images/professor/'+profiles.imageFileName" class="img-thumbnail" style="height: 230px; width: 160px;"/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-10">  
						<button type="button" class="btn btn-primary btn-block" @click="updateProfile" >변경하기</button>
					</div>  
				</div>   
			</form>  
		</div>          
	</div>	  
</div>
<script type="text/javascript">
	var app = new Vue({
		el:"#app",
		data: {
			profiles:[],
			param:{
				pwd:''
			},
		},
		beforeCreate:function() {
			$.getJSON('/professor/board/profilelist.hta', function(result) { 
				app.profiles = result.profiles;
			});
		},
		methods: {
			updateProfile: function () {
				if (!this.param.pwd) {
					alert("비밀번호가 입력되지 않았습니다.");
					return;
				}
				  
				var formData = new FormData();
				if ($(":file").val() != "") {
					formData.append("imageName", $(":file")[0].files[0]);
				} 
				formData.append("pwd", this.param.pwd);
				formData.append("email", app.profiles.email);

				console.log(formData);
				
				$.ajax({
					url:"/professor/board/updateProfile.hta",
					type : 'POST',
					data : formData,
					enctype : 'multipart/form-data',
		            processData : false,
		            contentType : false,
		            cache : false,
		            success : function (result) {
		            	app.profiles = result.profiles;
		            	alert("성공적으로 변경되었습니다.");
		            }
				})
			},
		}
	});       
	        
</script>
</body> 
</html>