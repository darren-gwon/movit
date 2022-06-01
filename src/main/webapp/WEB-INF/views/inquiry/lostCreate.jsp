<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta charset="UTF-8">
</head>
<body>
<div class= "content">
	<form action="insert" method="post">
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col" style="text-align: center;">
					<img src="/resources/image/lostTop.png" width="1200px;">
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
							aria-label="Floating label select example" name="theaterID">
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
						</select><label for="floatingSelect">Theater Place Select</label>
					</div>

					<br>

					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">분실물
							타입 </span> <input type="text" class="form-control" name="item_type"
							placeholder="고객님의 분실물 타입을 입력해주세요."
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text">분실글 제목</span> <input type="text"
							class="form-control" name="title" placeholder="글제목을 작성해주세요."
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text">분실글 내용</span>
						<textarea class="form-control" aria-label="With textarea"
							name="content" placeholder="내용을 작성해주세요."
							style="padding-bottom: 300px;"></textarea>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text">분실 날짜必</span> <input type="date"
							name="lost_date" id="lost_date" value="2022-01-01" style="width: 300px;">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">분실물 처리</span>
						<div class="form-floating">
							<select class="form-select" id="floatingSelect"
								aria-label="Floating label select example" name="status" style="width: 300px;">
								<option value="01">미답변</option>
								<option value="02">답변완료</option>
							</select><label for="floatingSelect">Status Select</label>
						</div>
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
				<div class="col" style="text-align: left;">

					<a href="<c:url value='/inquiry/lost'/>" role="button"
						class="btn btn-outline-dark" style="width: 100px;">뒤로가기</a>
				</div>
				<div class="col" style="text-align: right;">
					<button type="submit" class="btn btn-outline-dark"
						style="width: 100px;">등록</button>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

	</form>
	</div>
</body>
</html>