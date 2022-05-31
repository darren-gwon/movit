<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#del").click(function() {
			var de = confirm("게시글을 삭제합니다");

			if (de) {
				return location.href = "../event/delete?num=" + ${dto.seq}
			}
				});
	});
</script>

<style>
.event-detail{
	width: 1500px;
	margin: 0 auto;
	background-color:green;
	
}
.tit{
	float: left;
	margin-left:200px;
	margin-top:100px;
	font-size:1.8666em;
	font-weight:400;
	letter-spacing:-1px;
	line-height:1.1;
	color:#222;
}
.event-detail .event-date{
	float: left;
	margin-left:200px;
	margin-top:20px;
	border-bottom: 1px solid #555;
	padding: 0px 0 15px 0;
	margin-bottom:30px;
}
.cnt{
	margin-left:770px;
	}
div.btn-wrap{
	margin-top:50px;
	margin-left:200px;
	width:1500px;
	height:100px;	
}
div.btn-admin{
	margin-left:1300px;
	margin-bottom:30px;
}
.btn-update {
	display: inline-block;
    width: 80px;
    height: 30px;
	text-decoration: none;
    cursor: pointer;
    font-size: 14px;
    color: #ffffff !important;
    background-color: #414141;
    text-aling:center;
    line-height: 25px;
    border-radius: 5px;
}
#del{
display: inline-block;
    width: 80px;
    height: 30px;
	text-decoration: none;
    cursor: pointer;
    font-size: 14px;
    color: #ffffff !important;
    background-color: #414141;
    text-aling:center;
    line-height: 25px;
    border-radius: 5px;
}
a.btn-list{
	display: inline-block;
    width: 130px;
    height: 50px;
	text-decoration: none;
    cursor: pointer;
    font-size: 14px;
    color: #ffffff !important;
    background-color: #414141;
    text-aling:center;
    line-height: 48px;
    border-radius: 5px;
}
</style>
</head>
<body>
		<div class="content">
			<div class="event-detail">
				<h2 class="tit">${dto.title}</h2>
				<br>
				<p class="event-date">
				<span>기간 : ${dto.start_date} ~ ${dto.end_date}</span>
				<b class="cnt">조회수 : ${dto.view_cnt}</b></p>
				
				<div class="body">
				<img src="../resources/main_img/${dto.main_img}">${dto.content}
				</div>
			</div>
		</div>
		<div class="btn-wrap">
		<!-- <button onclick="location.href='eventlist'">목록</button> -->
		<a class="btn-list" href="eventlist">목록</a>
		</div>
		<div class="btn-admin">
		<a class="btn-update" href="../event/updateform?num=${dto.seq}">수정</button></a>
		<a type="button" id="del">삭제</a>
		</div>
		

</body>
</html>