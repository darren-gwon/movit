<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</style>
<script type="text/javascript">
$(function(){
	let totalReviewCnt = 0;
	//처음 로딩시 댓글 출력
	list();
	
	//댓글 저장 이벤트
	$("#save").click(function(){
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
				"startNum":totalReviewCnt,
				"reviewTotalCount":${reviewTotalCount},
				"sumReviewRating":${sumReviewRating}},
			success:function(data){
				console.log(2);
				console.log(data.startNum);
				data.startNum+5;
				var s = "";
				s+="<table class='reviewList'>";
				$.each(data.list, function(i, d) {
					console.log(data.startNum);
					s+="<tr>";
					s+="<td>"+d.reviewID+"</td>";
					s+="<td>"+d.user_id+"</td>";
					s+="<td>⭐"+d.rating+"</td>";
					s+="<td><pre>"+d.content+"</pre></td>";
					s+="<td>"+d.likes+"</td>";
					s+="<td>"+d.write_date+"</td>";
					s+="<td style='cursor:pointer' onclick='addLike("+d.reviewID+")'>좋아요</td>"
					s+="</tr>";
				});
				
				s+="</table>";
				$("div.review").append(s);
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
				//"startNum":totalReviewCnt,
				"startNum":"0",
				"reviewTotalCount":${reviewTotalCount},
				"sumReviewRating":${sumReviewRating}},
			success:function(data){
				//console.log(data.count);
				var ratingAvg = data.sumReviewRating/data.reviewTotalCount;
				var s = "";
				s+="<h1>총"+data.reviewTotalCount+"건 / ⭐"+ratingAvg+"</h1>"
				s+="<table class='reviewList'>";
				$.each(data.list, function(i, d) {
					
					s+="<tr>";
					s+="<td id='review_idx'>"+d.reviewID+"</td>";
					s+="<td>"+d.user_id+"</td>";
					s+="<td>⭐"+d.rating+"</td>";
					s+="<td><pre>"+d.content+"</pre></td>";
					s+="<td>"+d.likes+"</td>";
					s+="<td>"+d.write_date+"</td>";
					s+="<td style='cursor:pointer' onclick='addLike("+d.reviewID+")'>좋아요</td>"
					s+="</tr>";
				});
				
				s+="</table>";
				$("div.review").html(s);
				
				
				
			}
		});
	};	
});

//댓글 저장 이벤트(onclick)
function addLike(reviewId) {
	var data = {
			"reviewID": reviewId,
			"user_id": "${sessionScope.user_id}"
	}
	/* let user_id = "${sessionScope.user_id}"; */
		$.ajax({
		type:"post",
		dataType:"json",
		contentType: "application/json",
		url:"likes",
		data: JSON.stringify(data),
		success:function(data){
			if(data==1) {
				alert("좋아요 등록되었습니다")
				//$(this).css("color","red");
			} else {
				alert("좋아요 해제되었습니다")
				//$(this).css("color","black");
			}
		}
	});
}
</script>
</head>
<body>
	<h1>Comments(login_id : ${sessionScope.user_id})</h1>
	<form action="insert" id="afrm" method="post">
	<input type="hidden" name="movieID" class="form-control" value="${movieID }">
		<table class="table table-bordered" style="width:500;">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="user_id" name="user_id" class="form-control" value="${sessionScope.user_id}">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea style="width:100%;height:100px;" id="content" name="content" class="form-control" placeholder="내용을 입력하세요"></textarea>
				</td>
			</tr>
			<tr>
				<th>평점</th>
				<td>
					<fieldset name="myform" id="myform">
						<input type="radio" name="rating" value="10" id="rate1"><label for="rate1">⭐</label>
						<input type="radio" name="rating" value="9" id="rate2"><label for="rate2">⭐</label>
						<input type="radio" name="rating" value="8" id="rate3"><label for="rate3">⭐</label>
						<input type="radio" name="rating" value="7" id="rate4"><label for="rate4">⭐</label>
						<input type="radio" name="rating" value="6" id="rate5"><label for="rate5">⭐</label>
				        <input type="radio" name="rating" value="5" id="rate6"><label for="rate6">⭐</label>
				        <input type="radio" name="rating" value="4" id="rate7"><label for="rate7">⭐</label>
				        <input type="radio" name="rating" value="3" id="rate8"><label for="rate8">⭐</label>
				        <input type="radio" name="rating" value="2" id="rate9"><label for="rate9">⭐</label>
				        <input type="radio" name="rating" value="1" id="rate10"><label for="rate10">⭐</label>
				    </fieldset>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="save" class="btn btn-default save" style="width:100px;">글저장</button>
				</td>
			</tr>
		</table>
	</form>
	
	<div class="review">
	</div>
	<div class="listopener" style="cursor:pointer;">
		<hr><h4>펼쳐보기</h4><hr>
	</div>
	

</body>
</html>