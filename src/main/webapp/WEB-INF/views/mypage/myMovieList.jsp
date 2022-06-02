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
		width: 350px;
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
					<th colspan="6">내가 본 영화</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list }">
				<tr>
					<th>영화제목</th>
					<td>${list.item_name }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${list.user_id }</td>
				</tr>
				<tr>
					<th>상영일시</th>
					<td><fmt:formatDate value="${list.booking_time }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
			</c:forEach>
			<tbody>
		</table>
	</div>
	</c:if>
</body>
</html>