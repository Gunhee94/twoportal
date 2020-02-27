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
<%@include file="../../common/navheader.jsp" %>
<div class="row" >
	<div class="col-sm-2">
				<%@include file="../../common/navleft.jsp"%>		
			</div>
		<div class="col-sm-10">
			<div class="" style="margin-bottom:40px;">
				<h4>장학금</h4>
			</div>
				<form class="form-inline">
					<div class="form-group" id="">
						<label for="sel1">학년</label>
	      				<select class="form-control" id="">
					        <option>1</option>
					        <option>2</option>
					        <option>3</option>
					        <option>4</option>
					     </select>					
					</div>
					<div class="form-group" id="">
				  	    <label for="">학과</label>
				    	<select class="form-control" id="">
					        <option>전기공학과</option>
					        <option>건축공학과</option>
					        <option>비서과</option>
					        <option>조소과</option>
					     </select>	
				    </div>
					<div class="form-group" id="">
				  	    <label for="">이름</label>
				    	<input type="text" class="form-control" id="">
				    </div>
				    <div class="form-group">
				    	<button class="btn btn-primary pull-right">검색</button>
				    </div>
				</form>
			
			<div style="margin-top:30px;">
				<table class="table table-bordered">
				    <thead>
				      <tr>
				        <th><input id="allCheck" type="checkbox" onclick="allChk()"></th>
				        <th>이름</th>
				        <th>학번</th>
				        <th>학과</th>
				        <th>은행</th>
				        <th>장학금 지급액</th>
				        <th>장학금지급날짜</th>
						<th></th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td><input name="RowCheck" type="checkbox" value=""></td>
				        <td>김학생</td>
				        <td>202010112</td>
				        <td>전기공학과</td>
				        <td>국민</td>
				        <td>4000000</td>
				        <td>2020/1/10</td>
				        <td>
				        <button class="btn btn-info">수정</button>
				        <button class="btn btn-success">지급</button></td>
				      </tr>
				      <tr>
				        <td><input name="RowCheck" type="checkbox" value=""></td>
				        <td>서학생</td>
				        <td>202010115</td>
				        <td>전기공학과</td>
				        <td>국민</td>
				        <td>4000000</td>
				        <td>2020/1/10</td>
				        <td>
				        <button class="btn btn-info">수정</button>
				        <button class="btn btn-success">지급</button></td>
				      </tr>
				      <tr>
				        <td><input name="RowCheck" type="checkbox" value=""></td>
				        <td>이학생</td>
				        <td>202010113</td>
				        <td>전기공학과</td>
				        <td>국민</td>
				        <td>4000000</td>
				        <td>2020/1/10</td>
				        <td>
				        <button class="btn btn-info">수정</button>
				        <button class="btn btn-success">지급</button></td>
				      </tr>
				      <tr>
				        <td><input name="RowCheck" type="checkbox" value=""></td>
				        <td>박학생</td>
				        <td>202010114</td>
				        <td>전기공학과</td>
				        <td>국민</td>
				        <td>4000000</td>
				        <td>2020/1/10</td>
				        <td>
				        <button class="btn btn-info">수정</button>
				        <button class="btn btn-success">지급</button></td>
				      </tr>
				    </tbody>
				 </table>
				 <ul class="btn-group pagination">
						    <c:if test="${pageMaker.prev }">
						    <li>
						        <a href='<c:url value="/boardList.hta?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left glyphicon glyphicon-chevron-left"></i></a>
						    </li>
						    </c:if>
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li>
						        <a href='<c:url value="/boardList.hta?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
						    </li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li>
						        <a href='<c:url value="/boardList.hta?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right glyphicon glyphicon-chevron-right"></i></a>
						    </li>
						    </c:if>
						</ul>
				 <button class="btn btn-primary pull-right" style="margin-right:70px;">선택 보내기</button>
			</div>
		</div>
	</div>


</div>
</body>
<%@include file="../../common/footer.jsp"%>
</html>