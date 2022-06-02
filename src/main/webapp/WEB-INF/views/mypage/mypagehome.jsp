<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link rel="stylesheet" href="/resources/css/mypagehome.css"/>
<style>
	
	  
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="content">
	<jsp:include page="mypageHeader.jsp"/>
	<c:if test="${sessionScope.user_id ==null }">
		<br><br>
		<h3>로그인이 필요한 서비스입니다.</h3>
		<br><br>
	</c:if>
	<c:if test="${sessionScope.user_id != null }">
		<div id="mypageFooter">
			<span id="welcome"><strong style="font-size:1.2em;">"${dto.nickname }"</strong>님 환영합니다.</span><span id="reg_date">&nbsp;&nbsp;가입일 "2020-12-12"</span>
			<div id="cardBox">	
				<div class="card" id="card1"><a href="myMovieList">
					<img src="/resources/mypage_img/mypagefilm.png" style="width:100px;"><br><br>
					<span>내가 본 영화</span></a>
				</div>
				<div class="card" id="card2"><a href="userReviewList">
				<img src="/resources/mypage_img/mypagestar.png" style="width:100px;"><br><br>
					<span>내가 쓴 평점</span></a>
				</div>
			</div>
		</div>
	</c:if>
	</div>
</body>
</html>