<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/movie_detail.css" rel='stylesheet' />
<link rel="stylesheet" href="/resources/css/reviewform.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function(){
	let totalReviewCnt = 0;
	//처음 로딩시 댓글 출력
	list();
	//댓글 저장 이벤트
	
	$("#afrm").click(function(){
		if(${sessionScope.user_id == null}){
			alert("로그인이 필요한 서비스입니다.");
			return;
		} 
	});
	
	$("#save").click(function(){
		if(${sessionScope.user_id == null}) {
			return;
		}
	    if($.trim($("#content").val())=='') {
			alert("메세지를 입력해주세요.");
			return;
	    } 
	    var star = $('input[name=rating]:checked').val();
	    console.log(star);
	    if(star==undefined){
	    	alert("별점을 입력해주세요");
	    	return;
	    }
			//전체 폼 데이타 읽기
			var data = $("#afrm").serialize();//serialize 전체 폼(id=afrm의 form태그) 데이타중 속성name으로 된 값을 가져온다
			//alert(data);
			$.ajax({
				type:"post",
				dataType:"text",
				url:"../review/insert",
				data:data,
				success:function(){
					
					list();
					totalReviewCnt = 0;
					$("#content").val("");
					$("#rating1").val("");
					$("#rating2").val("");
					$("#rating3").val("");
					$("#rating4").val("");
					$("#rating5").val("");
					$("#rating6").val("");
					$("#rating7").val("");
					$("#rating8").val("");
					$("#rating9").val("");
					$("#rating10").val("");
					//저장버튼 누를 시, 고정된 별갯수 초기화
					//체크해제할 라디오버튼 불러오기
					var rating = document.getElementsByName("rating");
			        for(var i=0;rating.length;i++){
			             //체크되어 있다면 rating[i].checked == true
			             //true -> false로 변환 ==> 체크해제
			             if(rating[i].checked){
			                 rating[i].checked = false;
			             }
			        }
				} 
			});
	});
	
	$("div.listopener").click(function(){
		totalReviewCnt+=5;
		$.ajax({
			type:"get",
			dataType:"json",
			url:"../review/list",
			data:{
				"movieID":${movieID},
				"startNum":totalReviewCnt},
			success:function(data){
				var s = "";
				s+="<ul class='reviewList'>";
				$.each(data.list, function(i, d) {
					s+="<li class='userReview' data-review_id='"+d.reviewID+"'>";
					s+="<span style='font-weight:bold'>"+d.user_id+"</span>";
					s+=" ⭐ "+d.rating;
					s+="<pre><span id='reviewContent_"+d.reviewID+"'>"+d.content+"</span></pre>";
					s+="<span style='color:#868e96;'>"+d.write_date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
					s+="<img src='' width='20' data-reviewid='"+d.reviewID+"' id='updateReview' style='cursor:pointer'>";
					s+="&nbsp;&nbsp;&nbsp;<img src='' width='20' data-reviewid='"+d.reviewID+"' id='deleteReview' style='cursor:pointer'>";
					s+="&nbsp;&nbsp;&nbsp;<img src='/resources/review_img/heart-empty.png' width='20' data-reviewid='"+d.reviewID+"' id='addLike' style='cursor:pointer'>&nbsp;&nbsp;</span>"
					s+="<span id='totalLikesCnt'></span>";
					s+="</li>";
				});
				s+="</ul>";
				$("div.review").append(s);
				
				checkUser();
				totalLikes();
				checkUserReview();
				}
		});
	});
	
	function list() {
		$.ajax({
			type:"get",
			dataType:"json",
			url:"../review/list",
			data:{
				"movieID":${movieID},
				"startNum":"0"},
			success:function(data){
				var ratingAvg = data.sumReviewRating/data.reviewTotalCount;
				
				var r = "<h1>평점 ⭐<strong>"+ratingAvg.toFixed(2)+"</strong> / 10</h1>";
				var t = "총 리뷰 <strong>"+data.reviewTotalCount+"</strong>건";
				$("#totAvg").html(r);
				$("#tot").html(t);
				var s = "";
				s+="<ul class='reviewList'>";
				$.each(data.list, function(i, d) {
					s+="<li class='userReview' data-review_id='"+d.reviewID+"'>";
					s+="<span style='font-weight:bold'>"+d.user_id+"</span>";
					s+=" ⭐ "+d.rating;
					s+="<pre><span id='reviewContent_"+d.reviewID+"'>"+d.content+"</span></pre>";
					s+="<span style='color:#868e96;'>"+d.write_date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
					s+="<img src='' width='20' data-reviewid='"+d.reviewID+"' id='updateReview' style='cursor:pointer'>";
					s+="&nbsp;&nbsp;&nbsp;<img src='' width='20' data-reviewid='"+d.reviewID+"' id='deleteReview' style='cursor:pointer'>";
					s+="&nbsp;&nbsp;&nbsp;<img src='/resources/review_img/heart-empty.png' width='20' data-reviewid='"+d.reviewID+"' id='addLike' style='cursor:pointer'>&nbsp;&nbsp;</span>"
					s+="<span id='totalLikesCnt'></span>";
					s+="</li>";
				});
				s+="</ul>";
				$("div.review").html(s);
				checkUser();
				totalLikes();
				checkUserReview();
			}
		});
	};	
	
	//삭제 버튼이벤트
	$(document).on("click","#deleteReview", function(){
	var data = $(this).attr("data-reviewid");
	console.log(data);
	var ans = confirm("삭제하려면 [확인]을 눌러주세요");
	if(ans) {
			$.ajax({
				type:"get",
				url:"../review/deleteReview",
				data:"reviewID="+data,
				success:function(){
					list();
					checkUser();
					totalLikes();
					checkUserReview();
				}
			})
		}
	});
	
	//수정 버튼이벤트
	$(document).on("click","#updateReview", function(){
		var data = $(this).attr("data-reviewid");
		console.log(data);
		var ctext = $("#reviewContent_"+data).text();
		var updateUserId = "${sessionScope.user_id}";
		var s = "";
		s += "<form action='updateReview' id=bfrm method='post'>";
		s += "<input type='hidden' name='reviewID' value='"+data+"'>";
		s += "<input type='hidden' name='movieID' value='"+${movieID}+"'>";
		s += "<input type='hidden' name='user_id' value='"+updateUserId+"'>";
		s += "<textarea required name='content' id='updateContent' class='form-control' >"+ctext+"</textarea>";
		s += "<select name='rating'>";
		s += "<option value=''>평점입력</option>";
		s += "<option value=1>1점</option>";
		s += "<option value=2>2점</option>";
		s += "<option value=3>3점</option>";
		s += "<option value=4>4점</option>";
		s += "<option value=5>5점</option>";
		s += "<option value=6>6점</option>";
		s += "<option value=7>7점</option>";
		s += "<option value=8>8점</option>";
		s += "<option value=9>9점</option>";
		s += "<option value=10>10점</option>";
		s += "</select>";
		s += "<span style='width:40px;height:100px;cursor:pointer;background-color:#febd1a' id='updatebtn'>수정완료</span>";
		$("#reviewContent_"+data).html(s);
	});
	
	$(document).on("click","#updatebtn", function(){
		if($.trim($("#updateContent").val())=='') {
			alert("메세지를 입력해주세요.");
			return false;
	    } 
	   var star = $('input[name=rating]:checked').val();
	    console.log(star);
	     /* if(star==undefined){
	    	alert("별점을 입력해주세요");
	    	return false;
	    }  */
		var datas = $("#bfrm").serialize();
			$.ajax({
				type:"post",
				dataType:"text",
				url:"../review/updateReview",
				data:datas,
				success:function(){
					list();
					checkUser();
					totalLikes();
					checkUserReview();
				}
			})
	});
	
	//관람등급별 이미지 삽입
	if(${dto.age_group == 0}) {
		$("#age_group").attr("src","/resources/img/movie_ages/txt-age-0.png");
	} else if(${dto.age_group == 12}) {
		$("#age_group").attr("src","/resources/img/movie_ages/txt-age-12.png");
	} else if(${dto.age_group == 15}) {
		$("#age_group").attr("src","/resources/img/movie_ages/txt-age-15.png");
	} else {
		$("#age_group").attr("src","/resources/img/movie_ages/txt-age-19.png");
	}
});//$(function) 끝지점

//좋아요 저장 이벤트(onclick)
$(document).on("click","#addLike", function(){
	if(${sessionScope.user_id == null}){alert("로그인이 필요한 서비스입니다."); return}
	var data = {
			"reviewID": $(this).attr("data-reviewid"),
			"user_id": "${sessionScope.user_id}",
			"movieID": ${movieID}
	}
		$.ajax({
		type:"post",
		dataType:"json",
		contentType: "application/json",
		url:"../review/likes",
		data: JSON.stringify(data),
		context:this,
		success:function(data){
			if(data==1) {
				//$(this).css("color","red");
				$(this).attr("src","/resources/review_img/heart.png");
			} else {
				//$(this).css("color","black");
				$(this).attr("src","/resources/review_img/heart-empty.png");
			}
			totalLikes();
		}
	});
})

//유저를 확인하여 좋아요 상태여부 체크
function checkUser(){
	let user_id = "${sessionScope.user_id}";
	
	var data = {
			"user_id":user_id,
			"movieID":${movieID},
	};

	$.ajax({
		type:"post",
		contentType: "application/json",
		url:"../review/checkLikes",
		data:JSON.stringify(data),
		success:function(result){
			$(result).each(function(idx, data){
				//유저별 하트찾기
				const likebtn = $(".userReview").filter("[data-review_id='"+data.reviewID+"']").children("#addLike");
				likebtn.attr("src","/resources/review_img/heart.png");
			})
		}
	});
}

//좋아요 토탈카운트 
function totalLikes(){
	$.ajax({
		type:"post",
		dataType: "json",
		url:"../review/totalLikes",
		data:{"movieID":${movieID}},
		success:function(result){
			$(result).each(function(idx, data){
				const totalLikesCnt = $(".userReview").filter("[data-review_id='"+data.reviewID+"']").children("#totalLikesCnt");
				totalLikesCnt.text(data.total_likes);
			})
		}
	});
}

//유저별 수정,삭제가능 식별코드 
function checkUserReview(){
	$.ajax({
		type:"post",
		dataType: "json",
		url:"../review/checkUserReview",
		data:{"movieID":${movieID}, "user_id":"${sessionScope.user_id}"},
		success:function(result){
			$(result).each(function(idx, data){
				//수정식별코드
				const checkUser1 = $(".userReview").filter("[data-review_id='"+data.reviewID+"']").children("#updateReview");
				checkUser1.attr("src","/resources/review_img/edit.png");
				//삭제식별코드
				const checkUser2 = $(".userReview").filter("[data-review_id='"+data.reviewID+"']").children("#deleteReview");
				checkUser2.attr("src","/resources/review_img/trash-bin.png");
			})
		}
	});
}
</script>



</head>

<body>
	<div class="container" style="text-align: center;">
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<div class="col">
				<img src="/resources/image/movie_detail.jpeg" style="width: 1300px; height: 550px; object-fit: cover;">
			</div>



			

			
		</div>
		<br> <br><br>
	</div>

	<div class="container" style="text-align: center;">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-3">
				<div class="movielist">
					<figure>
						<img style="width:293px;" src="${dto.poster_img }">
					</figure>
				</div>
			</div>



			<div class="col-sm-4">
				<div class="movielist"
					style="text-align: left; font-family: monospace; width:800px;">
					<h3><img id="age_group" src="">&nbsp;${dto.title }</h3>
					<hr>
					<h5>장르&nbsp;&nbsp;${dto.genre }</h5>
					<h5>감독&nbsp;&nbsp;${dto.director }</h5>
					<h5>출연&nbsp;&nbsp;${dto.casts }</h5>
					<h5>국적&nbsp;&nbsp;${dto.country }</h5>
					<h5>개봉일&nbsp;&nbsp;${dto.opendate }</h5>
					<h5>배급사&nbsp;&nbsp;${dto.distributor }</h5>
					<h5>RunningTime&nbsp;&nbsp;${dto.runningtime }분</h5>
					<br><br>
					<button type="button" class="btn btn-outline-danger"
						style="width: 250px; height: 80px; font-size: 30px;" onclick="location.href='../booking'">예매하기</button>
				</div>
			</div>

			<div class="col-sm-5"></div>

		</div>
		<br> <br>
	</div>




	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item" style="width: 200px"><a class="nav-link active" href="#">영화정보</a></li>
					
				</ul>
			</div>
		</div>
		<br> <br>
		<div class="container" style="text-align: center;">
			<div class="row">
				<div class="col">
					<div class="movielist" style="text-align: left;">
						<pre style="font-size:1.2em;">${dto.summary }</pre>
					</div>
				</div>
			</div>
		</div>
		<br> 
		<br>

		<div class="container" style="text-align: center;">
			<div class="row">

				<div class="col">
					<div class="movielist" style="text-align: left;">
						<br>  <br>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item" style="width: 200px"><a
						class="nav-link active" href="#">트레일러</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br>
	<br>

	<div class="container" style="text-align: center;">
		<div class="row">
			<div class="col">
				<iframe width="400" height="315"
					src="${trailer_url1 }"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<div class="col">
				<iframe width="400" height="315"
					src="${trailer_url2 }"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<div class="col">
				<iframe width="400" height="315"
					src="${trailer_url3 }"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item" style="width: 200px"><a
						class="nav-link active" href="#">스틸컷</a></li>
				</ul>
			</div>
		</div>
	</div>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-4">
				<div id="carouselExampleIndicators" class="carousel slide"
					style="width: 900px;" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="${still_cut1 }"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="${still_cut2 }"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="${still_cut3 }"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	

	<br><br>
	<div class="container">
		<div class="row">
			<div class="col"></div>
				
			<ul class="nav nav-tabs">
				<li class="nav-item" style="width: 200px"><a class="nav-link active" href="#">영화리뷰</a></li>
				
			</ul>
				
		
				
			<div id="godDamnReview">
					<br><br><br><br><br>
					<span id="totAvg"></span><br>
					<span style="color:gray">영화관람 후 관람평을 작성하시면<br>vit.point를 적립해 드립니다.</span>
					
					
					<div class="container">
					<div class="row">
					<div class="col" style="text-align: center;">
					<form action="insert" id="afrm" method="post" onsubmit="return chkSubmit()">
					<input type="hidden" name="movieID" value="${movieID }">
						<table style="border:0.5px solid gray;border-radius:30;">
							<tr>
								<td width="500" style="height: 150px;">
									<span id="star_rating" style="font-size:25px;" >별점</span><br>
									<fieldset name="myform" id="myform">
										<input type="radio" name="rating" value="10" id="rate1"><label class="label1" for="rate1">⭐</label>
										<input type="radio" name="rating" value="9" id="rate2"><label class="label1" for="rate2">⭐</label>
										<input type="radio" name="rating" value="8" id="rate3"><label class="label1" for="rate3">⭐</label>
										<input type="radio" name="rating" value="7" id="rate4"><label class="label1" for="rate4">⭐</label>
										<input type="radio" name="rating" value="6" id="rate5"><label class="label1" for="rate5">⭐</label>
								        <input type="radio" name="rating" value="5" id="rate6"><label class="label1" for="rate6">⭐</label>
								        <input type="radio" name="rating" value="4" id="rate7"><label class="label1" for="rate7">⭐</label>
								        <input type="radio" name="rating" value="3" id="rate8"><label class="label1" for="rate8">⭐</label>
								        <input type="radio" name="rating" value="2" id="rate9"><label class="label1" for="rate9">⭐</label>
								        <input type="radio" name="rating" value="1" id="rate10"><label class="label1" for="rate10">⭐</label>
								    </fieldset>
								</td>
								<td width="400">
									<input type="hidden" id="user_id" name="user_id" class="form-control" value="${sessionScope.user_id}">
									<input type="hidden" id="movieID" name="movieID" class="form-control" value="${movieID}">
									
									<textarea style="width:100%; height: 100%; width:500px; height: 150px; "id="content" name="content" class="form-control" placeholder="평점 및 관람평을 작성해 보세요. &#13;&#10;주제와 무관한 리뷰 또는 스포일러는 삭제되실수 있습니다."></textarea>
									
								</td>
								<td width="200" rowspan="2" bgcolor="#495057" id="save" class="save">관람평 등록</td>
							</tr>
						</table>
					</form>
					</div></div></div>
					<span id="tot" style="float:left"></span><br><hr>
					<div class="review">
					</div>
					<br>
					<div class="listopener" style="padding-top:30px;clear:both">
						<button type="button" class="btn btn-primary">펼쳐보기</button>
					</div>
				</div>
		</div>
	</div>
	<br><br><br><br>
	<script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
