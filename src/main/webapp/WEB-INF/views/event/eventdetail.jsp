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

</head>
<body>
	<h1>상세내용</h1>

	<table border="1">

		<tr>
			<th>제목</th>
			<td style="width: 100px;">${dto.title}</td>
			<th>기간</th>
			<td style="width: 100px;">${dto.start_date}</td>
			<td style="width: 100px;">${dto.end_date}</td>
			<th>조회수</th>
			<th style="width: 100px;">${dto.view_cnt}</th>
		</tr>
		<tr>
			<td colspan="8" style="height: 1500px;">${dto.content}<img
				src="../resources/main_img/${dto.main_img}">
			</td>

		</tr>



		<button onclick="location.href='../event/updateform?num=${dto.seq}'">수정</button>
		<button type="button" id="del">삭제</button>
		<button onclick="location.href='eventlist'">목록</button>

	</table>

</body>
</html>