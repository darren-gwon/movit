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
<style>
	table.type09 {
		border-collapse: collapse;
		text-align: left;
		line-height: 1.5;
		margin : 0 auto ;
	}
	
	table.type09 thead th {
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		color: #369;
		border-bottom: 3px solid #036;
		font-size: 1.3em;
	}
	
	table.type09 tbody th {
		width: 100px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		background: #f3f6f7;
	}
	
	table.type09 td {
		width: 150px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="mypageHeader.jsp"/>
	<c:if test="${sessionScope.user_id ==null }">
		<br><br>
		<h3>로그인이 필요한 서비스입니다.</h3>
		<br><br>
	</c:if>
	<c:if test="${sessionScope.user_id != null }">
	<div class="content">
		<table class="type09">
			<thead>
				<tr>
					<th colspan="6">나의 분실물 문의내역</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${count==0 }">
				<tr>
					<td style="text-align:center;width:300px">
						등록하신 문의내역이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${list }">
				<tr>
					<th>분실물 종류</th>
					<td>${list.item_type }</td>
					<th>아이디</th>
					<td>${list.user_id }</td>
					<th>글 작성일</th>
					<td><fmt:formatDate value="${list.write_date }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<th>분실장소</th>
					<td>${list.theaterID }관</td>
					<th>분실날짜</th>
					<td colspan="3">${list.lost_date }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5">${list.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5">${list.content }</td>
				</tr>
				<tr>
					<td colspan="6"></td>
				</tr>
			</c:forEach>
			<tbody>
		</table>
	</div>
	</c:if>
</body>
</html>