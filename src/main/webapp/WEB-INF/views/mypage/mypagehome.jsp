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
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
	*{padding:0;margin:0}
	li{list-style:none}
	a{text-decoration:none;font-size:14px}
	
	.menu {
	  width: 800px;
	  overflow: hidden;
	  margin: 150px auto;
	}
	
	.menu > li {
	  width: 33%; /*20*5=100%*/
	  float: left;
	  text-align: center;
	  line-height: 40px;
	  background-color: #343a40;
	}
	
	.menu a {
	  color: #fff;
	}
	
	.submenu > li {
	  line-height: 50px;
	  background-color: #868e96;
	}
	
	.submenu {
	  height: 0; /*ul의 높이를 안보이게 처리*/
	  overflow: hidden;
	}
	
	.menu > li:hover {
	  background-color: #868e96;
	  transition-duration: 0.5s;
	}
	
	.menu > li:hover .submenu {
	  height: 150px; /*서브메뉴 li한개의 높이 50*5*/
	  transition-duration: 1s;
	}
	  
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<ul class="menu">
		<li>
			<a href="#">회원정보</a>
			<ul class="submenu">
				<li><a href="mypageUserInfo">개인정보변경</a></li>
				<li><a href="#">간편로그인설정</a></li>
				<li><a href="#">회워정보탈퇴</a></li>
			</ul>
		</li>
		<li>
			<a href="#">나의 문의내역</a>
			<ul class="submenu">
				<li><a href="#">1:1문의</a></li>
				<li><a href="#">분실물문의</a></li>
			</ul>
		</li>
		<li>
			<a href="#">예매내역</a>
			<ul class="submenu">
				<li><a href="#">영수증 출력</a></li>
			</ul>
		</li>
	</ul>
</body>
</html>