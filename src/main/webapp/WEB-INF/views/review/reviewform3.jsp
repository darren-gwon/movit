<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
	fieldset{
	    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	    border: 0; /* 필드셋 테두리 제거 */
	}
	
	#myform input[type=radio]{
	    display: none; /* 라디오박스 감춤 */
	}
	
	#myform label{
	    font-size: 2em; /* 이모지 크기 */
	    color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	}
	
	#myform label:hover{
    	text-shadow: 0 0 0 #febd1a; /* 마우스 호버 */
	}
	
	#myform label:hover ~ label{
    	text-shadow: 0 0 0 #febd1a; /* 마우스 호버 뒤에오는 이모지들 */
	}
	
	fieldset{
	    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	    direction: rtl; /* 이모지 순서 반전 */
	    border: 0; /* 필드셋 테두리 제거 */
	}
	
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 #febd1a; /* 마우스 클릭 체크 */
	}
	
	#rawsave{
		line-height: 300px;
		height: 300px;
		border: 1px solid black;
		cursor: pointer;
	}
	
	table.reviewList{
		border: 0px solid  black;
		width: 600px;
	}
	.fc{
		color: red;
	}
	
	.save:hover{
		background-color: #febd1a;
	}
	li {
		list-style: none;
	}
</style>
<script type="text/javascript">
$(function(){
	let totalReviewCnt = 0;
	//처음 로딩시 댓글 출력
	list();
	//댓글 저장 이벤트
	$("#save").click(function(){
	    if($.trim($("#content").val())=='') {
			alert("메세지를 입력해주세요.");
			return false;
	    } 
	    var star = $('input[name=rating]:checked').val();
	    console.log(star);
	    if(star==undefined){
	    	alert("별점을 입력해주세요");
	    	return false;
	    }
	    
		//전체 폼 데이타 읽기
		var data = $("#afrm").serialize();//serialize 전체 폼(id=afrm의 form태그) 데이타중 속성name으로 된 값을 가져온다
		//alert(data);
		$.ajax({
			type:"post",
			dataType:"text",
			url:"insert",
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
			url:"list",
			data:{
				"movieID":${movieID},
				"startNum":totalReviewCnt},
			success:function(data){
				var s = "";
				$.each(data.list, function(i, d) {
					s+="<li class='userReview' data-review_id='"+d.reviewID+"'>";
					s+="<span style='font-weight:bold'>"+d.user_id+"</span>";
					s+=" ⭐ "+d.rating;
					s+="<pre><span id='reviewContent_"+d.reviewID+"'>"+d.content+"</span></pre>";
					s+="<span style='color:#868e96;'>"+d.write_date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
					s+="<img src='../image/heart-empty.png' width='20' data-reviewid='"+d.reviewID+"' id='addLike' style='cursor:pointer'>&nbsp;&nbsp;</span>"
					s+="<span id='totalLikesCnt'></span>";
					s+="&nbsp;&nbsp;&nbsp;<img src='' width='20' data-reviewid='"+d.reviewID+"' id='updateReview' style='cursor:pointer'>";
					s+="&nbsp;&nbsp;&nbsp;<img src='' width='20' data-reviewid='"+d.reviewID+"' id='deleteReview' style='cursor:pointer'></li>";
					s+="<hr>";
					//로그인세션과 유저아이디가 일치하면 좋아요 빨간색
					/* var checkId = ${sessionScope.user_id == d.user_id};
					console.log(checkId);
					if(checkId) {
						$(".idcheck"+d.reviewID+d.user_id).removeClass("fc");
					} else {
						$(".idcheck"+d.reviewID+d.user_id).addClass("fc");
					} */
				});
				$("div.review").append(s);
				
				checkUser();
				totalLikes();
				checkUserReview();
				}
		});
	});
	
	function list() {
		/* var login = '${sessionScope.loginok}';
		var loginid = '${sessionScope.loginid}';
		console.log(login, loginid); */
		$.ajax({
			type:"get",
			dataType:"json",
			url:"list",
			data:{
				"movieID":${movieID},
				"startNum":"0"},
			success:function(data){
				var ratingAvg = data.sumReviewRating/data.reviewTotalCount;
				var s = "";
				s+="<h1>총 평점 ⭐"+ratingAvg.toFixed(2)+" / 10</h1>"
				s+="<h3>총 "+data.reviewTotalCount+"건</h3>"
				$.each(data.list, function(i, d) {
					s+="<li class='userReview' data-review_id='"+d.reviewID+"'>";
					s+="<span style='font-weight:bold'>"+d.user_id+"</span>";
					s+=" ⭐ "+d.rating;
					s+="<pre><span id='reviewContent_"+d.reviewID+"'>"+d.content+"</span></pre>";
					s+="<span style='color:#868e96;'>"+d.write_date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
					s+="<img src='../image/heart-empty.png' width='20' data-reviewid='"+d.reviewID+"' id='addLike' style='cursor:pointer'>&nbsp;&nbsp;</span>"
					s+="<span id='totalLikesCnt'></span>";
					s+="&nbsp;&nbsp;&nbsp;<img src='' width='20' data-reviewid='"+d.reviewID+"' id='updateReview' style='cursor:pointer'>";
					s+="&nbsp;&nbsp;&nbsp;<img src='' width='20' data-reviewid='"+d.reviewID+"' id='deleteReview' style='cursor:pointer'></li>";
					s+="<hr>";
				});
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
				url:"deleteReview",
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
			
			/* "<fieldset name='myform2' id='myform2'>"
			+"<input type='radio' name='rating' value='10' id='rate1'><label class='label2' for='rate1'>⭐</label>"
			+"<input type='radio' name='rating' value='9' id='rate2'><label class='label2' for='rate2'>⭐</label>"
			+"<input type='radio' name='rating' value='8' id='rate3'><label class='label2' for='rate3'>⭐</label>"
			+"<input type='radio' name='rating' value='7' id='rate4'><label class='label2' for='rate4'>⭐</label>"
			+"<input type='radio' name='rating' value='6' id='rate5'><label class='label2' for='rate5'>⭐</label>"
			+"<input type='radio' name='rating' value='5' id='rate6'><label class='label2' for='rate6'>⭐</label>"
			+"<input type='radio' name='rating' value='4' id='rate7'><label class='label2' for='rate7'>⭐</label>"
			+"<input type='radio' name='rating' value='3' id='rate8'><label class='label2' for='rate8'>⭐</label>"
			+"<input type='radio' name='rating' value='2' id='rate9'><label class='label2' for='rate9'>⭐</label>"
			+"<input type='radio' name='rating' value='1' id='rate10'><label class='label2' for='rate10'>⭐</label>"
			+"</fieldset></form>"; */
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
				url:"updateReview",
				data:datas,
				success:function(){
					list();
					checkUser();
					totalLikes();
					checkUserReview();
				}
			})
	});
		/* var ctext = $("#reviewContent_"+data).text();
		
		
		var s = "";
		s += "<form action='updateReview'  id=bfrm method='get'>";
		s += "<textarea>"+ctext+"</textarea><button>수정완료</button><br>";
		s += 
			"<fieldset name='myform' id='myform'>"
			+"<input type='radio' name='rating' value='10' id='rate1'><label for='rate1'>⭐</label>"
			+"<input type='radio' name='rating' value='9' id='rate2'><label for='rate2'>⭐</label>"
			+"<input type='radio' name='rating' value='8' id='rate3'><label for='rate3'>⭐</label>"
			+"<input type='radio' name='rating' value='7' id='rate4'><label for='rate4'>⭐</label>"
			+"<input type='radio' name='rating' value='6' id='rate5'><label for='rate5'>⭐</label>"
			+"<input type='radio' name='rating' value='5' id='rate6'><label for='rate6'>⭐</label>"
			+"<input type='radio' name='rating' value='4' id='rate7'><label for='rate7'>⭐</label>"
			+"<input type='radio' name='rating' value='3' id='rate8'><label for='rate8'>⭐</label>"
			+"<input type='radio' name='rating' value='2' id='rate9'><label for='rate9'>⭐</label>"
			+"<input type='radio' name='rating' value='1' id='rate10'><label for='rate10'>⭐</label>"
			+"</fieldset></form>";
		$("#reviewContent_"+data).html(s);
	});
	list();
	checkUser();
	totalLikes();
	checkUserReview(); */
	
	
});//$(function) 끝지점

//좋아요 저장 이벤트(onclick)
$(document).on("click","#addLike", function(){
	var data = {
			"reviewID": $(this).attr("data-reviewid"),
			"user_id": "${sessionScope.user_id}",
			"movieID": ${movieID}
	}
		$.ajax({
		type:"post",
		dataType:"json",
		contentType: "application/json",
		url:"likes",
		data: JSON.stringify(data),
		context:this,
		success:function(data){
			if(data==1) {
				//$(this).css("color","red");
				$(this).attr("src","../image/heart.png");
			} else {
				//$(this).css("color","black");
				$(this).attr("src","../image/heart-empty.png");
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
		url:"checkLikes",
		data:JSON.stringify(data),
		success:function(result){
			$(result).each(function(idx, data){
				//유저별 하트찾기
				const likebtn = $(".userReview").filter("[data-review_id='"+data.reviewID+"']").children("#addLike");
				likebtn.attr("src","../image/heart.png");
			})
		}
	});
}

//좋아요 토탈카운트 
function totalLikes(){
	$.ajax({
		type:"post",
		dataType: "json",
		url:"totalLikes",
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
		url:"checkUserReview",
		data:{"movieID":${movieID}, "user_id":"${sessionScope.user_id}"},
		success:function(result){
			$(result).each(function(idx, data){
				//수정식별코드
				const checkUser1 = $(".userReview").filter("[data-review_id='"+data.reviewID+"']").children("#updateReview");
				checkUser1.attr("src","../image/edit.png");
				//삭제식별코드
				const checkUser2 = $(".userReview").filter("[data-review_id='"+data.reviewID+"']").children("#deleteReview");
				checkUser2.attr("src","../image/trash-bin.png");
			})
		}
	});
}


</script>
</head>
<body>
	<h1>Comments(login_id : ${sessionScope.user_id})</h1>
	<form action="insert" id="afrm" method="post" onsubmit="return doAction();">
	<input type="hidden" name="movieID" class="form-control" value="${movieID }">
		<table class="table table-bordered" style="width:500;">
			<tr>
				<td>
					<input type="hidden" id="movieID" name="movieID" class="form-control" value="${movieID}">
				</td>
				<td>
					<input type="hidden" id="user_id" name="user_id" class="form-control" value="${sessionScope.user_id}">
				</td>
				
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea style="width:100%;height:100px;" id="content" name="content" class="form-control" placeholder="평점 및 관람평을 작성해 보세요. &#13;&#10;주제와 무관한 리뷰 또는 스포일러는 삭제되실수 있습니다"></textarea>
				</td>
				<td bgcolor="#495057" id="save" class="btn btn-default save" style="text-align:center;width:100px;color:white;cursor:pointer;">관람평 작성</td>
			</tr>
			<tr>
				<th>평점</th>
				<td>
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
			</tr>
			<!-- <tr>
				<td colspan="2" align="center">
					<button type="button" id="save" class="btn btn-default save" style="width:100px;">글저장</button>
				</td>
			</tr> -->
		</table>
	</form>
	
	<div class="review">
	</div>
	
	<div class="listopener" style="cursor:pointer;">
		<hr><h4>펼쳐보기 </h4><hr>
	</div>
	

</body>
</html>