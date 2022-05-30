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
		<td>질문유형</td><td>${data.inquiry_type}</td>
	</tr>
	<tr>
		<td>글제목</td><td>${data.title}</td>
	</tr>
	<tr>
		<td>글내용</td><td>${data.content}</td>
	</tr>
	<tr>
		<td>작성일자</td>
		<td><fmt:formatDate value="${data.write_date}" pattern="yyyy-MM-dd" />
		</td>
	</tr>
</table>
	<a href="/semiproj/inquiry/list/update?seq=${data.seq}" role="button">수정</a>
	<a href="/semiproj/inquiry/list/delete?seq=${data.seq}" role="button">삭제</a>
	<button type="button" style="width: 100px; height: 50px; margin-left: 10px"><a href="/semiproj/inquiry/list">돌아가기</a></button>
</body>
</html>