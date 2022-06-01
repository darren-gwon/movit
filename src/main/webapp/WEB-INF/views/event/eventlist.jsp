<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/eventlist.css" rel='stylesheet' />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content">
	<h2 class="title">EVENT</h2>
	<div class="slidebox">
		<input type="radio" name="slide" id="slide01" checked> <input type="radio" name="slide" id="slide02"> <input type="radio" name="slide" id="slide03"> <input type="radio" name="slide" id="slide04">
		<ul class="slidelist">
			<li class="slideitem"><a><img src="../resources/cssimg/img1.jpg"></a></li>
			<li class="slideitem"><a><img src="../resources/cssimg/img2.jpg"></a></li>
			<li class="slideitem"><a><img src="../resources/cssimg/img3.jpg"></a></li>
			<li class="slideitem"><a><img src="../resources/cssimg/img4.jpg"></a></li>
		</ul>
		<div class="slide-control">
			<div class="control01">
				<label for="slide04" class="prev"></label> <label for="slide02" class="next"></label>
			</div>
			<div class="control02">
				<label for="slide01" class="prev"></label> <label for="slide03" class="next"></label>
			</div>
			<div class="control03">
				<label for="slide02" class="prev"></label> <label for="slide04" class="next"></label>
			</div>
			<div class="control04">
				<label for="slide03" class="prev"></label> <label for="slide01" class="next"></label>
			</div>
		</div>
	</div>

	<form id="eventform">
		<div class="eventlist">
			<div class="total">전체 ${totalcount}건</div>
			<ul id="newlist">
				<c:forEach items="${list}" var="list">
					<li><a href="../event/eventdetail?num=${list.seq}"> <img src="../resources/thumnail_img/${list.thumbnail_img}"> <br> <br> <b>${list.title}</b> <br> <br>
							<p>
								기 간 :
								<fmt:parseDate value="${list.start_date}" var="dateValue" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
								~
								<fmt:parseDate value="${list.end_date}" var="dateValue" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
							</p></a></li>
				</c:forEach>
			</ul>
			<button type="button" id="morelist" class="btnmore">더보기</button>
			<div class="btn">
				<button type="button" class="btn btn-primary" style="width: 100px;" onclick="location.href='${root}/event/eventwriteform'">관리자<br>글쓰기</button>
			</div>
		</div>
	</form>
</div>
	<script>
		let startnum = 0;
		$("#morelist").click(
		function() {
			startnum += 8;
			var data = {
				"startnum" : startnum
				};

				$.ajax({
				url : "list",
				type : "post",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify({
					"startnum" : startnum
				}),
				success : function(data) {
					var s = "";
					$(data).each(
					function(i, d) {
						s += "<li>";
						s += "<a href='../event/eventdetail?num="
								+ d.seq
								+ "'>";
						s += "<img src='../resources/thumimg/"+d.thumbnail_img+"'>";
						s += "<br>"
								+ "<br>"
						s += "<b>";
						s += d.title;
						s += "</b>";
						s += "<br>"
								+ "<br>"
						s += "<p>";
						s += "기  간 : ";
						s += d.start_date;
						s += " ~ ";
						s += d.end_date;
						s += "</p>";
						s += "</a>";
						s += "</li>";
					});
					$("#newlist").append(s);
				}
			});
		});
</script>