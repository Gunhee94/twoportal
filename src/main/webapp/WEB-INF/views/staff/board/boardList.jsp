<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="container-fluid" id="board">

		<%@include file="../../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp"%>		
			</div>
			<div class="col-sm-10">
				<div style="margin-bottom:20px;">
					<h3>자유게시판</h3>
				</div>
				<form id="border-form">
				<input type="hidden" v-model="param.page" name="page">
					<div class="form-group pull-left">
						<select  class="form-control" name="category" v-model="param.category" id="form-board-select">

							<option value="free" >--자유게시판--</option>
							<c:if test="${loginInfo.job == 'student' or loginInfo.job == 'staff'}">
							<option value="student">--학생게시판--</option>
							</c:if>
							<c:if test="${loginInfo.job == 'professor' or loginInfo.job == 'staff'}">
							<option value="professor">--교수게시판--</option>
							</c:if>
						</select>
					</div>
					<div class="form-group pull-right" style="margin-right:10px;" >
						<select style="" class="form-control" id="student-grade" v-model="param.dateorview" name="dateorview">
							<option value="view" selected="selected">조회순</option>
							<option value="uploaddate">등록순</option>
						</select>
					</div>
					<div class="form-group pull-right" style="margin-right:30px;">
						<select v-model="param.searchOption" name="searchOption">
							<option value="title" selected="selected">제목</option>
							<option value="content">내용</option>
							<option value="titleContent">제목+내용</option>
						</select>
						<input type="text" v-model="param.searchBox" name="searchBox" v-on:keydown.enter.prevent='boardview()'>
						<button type="button" class="btn btn-primary" @click="boardview()">검색</button>
					</div>
					
				</form>
				<table class="table table-hover">
					<colgroup>
							<c:if test="${loginInfo.job == 'staff' }">
								<col width="8%" />
							</c:if>
								<col width="15%" />
								<col width="*%" />
								<col width="15%" />
								<col width="12%" />
								<col width="12%" />

							</colgroup>
					<thead>
						<tr>
							<c:if test="${loginInfo.job == 'staff' }">
								<th><input type="checkbox" id="first-chk"></th>
							</c:if>
							<th>번호</th>
							<th>제목</th>
							<th>닉네임</th>
							<th>작성날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr v-if="boardLists.length ==0">
							<td colspan="7">조회된 결과가 없습니다</td>
						</tr>
						<tr v-for="boardList in boardLists">
							<c:if test="${loginInfo.job == 'staff' }">
							<td><input type="checkbox" id="sel-chk"></td>
							</c:if>
							<td>{{boardList.no }}</td>
							<td><a :href="'/staff/boardDetail.hta?detail='+boardList.no">{{boardList.title }}</a></td>
							<td>{{boardList.guestNickname }}</td>
							<td>{{boardList.createDate}}</td>
							<td>{{boardList.viewCount }}</td>
						</tr>
					</tbody>
						
				</table>
						<div>
							<c:if test="${loginInfo.job == 'staff' }">
							<button class="btn btn-danger pull-right" style="margin-right:30px" id="delbtn">선택삭제</button>
							</c:if>	
							<c:if test="${loginInfo.job ==  'staff'}">
							<button class="btn btn-info pull-right" style="margin-right:10px;" id="insertbtn">글쓰기</button>
							</c:if>
						</div>
					<ul class='btn-group pagination' id="pageBtn">
						<li v-if="pageInfo.prev">
		    				<a id="prevPage">
		    				<i class='fa fa-chevron-left glyphicon glyphicon-chevron-left'></i></a>
						</li>
						<li v-for="number in pageInfo.endPage" id="pageNumberOn">
							<a @click="pageChange(number)" >{{number}}</a>
						</li>		
						<li v-if="pageInfo.next && pageInfo.endPage > 0">
							<a id="nextPage">
							<i class='fa fa-chevron-left glyphicon glyphicon-chevron-right'></i></a>
						</li>
				  </ul>			
			</div>
		</div>

	</div>
</body>
<%@include file="../../common/footer.jsp"%>
<script type="text/javascript">

	var getBoard = new Vue({
		el : "#board",
		data : {
			boardLists : [],
			pageInfo : {},
			param : {
				page:'1',
				category :'free',
				dateorview:'uploaddate',
				searchOption:'title',					
				searchBox:''
			}
		},
			methods : {
				pageChange : function(number){
					getBoard.param.page = number
					getBoard.boardview();
				},
				boardview : function(){
					
					var formInfo = $.param(getBoard.param)
					console.log(formInfo);
					$.ajax({
						url:"/staff/boardLists.hta",
						type : 'GET',
						data : formInfo,
						dataType : 'json',
						success : function(result){
							console.log(result);
							getBoard.boardLists = result.list;
							getBoard.pageInfo = result.page;
						},
						error : function(result){
							alert("에러다");
						}
					})
				}
		}
	})
	$("#form-board-select").on('change',function(){
	    getBoard.param.dateorview = 'uploaddate'
		getBoard.param.searchOption ='title'					
		getBoard.param.searchBox = ''
		getBoard.boardview();
	})
	
	$("#insertbtn").click(function(){
		location.href="/staff/boardInsert.hta"
	})
	
 
	getBoard.boardview();
</script>
</html>