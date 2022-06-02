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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class= "content">
	<form action="insert" method="post">
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col" style="text-align: center;">
					<img src="/resources/image/inquirytop.png" width="1300px;">
				</div>
				<div class="col-1"></div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col">
					<br> <br>
					<div class="form-floating">
						<select class="form-select" id="floatingSelect"
							name="inquiry_type" aria-label="Floating label select example">
							<option value="일반문의">일반문의</option>
							<option value="칭찬">칭찬</option>
							<option value="불만사항">불만사항</option>
							<option value="영화예매">영화예매</option>
							<option value="할인혜택">할인혜택</option>
							<option value="홈페이지">홈페이지</option>
							<option value="기타">기타</option>
						</select><label for="floatingSelect">Inquiry Type Select</label>
					</div>
						
					<br>
					
					<div class="form-floating">
						<select class="form-select" id="floatingSelect"
							aria-label="Floating label select example" name="theaterID">
							<option value="01">1</option> <c:set var="name" value="1" /><c:if test="${name eq '1'}">강남점<c:out value="${str}"/></c:if>
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
						<span class="input-group-text" id="inputGroup-sizing-default">문의글 제목</span> <input type="text" class="form-control" name="title"
							placeholder="글 제목을 입력해주세요." aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default">
					</div>

					<div class="input-group">
						<span class="input-group-text">문의글 내용</span>
						<textarea class="form-control" aria-label="With textarea"
							name="content" placeholder="내용을 작성해주세요."
							style="padding-bottom: 300px;"></textarea>
					</div>
					<br>
					<hr>
					<br>
				</div>
			</div>
		</div>


		<div class="container">
			<div class="row">
				
				<div class="col" style="text-align: left;">

					<a onclick="history.back()" role="button"
						class="btn btn-outline-dark" style="width: 100px; text-align: left;">뒤로가기</a>
				</div>
				<div class="col" style="text-align: right;" ><a href="http://localhost:9005/inquiry/listpage?seq=1">
					<button type="submit" class="btn btn-outline-dark"
						style="width: 100px;">등록</button></a>
				</div>
			</div>
		</div>
<br><br><br><br><br><br>
	</form>
</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>