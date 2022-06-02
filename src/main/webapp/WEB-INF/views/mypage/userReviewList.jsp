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
div.reviewdiv{
	border-bottom: 1px solid #ced4da;
	width: 1200px;
	height:130px;
	float: left;
	padding-top: 30px;
	padding-right:100px;
	margin-left: 150px;
	
}
ul.reviewlist{
	margin-top: 10px;
	left:0px;
	width: 350px;
	height: 200px;
	display:inline-block;
}

pre {
	display:inline-block;
	padding-bottom: 150px;
	width: 300px;
	text-align: left;
	padding-left: 50px;
}

.writeday {
	font-size: 0.7em;
	color: #ced4da;
}
strong{
	font-size: 1.2em;
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
		<c:forEach var="list" items="${list }">
			<div class="reviewdiv">
				<ul class="reviewlist">
					<li><strong>${list.title }</strong></li>
					<li>
						<span>${list.user_id }</span>
						<span class="writeday">${list.write_date }</span>
					</li>
					<li><span><img style="width:15px;"src="/resources/review_img/heart.png">&nbsp;${list.total_likes }</span></li>
				</ul>
			
					<pre>${list.content }</pre>
			</div>
		</c:forEach>
		
	</div>
	</c:if>
</body>
</html>