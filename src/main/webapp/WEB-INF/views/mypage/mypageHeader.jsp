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
<link rel="stylesheet" href="/resources/css/mypageHeader.css"/>
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
	</div>
</body>
</html>