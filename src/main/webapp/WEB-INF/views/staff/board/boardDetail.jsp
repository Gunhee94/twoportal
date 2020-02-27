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
</head>
<body>
	<div class="container-fluid">
		<%@include file="../../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp"%>
			</div>
			<div class="col-sm-10">
				<div class="form" style="margin-bottom: 30px;">
					<div class="card-body">
						
						<h2 class="card-title mb-3" style="margin-bottom: 30px">${detail.title }</h2>
						<h4 class="card-subtitle text-muted mb-4" style="margin-bottom: 30px">
							<i class="far fa-user" style="margin-right: 15px">${detail.guestNickname }</i>
							<i class="far fa-clock" style="margin-right: 15px">
								<fmt:formatDate value="${detail.createDate }" /></i> 
								<i class="fas fa-align-justify">${detail.viewCount }</i>
						</h4>
						<div class="jumbotron">
							<p class="">${detail.content }</p>
							<c:if test="${not empty detailImage.name}">
								<img alt="detailImage" src="/resources/images/board/${detailImage.name}" style="width:300px; heigth:300px;" >	
							</c:if>					
						</div>
					</div>
					<div class="card-body pull-right" style="margin-right: 20px">
	
					    <a href="/staff/boardUpdate.hta?update=${detail.no}" class="btn btn-primary btn-sm" type="button">수정</a> 
						<a href="#" class="btn btn-primary btn-sm " type="button">삭제</a>
					</div>
					<div class="card-body">
						<a href='<c:url value='/staff/boardList.hta'/>' class="btn btn-info" role="button">목록으로</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" id="replies">
			<div class="col-sm-9 col-sm-offset-2">
				<h3>댓글 <button class="btn btn-default pull-right" @click="toggleForm()">댓글 쓰기</button></h3>
				<hr/>
				<form class="form-horizontal well" id="reply-insert" v-if="isShow">
					<div class="form-group">
						<input type="hidden" value="${detail.no }" name="boardNo"/>
						<label class="control-label col-sm-1">닉네임 :</label> 
						<div class="col-sm-4">
							<input type="text" class="form-control" placeholder="닉네임을 입력하세요." name="boardNickName" v-model="reply.boardNickName"/> 
						</div>
						<label class="control-label col-sm-1">비밀번호 </label> 
						<div class="col-sm-4">
							<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." name="boardPassword" v-model="reply.boardPassword"/>
						</div>
						<div class="col-ms-1">
							<button @click="insertReply()" class="btn btn-info" type="button" >등록</button>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-1">Comment:</label>
						<div class="col-sm-9">
  							<textarea class="form-control" rows="3" id="comment" name="content" v-model="reply.content"></textarea>
						</div>
					</div>
				</form>
			</div>
			
			<div class="col-sm-9 col-sm-offset-2">
				<table class="table ">
					<colgroup>
						<col width="10%;">
						<col width="*">
						<col width="15%;">
						<col width="15%;">
					</colgroup>
					<thead>
						<tr>
							<th>닉네임</th>
							<th>내용</th>
							<th>등록일</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="temp-up">
						<template v-for="item in replies">
							<tr>
								<td>{{item.boardNickName}}</td>
								<td>{{item.content}}</td>
								<td>{{item.formatedCreateDate}}</td>
								<td>
									<button class="btn btn-warning btn-xs" @click="displayform(item.no)" >수정</button>
									<button class="btn btn-danger btn-xs" @click="displaydelform(item.no)" >삭제</button>
								</td>
							</tr>
							<tr style="display:none;" v-bind:id="'deleteform-'+ item.no">
								<td>
									<form class="form-horizontal"  v-bind:id="'formdel-' + item.no">
										<div class="form-group">
											<input type="password" class="form-control" name="boardPassword"/>
											<input type="hidden" v-bind:value="item.no"  name="no" />
											<button type="button" class="btn btn-primary" @click="deleteReply(item.no)">확인</button>
										</div>

									</form>
								</td>
							</tr>
							<tr style="display:none;" v-bind:id="'form-' + item.no">
								<td></td>
								<td colspan="3">
									<form class="form-horizontal " v-bind:id="'formbind-' + item.no">
										<div class="form-group">
											<label class="control-label col-sm-1">내용</label>
											<div class="col-sm-9">
					  							<textarea class="form-control" rows="3" name="content" v-bind:value="item.content" ></textarea>
											</div>
										</div>
										<div class="form-group">
											<input type="hidden" value="${detail.no }" name="boardNo"/>
											<input type="hidden" v-bind:value="item.no"  name="no" />
											<label class="control-label col-sm-1">비밀번호</label> 
											<div class="col-sm-4">
												<input type="password" class="form-control"  placeholder="비밀번호를 입력하세요." name="boardPassword" />
											</div>
											<div class="col-ms-1">
												<button @click="updateReply(item.no)" class="btn btn-info" type="button" >수정</button>
											</div>
										</div>
									</form>
								
								</td>
							</tr>
						</template>
					</tbody>
						
				</table>
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript">
		var boardNo = ${detail.no};
		console.log(boardNo);
		var boardReply = new Vue({
			el : "#replies",
			data : {
				replies : [],
				reply : {},
				isShow: false
			},
			methods : {
				toggleForm:function() {
					this.isShow = !this.isShow;
				},
				replyView : function(){
					$.ajax({
						url: "/staff/selectBoardListReply.hta",
						type : 'get',
						data :{boardNo : boardNo},
						success : function(result){
							console.log(result)
							boardReply.replies = result;
						}
					})
				}, 
				
				updateReply : function(itemNo) {
					var res = $("#formbind-"+itemNo).serialize();
					$.ajax({
						 url:"/staff/updateBoardListReply.hta",
						 type : 'post',
						 data : res,
						 success : function(result){
							 boardReply.replies = result;
						 },
						 error : function(){
							 alert("잘못된 입력입니다.")
						 }						
					})
				}, 
				insertReply : function() {
					var replyInfo = $("#reply-insert").serialize();	
					
					$.ajax({
						url: "/staff/addBoardListReply.hta",
						type : 'post',
						data :replyInfo,
						dataType : 'json',
						success : function (result){
							boardReply.replies = result;
							boardReply.reply = {}
						}
					})
				},
				displayform : function(itemNo) {
					$("#form-"+itemNo).toggle();
				},
				deleteReply : function(itemNo) {
					var res = $("#formdel-"+itemNo).serialize();
					$.ajax({
						 url:"/staff/deleteBoardListReply.hta",
						 type : 'post',
						 data : res,
						 success : function(result){
							 boardReply.replies = result;
							 boardReply.reply = {}
						 },
						 error : function(){
							 alert("잘못된 입력입니다.")
						 }
					})
				},
				displaydelform : function(itemNo){
					$("#deleteform-"+itemNo).toggle();
				}
			}
		})
		

	
		
		boardReply.replyView();
	
	</script>
</html>