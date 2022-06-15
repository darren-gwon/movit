<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/css/main.css" rel='stylesheet' />
<div class="content">
	<div class="movieSlide_wrap">
		<div id="movieSlide" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href=""> <img
						src="/resources/img/main/banner/banner_1.jpg"
						class="d-block w-100" alt="..."></a>
				</div>
				<div class="carousel-item">
					<a href=""> <img
						src="/resources/img/main/banner/banner_2.jpg"
						class="d-block w-100" alt="..."></a>
				</div>
				<div class="carousel-item">
					<a href=""> <img
						src="/resources/img/main/banner/banner_3.jpg"
						class="d-block w-100" alt="..."></a>
				</div>
				<div class="carousel-item">
					<a href=""> <img
						src="/resources/img/main/banner/banner_4.jpg"
						class="d-block w-100" alt="..."></a>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#movieSlide" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#movieSlide" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<div class="movie_poster_wrap">
			<div class="movie_poster first">
				<a href="../movie/detail?movie_id=20212855"><img
					src="https://img.megabox.co.kr/SharedImg/2022/05/04/4OFqLBLmda67a6BPXjaXCVM5wun7FAtb_420.jpg"
					class="poster_img"></a> <span class="movie_title">닥터
				스트레인지: 대혼돈의 멀티버스</span>
			</div>
			<div class="movie_poster">
				<a href="../movie/detail?movie_id=20204548"><img
					src="https://img.megabox.co.kr/SharedImg/2022/05/23/oZfETtpEvKGpdY2JQo2Z6wFL0S4cpKy5_420.jpg"
					class="poster_img"></a> <span class="movie_title">범죄도시2</span>
			</div>
			<div class="movie_poster">
				<a href="../movie/detail?movie_id=20206061"><img
					src="https://img.megabox.co.kr/SharedImg/2022/05/16/WApIttC9CrStYU7j7jzFRlc2HsIXBQtY_420.jpg"
					class="poster_img"></a> <span class="movie_title">쥬라기 월드:
					도미니언</span>
			</div>
			<div class="movie_poster last">
				<a href="../movie/detail?movie_id=20223278"><img
					src="https://img.megabox.co.kr/SharedImg/2022/02/17/djm7aYuL9bQGZRsxyUH75wATz9ub9ouk_420.jpg"
					class="poster_img"></a> <span class="movie_title">극장판 주술회전
					</span>
			</div>
		</div>
	</div>
	<br> <br>
	<div class="nav_wrap">
		<div class="nav mypage">
			<a style="text-decoration: none; color: black;" href="mypage/home">
				<img src="/resources/img/main/nav/mypage.png" id="mypage_img"
				class="nav_img"> <span class="nav_name">마이페이지</span>
			</a>
		</div>
		<div class="nav event">
			<a style="text-decoration: none; color: black;"
				href="event/eventlist"> <img
				src="/resources/img/main/nav/event.png" id="event_img"
				class="nav_img"> <span class="nav_name">이벤트</span>
			</a>
		</div>
		<div class="nav booking">
			<a style="text-decoration: none; color: black;" href="booking"> <img
				src="/resources/img/main/nav/booking.png" id="booking_img"
				class="nav_img"> <span class="nav_name">예매</span>
			</a>
		</div>
		<div class="nav movies">
			<a style="text-decoration: none; color: black;" href="movie"> <img
				src="/resources/img/main/nav/movies.png" id="movies_img"
				class="nav_img"> <span class="nav_name">현재상영작</span>
			</a>
		</div>
		<div class="nav support last">
			<a style="text-decoration: none; color: black;" href="support">
				<img src="/resources/img/main/nav/support.png" id="support_img"
				class="nav_img"> <span class="nav_name">고객센터</span>
			</a>
		</div>
	</div>
	<br> <br>
	<div class="event_wrap" style="height: 390px; vertical-align: middle;">
		<div class=container>
			<div class="row" style="text-align: center;">

				<div class="col">
					<br> <img width="600px;" height="340px;"
						src="https://caching.lottecinema.co.kr//Media/Event/92398b601eba4e66ae409ca288ea58de.jpg" />
				</div>

				<div class="col">
					<br>
					<iframe width="600" height="340"
						src="https://www.youtube.com/embed/7G8N9QjT4h4?autoplay=1&mute=1"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>

			</div>
		</div>
	</div>
	<div class="event_wrap" style="height: 370px; vertical-align: middle;">
		<div class=container>
			<div class="row" style="text-align: center;">
				<div class="col">
					<img width="600px;" height="340px;"
						src="https://img.megabox.co.kr/SharedImg/event/2022/01/14/PaafbTzHLzAZslfTq3eRZS19bGTV7sG7.jpg" />
				</div>

				<div class="col">
					<iframe width="600px;" height="340px;"
						src="https://www.youtube.com/embed/smd2DODORbk?autoplay=1&mute=1"
						frameborder="0"
						allow="accelerometer; muted; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>

			</div>
		</div>
	</div>


	<div class=container>
		<div class="row">
			<div class="col">
				<div class="bottom_wrap">
					<div class="bottom">
						<div class="notice">

							<h3>공지사항</h3>
							<hr>
							<table class="table table-hover notice_content">
								<!--
 				<tr>
					<th class="title"></th>
					<th class="date"></th>
				</tr>
				-->
								<c:forEach items="${list}" var="list" varStatus="i<4">
									<tr>
										<td class="titles"><a style="text-decoration: none; color: black;"  href="../board/detail?num=${list.seq}">${list.title}</></td>
										<td class="dates">${list.write_date}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="sns">
							<h3>SNS</h3>
							<hr>
							<div class="">
								<a href="https://facebook.com" target="_blank"><img
									src="/resources/img/main/sns/facebook.png" class="sns_icon"></a>
								<a href="https://youtube.com" target="_blank"><img
									src="/resources/img/main/sns/youtube.png" class="sns_icon"></a>
								<a href="https://instagram.com" target="_blank"><img
									src="/resources/img/main/sns/instagram.png"
									class="sns_icon last"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
</div>