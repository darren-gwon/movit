<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="<%=request.getContextPath()%>" />
<!doctype html>
<html>
<head>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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

.btn {
    display: inline-block;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    background-color: transparent;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    border-radius: 0.25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

</style>
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
		var url = "/faq/del"; //Controller로 보내고자하는 URL
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
							location.replace("/faq?num=1") //faq로 맵핑 페이지 새로고침
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
		  location.href = "/faq?num&keyword=" + keyword;
		 };
</script>


<meta charset="utf-8">

</head>

<body>
	<div class="content">
		<form name="userForm">
			<div class="container">
				<div class="row">
					<div class="col-1"></div>
					<div class="col" style="text-align: center;">
						<img src="/resources/image/InquiryFAQ_TOP.png" width="1300px;">
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			<br> <br>

			<div class="container" style="text-align: right;">
				<div class="row" style="font-size: 15px;">
					<div class="col-5"></div>
					<div class="col-6" style="text-align: right;">
						<input type="search" class="form-control" placeholder="문의유형 키워드 입력" id="keyword"
							aria-label="Search" style="text-align: center;">
					</div>

					<div class="col-1" style="text-align: right;">
						<button type="button" style="width: 100px; height: 38px;" onclick="search()"
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
									<c:if test="${sessionScope.user_id == 'admin' }">
										<th><input id="allCheck" type="checkbox" name="allCheck" /></th>
									</c:if>
									<th>번호</th>
									<th>문의유형</th>
									<th>제목</th>
									<th>문의날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="faq" varStatus="i">
									<tr>
										<c:if test="${sessionScope.user_id == 'admin' }">
										<td><input name="RowCheck" type="checkbox"
											value="${faq.seq}" /></td></c:if>										
										<td><c:out value="${displaypost+i.count}" /></td>
										<td>${faq.inquiry_type}&nbsp;</td>
										<td style="width: 900px;"><a
											href="faq/detail?seq=${faq.seq}">${faq.title}&nbsp;</a></td>
										
										<td><fmt:formatDate value="${faq.write_date}"
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
					<center>
					<div class="col">
						<c:if test="${prev}">

							<a class="btn btn-outline-dark" href="/fqq?num=${startpagenum - 1}">〈</a>

						</c:if>
						<c:forEach begin="${startpagenum}" end="${endpagenum}" var="num">
							<span> <c:if test="${num!=select}">
									<a class="btn btn-outline-dark" href="/faq?num=${num}">${num}</a>
								</c:if>
							</span>
							<span> <c:if test="${num==select}">
									<b><a class="btn btn-outline-dark" href="/faq?num=${num}">${num}</a></b>
								</c:if>
							</span>
						</c:forEach>
						<c:if test="${next}">
							<a class="btn btn-outline-dark" href="/faq?num=${endpagenum + 1}">〉</a>
						</c:if>
					</div>
					</center>
					
					<div class="col" style="text-align: left;">
						<a href="<c:url value='/support'/>" role="button" class="btn btn-outline-dark" style="width: 100px;">뒤로가기</a>
					</div>
					
					
					<div class="col" style="text-align: right;">
					<c:if test="${sessionScope.user_id == 'admin' }">
						<a href="<c:url value='faq/write'/>" role="button" class="btn btn-outline-dark" style="width: 100px;">글쓰기</a>

						<input type="button" class="btn btn-outline-danger" style="width: 100px;" value="선택삭제" onclick="deleteValue();">
					</c:if></div>
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