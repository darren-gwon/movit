<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
		body
		{
			border: 1px solid black;
			width: 800px;
			height: 1100px;
		}
		th
		{
			border: 1px solid black;
		}
		td
		{
			border: 1px solid black;
		}
	</style>
<body>
<h2>Detail Page</h2>
<table border="1">	
	<th>정보</th>
	<th>데이터</th>
	<tr>
		<td>글번호</td><td>${data.seq}</td>
	</tr>
	<tr>
		<td>영화관</td><td>${data.theaterID}</td>
	</tr>
	<tr>
		<td>분실물 유형</td><td>${data.item_type}</td>
	</tr>
	<tr>
		<td>잃어버린 날짜</td><td>${data.lost_date}</td>
	</tr>
	<tr>
		<td>글제목</td><td>${data.title}</td>
	</tr>
	<tr>
		<td>글내용</td><td>${data.content}</td>
	</tr>
	<tr>
		<td>첨부파일</td><td>${data.fileID}</td>
	</tr>
	<tr>
		<td>접수상태</td><td>${data.status}</td>
	</tr>
	<tr>
		<td>작성일자</td>
		<td><fmt:formatDate value="${data.write_date}" pattern="yyyy-MM-dd" />
		</td>
	</tr>
</table>


	<a href="/inquiry/lost/update?seq=${data.seq}" role="button">수정</a>
	<a href="/inquiry/lost/delete?seq=${data.seq}" role="button">삭제</a>
	<button type="button" style="width: 100px; height: 50px; margin-left: 10px"><a href="/inquiry/lost">돌아가기</a></button>
</body>
</html>