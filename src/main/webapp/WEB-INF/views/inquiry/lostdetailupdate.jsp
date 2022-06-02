<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<div class= "content">
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col" style="text-align: center;">
				<img src="/resources/image/lostTop.png" width="1300px;">
			</div>
			<div class="col-1"></div>
		</div>

	</div>

	<form name="lostupdate" method="post" action="update?seq=${data.seq}">
		<input type="hidden" value="${data.seq}">



		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					<br> <br>
					<div class="form-floating">
						<select class="form-select" id="floatingSelect"
							aria-label="Floating label select example" name="theaterID">

							<option value="${data.theaterID}">${data.theaterID}</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
						</select><label for="floatingSelect">Select Place</label>
					</div>
					<br>


					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">문의
							제목</span> <input type="text" class="form-control" name="title"
							value="${data.title}" placeholder="title 입력해주세요"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>


					<div class="input-group mb-3">
						<span class="input-group-text">문의 내용</span>
						<textarea class="form-control" aria-label="With textarea"
							style="padding-bottom: 300px;" name="content"
							placeholder="content 작성해주세요.">${data.content}</textarea>
						<br />
					</div>
				
					<div class="input-group mb-3">
						<span class="input-group-text">분실 날짜</span>
						<input type="date" name="lost_date" id="lost_date" style="width: 300px;" value="2022-01-01">
					</div>
					
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">답변 상태</span>
						<div class="form-floating">
							<select class="form-select" id="floatingSelect"
								aria-label="Floating label select example" name="status" style="width: 300px;">
								<option value="01">미답변</option>
								<option value="02">답변완료</option>
							</select><label for="floatingSelect">Status Select</label>
						</div>
					</div>
					
					
					
					
					

					<div style="display: none;">작성일자</div>
					<br>

					<div id="mvDiv" class="input-group mb-3" style="display: none;">

						<div>
							<fmt:formatDate value="${data.write_date}" pattern="yyyy-MM-dd" />
						</div>
					</div>

					
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
						style="width: 100px;">완료</button>

					<button type="reset" class="btn btn-outline-dark"
						style="width: 100px;">리셋</button>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<br> <br> <br>
		<br>
		<br>
		<br>

	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		</div>
</body>
</html>