<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="panel-group">
	<div class="panel panel-default">
		<!-- /common/b.hta 절대경로로 입력 -->
		<c:forEach varStatus="count" var="navList" items="${navLefts }">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#collapse${count.count }" >${navList.mainTitle }</a>
				</h4>
			</div>
			<div id="collapse${count.count }" class="panel-collapse collapse">
				<c:forEach var="subCateList" items="${navList.url }">
					<div class="panel-body">
						<a href="${subCateList.url }">${subCateList.subCateTitle }</a>
					</div>
				</c:forEach> 
			</div>
		</c:forEach>
	</div>
</div>
