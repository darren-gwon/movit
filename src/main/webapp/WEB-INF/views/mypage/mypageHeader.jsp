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
		<c:if test="${sessionScope.user_id !=null }">
			<a id="mypageTitle" href="/mypage">My Page</a>
			<ul id="menu">
				<li><a href="/mypage/userInfo">회원정보변경</a></li>
				<li><a href="/mypage/delAccount">회원정보탈퇴</a></li>
				<li><a href="/mypage/myInquiry">나의 문의내역(1:1문의)</a></li>
				<li><a href="/mypage/myLostInquiry">분실물문의</a></li>
				<li><a href="#">예매내역</a></li>
			</ul>
		</c:if>
		</div>
	</div>
</body>
</html>