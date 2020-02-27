<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
    	<div class="navbar-header">
      		<a class="navbar-brand" href="${homePath }">TWOPORTAL</a>
    	</div>
    	<ul class="nav navbar-nav">
    		<c:if test="${loginInfo.job eq 'professor' }">
	      		<li><a href="/professor/navHeader/dayCheck.hta">학생 출석 QR코드 </a></li>
    		</c:if>
    		<c:if test="${loginInfo.job eq 'student' }">
	      		<li><a href="/student/navHeader/myPage.hta">마이페이지 </a></li>
    		</c:if>
    		<c:if test="${loginInfo.job eq 'student' || loginInfo.job eq 'professor' }">
    			<li><a onclick="window.open('/clientAccessChat.hta','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">관리자 호출</a></li>
    		</c:if>
    		<c:if test="${loginInfo.job eq 'staff'}">
    			<li><a href="/serverChat.hta">문의 채팅</a></li>
    		</c:if>
      	</ul>
    	<ul class="nav navbar-nav navbar-right">
      		<li><a href="#"><strong>${loginInfo.name }</strong>님 환영합니다.</a></li>
    		<li><a href="/logout.hta">로그아웃</a></li>
      	</ul>  
	</div>
</nav>