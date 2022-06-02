<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/5d8badcf1a.js"
	crossorigin="anonymous"></script>



<script type="text/javascript">
	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue() {

		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {//선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				$.ajax({
					url : "lost/delete", // 전송 URL
					type : 'POST', //POST 방식
					traditional : true,
					data : {
						valueArr : valueArr
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("삭제 성공");
							location.replace("lost") //lost로 맵핑 페이지 새로고침
						} else {
							alert("삭제 실패");
						}
					}
				});
			}
		}
	}
</script>



</head>
<style type="text/css">
table.table-hover {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table-hover th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table-hover td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.container a {
	text-decoration: none;
}
</style>
<body>
	<div class="content">
		<form name="userForm">
			<div class="container">
				<div class="row">
					<div class="col-1"></div>
					<div class="col" style="text-align: center;">
						<img src="/resources/image/lostTop.png" width="1300px;">
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			<br> <br>

			<div class="container" style="text-align: right;">
				<div class="row" style="font-size: 15px;">
					<div class="col-5"></div>
					<div class="col-6" style="text-align: right;">
						<input type="search" class="form-control" placeholder="키워드 입력"
							aria-label="Search" style="text-align: center;">
					</div>

					<div class="col-1" style="text-align: right;">
						<button type="button" style="width: 100px; height: 38px;"
							class="btn btn-outline-dark">
							<p class=font-monospace>검색하기</p>
						</button>
					</div>
				</div>
			</div>

				<br>

			<div class="container">
				<div class="row">
					<div class="col">
						<table class="table table-hover"
							style="text-align: center; font-size: 15px;">
							<thead>
								<tr>
									<th><input id="allCheck" type="checkbox" name="allCheck" /></th>
									<th>번호</th>
									<th>영화관</th>
									<th>제목</th>
									<th>접수상태</th>
									<th>등록일</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach items="${list}" var="lost">
									<tr>
										<td><input name="RowCheck" type="checkbox"
											value="${lost.seq}" /></td>
										<td>${lost.seq}&nbsp;</td>
										<td>${lost.theaterID}&nbsp;</td>

										<td style="width: 900px;"><a
											href="lost/detail?seq=${lost.seq}">${lost.title}&nbsp;</a></td>

										<c:set var="accept" value="${lost.status}"></c:set>

										<td><c:if test="${accept=='1'}">미답변&nbsp;</c:if>
											<c:if test="${accept=='2'}">답변완료&nbsp;</c:if></td>


										<td><fmt:formatDate value="${lost.write_date}"
												pattern="yyyy/MM/dd" /></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<br>
		
			<div class="container">
				<div class="row">
					<div class="col" style="text-align: left;">
						<a href="<c:url value='/inquiry/home'/>" role="button"
							class="btn btn-outline-dark" style="width: 100px;">뒤로가기</a>
					</div>
					<div class="col" style="text-align: right;">
						<a href="<c:url value='/inquiry/lost/insert'/>" role="button"
							class="btn btn-outline-dark" style="width: 100px;">글쓰기</a> <input
							type="button" class="btn btn-outline-danger"
							style="width: 100px;" value="선택삭제" onclick="deleteValue();">
					</div>
				</div>

				<br> <br> <br> <br> <br> <br>
			</div>


		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>