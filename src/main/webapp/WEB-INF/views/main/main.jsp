<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/main.css" rel='stylesheet' />
<div class="content">
	<div class="movieSlide_wrap">
		<div id="movieSlide" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/resources/img/main/banner/banner_1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/resources/img/main/banner/banner_2.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#movieSlide" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#movieSlide" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
			</button>
		</div>
		<div class="movie_poster_wrap">
			<div class="movie_poster first">
				<img src="https://img.megabox.co.kr/SharedImg/2022/05/04/4OFqLBLmda67a6BPXjaXCVM5wun7FAtb_420.jpg" class="poster_img"> <span class="movie_title">12닥터 스트레인지: 대혼돈의 멀티버스</span>
			</div>
			<div class="movie_poster">
				<img src="https://img.megabox.co.kr/SharedImg/2022/04/29/Sj4v7jaCicFTLrGgxM5D0lRsrL3kgu8g_420.jpg" class="poster_img"> <span class="movie_title">12닥터 스트레인지: 대혼돈의 멀티버스</span>
			</div>
			<div class="movie_poster">
				<img src="https://img.megabox.co.kr/SharedImg/2022/04/06/7YDE8KC4uv7RH6F57pTYUhS7IygSxYTF_420.jpg" class="poster_img"> <span class="movie_title">12닥터 스트레인지: 대혼돈의 멀티버스</span>
			</div>
			<div class="movie_poster last">
				<img src="https://img.megabox.co.kr/SharedImg/2022/03/25/p02Tj8NeXivFyhGgMGm3DD0kdeogGkkA_420.jpg" class="poster_img"> <span class="movie_title">12닥터 스트레인지: 대혼돈의 멀티버스</span>
			</div>
		</div>
	</div>
	<div class="nav_wrap">
		<div class="nav mypage">
			<a href="mypage/home"> <img src="/resources/img/main/nav/mypage.png" id="mypage_img" class="nav_img"> <span class="nav_name">마이페이지</span>
			</a>
		</div>
		<div class="nav event">
			<a href="event/eventlist"> <img src="/resources/img/main/nav/event.png" id="event_img" class="nav_img"> <span class="nav_name">이벤트</span>
			</a>
		</div>
		<div class="nav booking">
			<a href="booking"> <img src="/resources/img/main/nav/booking.png" id="booking_img" class="nav_img"> <span class="nav_name">예매</span>
			</a>
		</div>
		<div class="nav movies">
			<a href="movie"> <img src="/resources/img/main/nav/movies.png" id="movies_img" class="nav_img"> <span class="nav_name">현재상영작</span>
			</a>
		</div>
		<div class="nav support last">
			<a href="inquiry/home"> <img src="/resources/img/main/nav/support.png" id="support_img" class="nav_img"> <span class="nav_name">고객센터</span>
			</a>
		</div>
	</div>
	<div class="event_wrap">event</div>

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
					<tr>
						<td class="title">[공지] 공지사항입니다123456</td>
						<td class="date">2022-05-31</td>
					</tr>
					<tr>
						<td class="title">[공지] 공지사항입니다123456</td>
						<td class="date">2022-05-31</td>
					</tr>
					<tr>
						<td class="title">[공지] 공지사항입니다123456</td>
						<td class="date">2022-05-31</td>
					</tr>
					<tr>
						<td class="title">[공지] 공지사항입니다123456</td>
						<td class="date">2022-05-31</td>
					</tr>
					<tr>
						<td class="title">[공지] 공지사항입니다123456</td>
						<td class="date">2022-05-31</td>
					</tr>
				</table>
			</div>
			<div class="sns">
				<h3>SNS</h3>
				<hr>
				<div class="">
					<a href="https://facebook.com" target="_blank"><img src="/resources/img/main/sns/facebook.png" class="sns_icon"></a> <a href="https://youtube.com" target="_blank"><img src="/resources/img/main/sns/youtube.png" class="sns_icon"></a> <a href="https://instagram.com" target="_blank"><img src="/resources/img/main/sns/instagram.png" class="sns_icon last"></a>
				</div>
			</div>
		</div>
	</div>
</div>