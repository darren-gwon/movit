<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col" style="text-align: center;">
				<img src="../../image/lostTop.png" width="1200px;">
			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<br>
	<br>


	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<table class="table table-hover"
					style="text-align: center; font-size: 15px;">
					<tr style="display: none;">
						<td style="display: none;">글번호</td>
						<td>${data.seq}</td>
					</tr>
					<tr>
						<td style="width: 130px;"><b>영화관</b></td>
						<td>${data.theaterID}</td>
					</tr>
					<tr>
						<td><b>분실물 유형</b></td>
						<td>${data.item_type}</td>
					</tr>
					<tr>
						<td><b>잃어버린 날짜</b></td>
						<td>${data.lost_date}</td>
					</tr>
					<tr>
						<td><b>글제목</b></td>
						<td>${data.title}</td>
					</tr>
					<tr>
						<td><b>글내용</b></td>
						<td>${data.content}</td>
					</tr>
					<tr>
						<td><b>첨부파일</b></td>
						<td>${data.fileID}</td>
					</tr>
					<tr>
						<td><b>접수상태</b></td>
						<td>${data.status}</td>
					</tr>
					<tr>
						<td style="display: none;">문의날짜</td>
						<td style="display: none;"><fmt:formatDate
								value="${data.write_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col" style="text-align: left;">

				<a href="<c:url value="/inquiry/lost"/>" role="button"
					class="btn btn-outline-dark" style="width: 100px;">뒤로가기</a>
			</div>
			<div class="col" style="text-align: right;">
				<a href="/inquiry/lost/update?seq=${data.seq}" role="button"
					class="btn btn-outline-dark" style="width: 100px;">수정</a> <a
					href="/inquiry/lost/delete?seq=${data.seq}" role="button"
					class="btn btn-outline-danger" style="width: 100px;">삭제</a>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>