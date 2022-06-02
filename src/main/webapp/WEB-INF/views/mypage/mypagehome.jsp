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
		<div id="mypageHeader">
			<a id="mypageTitle" href="home">My Page</a>
			<ul id="menu">
				<li><a href="mypageUserInfo">회원정보변경</a></li>
				<li><a href="deleteAccountView">회원정보탈퇴</a></li>
				<li><a href="#">나의 문의내역</a></li>
				<li><a href="#">1:1문의</a></li>
				<li><a href="#">분실물문의</a></li>
				<li><a href="#">예매내역</a></li>
			</ul>
		</div>
		<div id="mypageFooter">
			<span id="welcome"><strong style="font-size:1.2em;">"${dto.nickname }"</strong>님 환영합니다.</span><span id="reg_date">&nbsp;&nbsp;가입일 "2020-12-12"</span>
			<div id="cardBox">	
				<div class="card" id="card1"><a href="">
					<img src="/resources/mypage_img/mypagefilm.png" style="width:100px;"><br><br>
					<span>지금까지 내가 본 영화 0편</span></a>
				</div>
				<div class="card" id="card2"><a href="userReviewList">
				<img src="/resources/mypage_img/mypagestar.png" style="width:100px;"><br><br>
					<span>내가 쓴 평점</span></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>