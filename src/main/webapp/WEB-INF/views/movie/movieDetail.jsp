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

<style>
* {
	margin: 0;
	padding: 0;
}

.section input[id*="slide"] {
	display: none;
}

.section .slidewrap {
	max-width: 1200px;
	margin: 0 auto;
}

.section .slidelist {
	white-space: nowrap;
	font-size: 0;
	overflow: hidden;
	position: relative;
}

.section .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.section .slidelist>li>a {
	display: block;
	position: relative;
}

.section .slidelist>li>a img {
	width: 100%;
}

.section .slidelist label {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.section .slidelist .textbox {
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	line-height: 1.6;
	text-align: center;
}

.section .slidelist .textbox h3 {
	font-size: 36px;
	color: #fff;;
	transform: translateY(30px);
	transition: all .5s;
}

.section .slidelist .textbox p {
	font-size: 16px;
	color: #fff;
	opacity: 0;
	transform: translateY(30px);
	transition: all .5s;
}

/* input에 체크되면 슬라이드 효과 */
.section input[id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}

.section input[id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-101%);
}

.section input[id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-202%);
}

/* input에 체크되면 텍스트 효과 */
.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
}

.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .4s;
}

.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
}

.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .4s;
}

.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
}

.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .4s;
}

/* 좌,우 슬라이드 버튼 */
.slide-control>div {
	display: none;
}

.section .left {
	left: 30px;
	background: url('../movie_detail_bottom_slide/left.png') center center/100%
		no-repeat;
}

.section .right {
	right: 30px;
	background: url('../movie_detail_bottom_slide/right.png') center center/100%
		no-repeat;
}

.section input[id="slide01"]:checked ~ .slidewrap .slide-control>div:nth-child(1)
	{
	display: block;
}

.section input[id="slide02"]:checked ~ .slidewrap .slide-control>div:nth-child(2)
	{
	display: block;
}

.section input[id="slide03"]:checked ~ .slidewrap .slide-control>div:nth-child(3)
	{
	display: block;
}

/* 페이징 */
.slide-pagelist {
	text-align: center;
	padding: 20px;
}

.slide-pagelist>li {
	display: inline-block;
	vertical-align: middle;
}

.slide-pagelist>li>label {
	display: block;
	padding: 8px 10px;
	border-radius: 30px;
	background: #ccc;
	margin: 20px 10px;
	cursor: pointer;
}

.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(1)>label
	{
	background: #999;
}

.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(2)>label
	{
	background: #999;
}

.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(3)>label
	{
	background: #999;
}

</style>

</head>

<body>

	<div class="container" style="text-align: center;">
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<div class="col">
				<img src="../movie_poster_image/moviewMain2.png"
					style="width: 1300px; height: 700px; object-fit: cover;">
			</div>
		</div>
		<br> <br>
		<div class="row" style="text-align: left; font-size: 17px;">
			<div class="col">
				<h1 class="font-monospace">Movie Detail</h1>
				<br> <br>
			</div>
			<hr>
			<br>
		</div>

	</div>


	<div class="container">
		<div class="row row-cols-2 row-cols-md-4 g-4">
			<div class="col">
				<div class="movielist">
					<figure>
						<img src="../movie_poster_image/movie_list1.jpg">
					</figure>
					<br>
					<div class="col" style="text-align: left;">
						<h4 class="font-monospace" style="margin-left: 20px">
							연령층 <b>범죄도시2</b>
						</h4>
					</div>
					<br>
					<div class="col" style="text-align: center;">
						<button type="button" class="btn btn-outline-primary"
							style="width: 130px;">예매하기</button>

						<button type="button" class="btn btn-outline-secondary"
							style="width: 130px;">상세보기</button>
					</div>
					<br>
						<div class="row row-cols-2 row-cols-md-4 g-4">
							<p>asddasd</p>
						</div>
				</div>
				
			</div>
		</div>
		
	</div>

		

	<br>
	<br>
	<div class="container">
		<div class="row row-cols-2 row-cols-md-4 g-4">
			<div class="col">
				<div class="movielist">
					<figure>
						<img src="../movie_poster_image/movie_list17.jpg">
					</figure>
					<br>
					<div class="col" style="text-align: left;">
						<h4 class="font-monospace" style="margin-left: 20px">
							연령층 <b>범죄도시2</b>
						</h4>
					</div>
					<br>
					<div class="col" style="text-align: center;">
						<button type="button" class="btn btn-outline-primary"
							style="width: 130px;">예매하기</button>

						<button type="button" class="btn btn-outline-secondary"
							style="width: 130px;">상세보기</button>
					</div>
					<br>
				</div>
			</div>



			<div class="col">
				<div class="movielist">
					<figure>
						<img src="../movie_poster_image/movie_list18.jpg">
					</figure>
					<br>
					<div class="col" style="text-align: left;">
						<h4 class="font-monospace" style="margin-left: 20px">
							연령층 <b>범죄도시2</b>
						</h4>
					</div>
					<br>
					<div class="col" style="text-align: center;">
						<button type="button" class="btn btn-outline-primary"
							style="width: 130px;">예매하기</button>

						<button type="button" class="btn btn-outline-secondary"
							style="width: 130px;">상세보기</button>
					</div>
					<br>
				</div>
			</div>

			<div class="col">
				<div class="movielist">
					<figure>
						<img src="../movie_poster_image/movie_list19.jpg">
					</figure>
					<br>
					<div class="col" style="text-align: left;">
						<h4 class="font-monospace" style="margin-left: 20px">
							연령층 <b>범죄도시2</b>
						</h4>
					</div>
					<br>
					<div class="col" style="text-align: center;">
						<button type="button" class="btn btn-outline-primary"
							style="width: 130px;">예매하기</button>

						<button type="button" class="btn btn-outline-secondary"
							style="width: 130px;">상세보기</button>
					</div>
					<br>
				</div>
			</div>

			<div class="col">
				<div class="movielist">
					<figure>
						<img src="../movie_poster_image/movie_list20.jpg">
					</figure>
					<br>
					<div class="col" style="text-align: left;">
						<h4 class="font-monospace" style="margin-left: 20px">
							연령층 <b>범죄도시2</b>
						</h4>
					</div>
					<br>
					<div class="col" style="text-align: center;">
						<button type="button" class="btn btn-outline-primary"
							style="width: 130px;">예매하기</button>

						<button type="button" class="btn btn-outline-secondary"
							style="width: 130px;">상세보기</button>
					</div>
					<br>
				</div>
			</div>
		</div>

	<!--  -->
		<div class="section">
			<input type="radio" name="slide" id="slide01" checked> <input
				type="radio" name="slide" id="slide02"> <input type="radio"
				name="slide" id="slide03">
			<div class="slidewrap">

				<ul class="slidelist">
					<!-- 슬라이드 영역 -->
					<li class="slideitem"><a>
					<img src="../movie_detail_bottom_slide/the_roundup_bottom_slide_0.jpg" style="width: 100%">
					</a></li>
					<li class="slideitem"><a>
					<img src="../movie_detail_bottom_slide/the_roundup_bottom_slide_1.jpg" style="width: 100%">
					</a></li>
					<li class="slideitem"><a>
					<img src="../movie_detail_bottom_slide/the_roundup_bottom_slide_2.jpg" style="width: 100%">
					</a></li>

					<!-- 좌,우 슬라이드 버튼 -->
					<div class="slide-control">
						<div>
							<label for="slide03" class="left"></label> <label for="slide02"
								class="right"></label>
						</div>
						<div>
							<label for="slide01" class="left"></label> <label for="slide03"
								class="right"></label>
						</div>
						<div>
							<label for="slide02" class="left"></label> <label for="slide01"
								class="right"></label>
						</div>
					</div>

				</ul>
				<!-- 페이징 -->
				<ul class="slide-pagelist">
					<li><label for="slide01"></label></li>
					<li><label for="slide02"></label></li>
					<li><label for="slide03"></label></li>
				</ul>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>