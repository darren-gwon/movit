<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/eventdetail.css" rel='stylesheet' />

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
				return location.href = "../event/del?num=" + ${dto.seq}
			}
		});
	});
</script>


</head>
<body>
		<div class="content">
			<h2 class="title">EVENT</h2>
			<div class="event-detail">
				<h2 class="tit">${dto.title}</h2>
				<br>
				<p class="event-date">
				<span>기간 : ${dto.start_date} ~ ${dto.end_date}</span>
				<b class="cnt">조회수 : ${dto.view_cnt}</b></p>
				<div class="body">
				<img src="/resources/img/event_main/${dto.main_img}">${dto.content}
				</div>
			</div>
			<div class="btn-wrap">
		<!-- <button onclick="location.href='eventlist'">목록</button> -->
		<a class="btn-list" href="/event">목록</a>
		</div>
		<c:if test="${user_id=='admin'}">
		<div class="btn-admin">
		<a class="btn-update" href="../event/edit?num=${dto.seq}">수정</button></a>
		<a type="button" id="del">삭제</a>
		</div>
		</c:if>
		</div>
		

</body>
</html>