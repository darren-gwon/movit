<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<form action="insert" method="post">
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
					<div class="col" style="text-align: center;">
						<img src="../../image/InquiryFAQ_TOP.png" width="1200px;">
					</div>
				<div class="col-1"></div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					<br> <br>
					<div class="form-floating">
						<select class="form-select" id="floatingSelect"
							aria-label="Floating label select example" name="inquiry_type">
							<option value=""></option>
							<option value="영화예매">영화예매</option>
							<option value="할인혜택">할인혜택</option>
							<option value="결제수단">결제수단</option>
							<option value="멤버십">멤버십</option>
							<option value="VIP">VIP</option>
							<option value="극장">극장</option>
							<option value="특별관">특별관</option>
							<option value="홈페이지">홈페이지</option>
						</select> <label for="floatingSelect">FAQ Type Select</label>
					</div>

					<br>

					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">FAQ
							글 제목</span> <input type="text" class="form-control" name="title"
							placeholder="글 제목을 입력해주세요." aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>

					<div class="input-group">
						<span class="input-group-text">FAQ 글 내용</span>
						<textarea class="form-control" aria-label="With textarea"
							name="content" placeholder="내용을 작성해주세요." style="padding-bottom: 300px;"></textarea>
					</div>
					<br>
					<hr>
					<br>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col">

					<a href="<c:url value='/inquiry/faq'/>" role="button"
						class="btn btn-outline-dark" style="width: 100px;">뒤로가기</a>
				</div>
				<div class="col" style="text-align: right;">
					<button type="submit" class="btn btn-outline-dark"
						style="width: 100px;">등록</button>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
<br><br><br><br><br><br>
	</form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>