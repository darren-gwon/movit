<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
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
		var url = "/inquiry/del"; //Controller로 보내고자하는 URL
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
					url : url, // 전송 URL
					type : 'POST', //POST 방식
					traditional : true,
					data : {
						valueArr : valueArr
					//보내고자 하는 data 변수 설정
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("삭제 성공");
							location.replace("/inquiry?num=1"); //list로 맵핑 페이지 새로고침
						} else {
							alert("삭제 실패");
						}
					}
				});
			}
		}
	}
	 function search() {
		  
		  keyword = document.getElementById("keyword").value;
		  
		  console.log(keyword)
		  location.href = "/inquiry?num&keyword=" + keyword;
		 };
</script>

</head>
<style>
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
						<img src="/resources/image/inquirytop.png" width="1300px;">
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
							id="keyword" aria-label="Search" style="text-align: center;">
					</div>

					<div class="col-1" style="text-align: right;">
						<button type="button" style="width: 100px; height: 38px;"
							onclick="search()" class="btn btn-outline-dark">
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
									<c:if test="${sessionScope.user_id == 'admin' }">
										<th><input id="allCheck" type="checkbox" name="allCheck" /></th>
									</c:if>
									<th>번호</th>
									<th>문의유형</th>
									<th>영화관</th>
									<th>글제목</th>
									<th>ID</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${list}" var="inquiry" varStatus="i">

									<tr>
										<c:if test="${sessionScope.user_id == 'admin' }">
											<td><input name="RowCheck" type="checkbox"
												value="${inquiry.seq}" /></td>
										</c:if>
										<td><c:out value="${displaypost+i.count}" /></td>
										<td>${inquiry.inquiry_type}&nbsp;</td>

										<td>${inquiry.theater_id}</td>
										<td style="width: 900px;"><a
											href="${root}/inquiry/detail?seq=${inquiry.seq}">${inquiry.title}&nbsp;</a></td>
										
										<td>${inquiry.user_id}</td>
										<td class="text_ct"><fmt:formatDate
												value="${inquiry.write_date}" pattern="yyyy/MM/dd" /></td>
										<td>${inquiry.view_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<br>


			<center>
				<div class="col">
					<c:if test="${prev}">

						<a class="btn btn-outline-dark"
							href="/inquiry?num=${startpagenum - 1}">〈</a>

					</c:if>
					<c:forEach begin="${startpagenum}" end="${endpagenum}" var="num">
						<span> <c:if test="${num!=select}">
								<a class="btn btn-outline-dark" href="/inquiry?num=${num}">${num}</a>
							</c:if>
						</span>
						<span> <c:if test="${num==select}">
								<b><a class="btn btn-outline-dark"
									href="/inquiry?num=${num}">${num}</a></b>
							</c:if>
						</span>
					</c:forEach>
					<c:if test="${next}">
						<a class="btn btn-outline-dark"
							href="/inquiry?num=${endpagenum + 1}">〉</a>
					</c:if>

				</div>
			</center>

			<div class="container">
				<div class="row">
					<div class="col-10" style="text-align: left;">
						<a href="<c:url value='/support'/>" role="button"
							class="btn btn-outline-dark" style="width: 100px;">뒤로가기</a>
					</div>

					<div class="col-1">
						<c:if test="${sessionScope.user_id == 'admin'}">
							<input type="button" class="btn btn-outline-danger"
								style="width: 100px;" value="선택삭제" onclick="deleteValue();">
						</c:if>
					</div>
					
					<div class="col-1" style="text-align: right;">
						<a href="<c:url value='/inquiry/write'/>" role="button"
							class="btn btn-outline-dark" style="width: 100px;">글쓰기</a>
					</div>
				</div>

				<br> <br> <br> <br> <br> <br>
			</div>
		</form>
	</div>
	

</body>
</html>