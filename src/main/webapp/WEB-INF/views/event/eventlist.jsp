<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/eventlist.css" rel='stylesheet' />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<<<<<<< HEAD
	.slidebox {max-width:700px;margin:0 auto;position:relative; top:50px;}
	.slidebox .slidelist {position:relative;white-space:nowrap;font-size:0;overflow:hidden;}
	.slidebox .slidelist .slideitem {position:relative;display:inline-block;vertical-align:middle;background-color:#fff;width:100%;transition:all 1s;}
	.slidebox .slidelist .slideitem > a {display:block;width:auto;}
	.slidebox .slidelist .slideitem > a img {width:700px; height: 245px;}

	.slidebox .slide-control [class*="control"] label {position:absolute;z-index:10;top:50%;transform:translateY(-50%);padding:20px;border-radius:50%;cursor:pointer;}
	.slidebox .slide-control [class*="control"] label.prev {left:-50px;background:#333 url('../cssimg/left-arrow.png') center center / 50% no-repeat;}
	.slidebox .slide-control [class*="control"] label.next {right:-50px;background:#333 url('../cssimg/right-arrow.png') center center / 50% no-repeat;}

	[name="slide"] {display:none;}
	#slide01:checked ~ .slidelist .slideitem {left:0;}
	#slide02:checked ~ .slidelist .slideitem {left:-100%;}
	#slide03:checked ~ .slidelist .slideitem {left:-200%;}
	#slide04:checked ~ .slidelist .slideitem {left:-300%;}

	.slide-control [class*="control"] {display:none;}
	#slide01:checked ~ .slide-control .control01 {display:block;}
	#slide02:checked ~ .slide-control .control02 {display:block;}
	#slide03:checked ~ .slide-control .control03 {display:block;}
	#slide04:checked ~ .slide-control .control04 {display:block;}
	
		div.eventlist{
			margin-left: 350px;
			width: 1250px;
			height:1980px;
		}
		ul{
			overflow: hidden;
			margin: -20px 0;
		}
		.eventlist li{
			position:relative;
			display:inline-block;
			width:245px;
			min-height:364px;
			border:1px solid #DDDDDD;
			padding:0;
			list-style-type: none;	
			margin-left: 50px;
			margin-top: 50px;
			border-radius: 10px;
			text-align: center;	
			cursor: pointer;	
			
		}
		* {
			box-sizing: border-box;
			overflow-anchor : none; 
		}
		.btnmore{
			width: 1170px;
			height: 50px;
			text-align: center;
			background-color: #f8f8fa;
			margin: 36px 0 0 0;
			border: 0px;
			font-size: 15px;
			cursor: pointer;
			margin-left:40px;
		}
		.eventlist ul li img{
			border-top-left-radius: 10px;
			border-top-right-radius: 10px;
		}
		.eventlist ul li a{
			text-decoration:none;
			cursor: pointer;
			color: black;
		}
		.eventlist p {
			font-size:14px;
			color:grey;
		}
		div.total{
			font-size: 16px;
			margin-left: 50px;
			margin-top: 100px;
			color:gray;
			font-weight:bold;
		}
		div.btn{
			margin-left:1300px;
		}
		div.slidbakc{
			background-color: #f8f8fa;
			width:100%;
			height:350px;
		}
		h2{
			margin-block-start: 0.83em;
		    margin-block-end: 0.83em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    padding: 0 0 15px 0;
		    margin-left:400px;
		    font-size:30px;
		}
	</style>
</head>
<body>
<h2>EVENT</h2>
<div class="slidbakc">
<div class="slidebox">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<input type="radio" name="slide" id="slide04">
	<ul class="slidelist">
		<li class="slideitem">
			<a><img src="../cssimg/img1.jpg"></a>
		</li>
		<li class="slideitem">
			<a><img src="../cssimg/img2.jpg"></a>
		</li>
		<li class="slideitem">
			<a><img src="../cssimg/img3.jpg"></a>
		</li>
		<li class="slideitem">
			<a><img src="../cssimg/img4.jpg"></a>
		</li>
	</ul>
	<div class="slide-control">
		<div class="control01">
			<label for="slide04" class="prev"></label>
			<label for="slide02" class="next"></label>
		</div>
		<div class="control02">
			<label for="slide01" class="prev"></label>
			<label for="slide03" class="next"></label>
		</div>
		<div class="control03">
			<label for="slide02" class="prev"></label>
			<label for="slide04" class="next"></label>
		</div>
		<div class="control04">
			<label for="slide03" class="prev"></label>
			<label for="slide01" class="next"></label>
		</div>
	</div>
</div>
</div>
	
=======
<div class="content">
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

>>>>>>> main
	<form id="eventform">
		<div class="eventlist">
			<div class="total">전체 ${totalcount}건</div>
			<ul id="newlist">
				<c:forEach items="${list}" var="list">
					<li>
						<a href="../event/eventdetail?num=${list.seq}">				
						<img src="../thumnail_img/${list.thumbnail_img}">				
						<br><br>
						<b>${list.title}</b>
						<br><br>
 						 <p>기  간 : <fmt:parseDate value="${list.start_date}" var="dateValue" pattern="yyyy-MM-dd" /> 
							<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" /> ~ 
							<fmt:parseDate value="${list.end_date}" var="dateValue" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
							</p></a>
					</li>
				</c:forEach>
			</ul>
			<button type="button" id="morelist" class="btnmore">더보기</button>
			<div class="btn">
				<button type="button" class="btn btn-primary" style="width: 100px;" onclick="location.href='${root}/event/eventwriteform'">관리자 글쓰기</button>
			</div>
		</div>
	</form>
<<<<<<< HEAD
<script>
let startnum = 0;
$("#morelist").click(function(){
	startnum+=8;
	var data={"startnum":startnum};
	
	$.ajax({
		url:"list",
		type:"post",
		contentType : "application/json; charset=utf-8",
		data:JSON.stringify({"startnum":startnum}),
		success:function(data){
			var s = "";
			$(data).each(function(i, d){
				s+="<li>";
				s+="<a href='../event/eventdetail?num="+d.seq+"'>";
				s+="<img src='../thumnail_img/"+d.thumbnail_img+"'>";
				s+="<br>"+"<br>"
				s+="<b>";
				s+=d.title;
				s+="</b>";
				s+="<br>"+"<br>"
				s+="<p>";
				s+="기  간 : ";
				s+=d.start_date;
				s+=" ~ ";
				s+=d.end_date;
				s+="</p>";
				s+="</a>";
				s+="</li>";
				
			});
			$("#newlist").append(s);
			
		}
	});
});
=======
</div>
	<script>
		let startnum = 0;
		$("#morelist")
				.click(
						function() {
							startnum += 8;
							var data = {
								"startnum" : startnum
							};
>>>>>>> main

							$
									.ajax({
										url : "list",
										type : "post",
										contentType : "application/json; charset=utf-8",
										data : JSON.stringify({
											"startnum" : startnum
										}),
										success : function(data) {
											var s = "";
											$(data)
													.each(
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