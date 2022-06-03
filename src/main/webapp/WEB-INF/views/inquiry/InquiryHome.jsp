<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container a {
	text-decoration: none;
	color: black;
}
</style>
</head>

<body>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col">
					<img src="/resources/image/mainPO.png" width="1300px;">

				</div>
			</div>
			<br>
			<br>
			<hr>
			<br>
			<br>

			<div class="row" style="text-align: center; font-size: 17px;">
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80"><img src="/resources/image/inquiry_home.png" width="110px"><br>
					<br>
					<p class="font-monospace">홈페이지</p></a>
				</div>
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=%ED%95%A0%EC%9D%B8%ED%98%9C%ED%83%9D"><img src="/resources/image/inquiry_tiket.png" width="110px"> <br>
					<br>
					<p class="font-monospace">할인혜택</p></a>
				</div>
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=%EC%98%81%ED%99%94%EC%98%88%EB%A7%A4"><img src="/resources/image/inquiry_discount.png" width="110px"> <br>
					<br>
					<p class="font-monospace">영화예매</p></a>
				</div>
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=%EA%B2%B0%EC%A0%9C%EC%88%98%EB%8B%A8"><img src="/resources/image/inquiry_payment.png" width="110px"> <br>
					<br>
					<p class="font-monospace">결제수단</p></a>
				</div>
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=%EB%A9%A4%EB%B2%84%EC%8B%AD"><img src="/resources/image/inquiry_membership.png" width="110px"> <br>
					<br>
					<p class="font-monospace">멤버십</p></a>
				</div>
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=VIP"><img src="/resources/image/inquiry_vip.png" width="110px"> <br>
					<br>
					<p class="font-monospace">VIP</p></a>
				</div>
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=%EA%B7%B9%EC%9E%A5"><img src="/resources/image/inquiry_theater.png" width="110px"> <br>
					<br>
					<p class="font-monospace">극장</p></a>
				</div>
				<div class="col">
					<a href="../inquiry/faq/list?num&keyword=%ED%8A%B9%EB%B3%84%EA%B4%80"><img src="/resources/image/inquiry_special.png" width="110px"> <br>
					<br>
					<p class="font-monospace">특별관</p></a>
				</div>
			</div>

			<br>
			<br>
			<hr>
			<br>
			<br>

			<div class="row" style="text-align: center; font-size: 20px;">
				<div class="col-4">
					<a href="/inquiry/faq/list"> <img src="/resources/image/inquiryfaq.png"
						width="110px"> <br>
					<br>
						<p class="font-monospace">FAQ ></p></a>
				</div>
				<div class="col-4">
					<a href="/inquiry/list"> <img src="/resources/image/inquirysupport.png"
						width="110px"> <br>
					<br>
						<p class="font-monospace">1:1 문의 ></p></a>
				</div>
				<div class="col-4">
					<a href="/inquiry/lost"> <img src="/resources/image/inquirylost.png"
						width="110px"> <br>
					<br>
						<p class="font-monospace">분실물 신고 ></p></a>
				</div>
			</div>

			<br>
			<br>
			<hr>
			<br>
			<br>

			<div class="row" style="text-align: center; font-size: 20px;">
				<div class="col">
					<p class="font-monospace">
						<b>고객센터 검색</b>
					</p>
				</div>
			</div>

			<div class="row" style="text-align: center; font-size: 20px;">
				<div class="col-4">&nbsp;</div>
				<div class="col-4">
					<input type="search" class="form-control" placeholder="키워드 입력"
						aria-label="Search" style="text-align: center;">
				</div>
				<div class="col-1">
					<button type="button" style="width: 130px; height: 38px;"
						class="btn btn-outline-dark">
						<p class=font-monospace>검색하기</p>
					</button>
					<div class="col-3">&nbsp;</div>
				</div>

			</div>
			<br>
			<br>
			<hr>
			<br>
			<br>

			<div class="row">
				<div class="col">
					<img src="/resources/image/superson.png" width="1300px;">

				</div>
			</div>
			<br>
			<br>
			<hr>
			<br>
			<br>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>