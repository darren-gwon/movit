<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<link href="/resources/css/booking.css" rel='stylesheet' />
<meta charset="UTF-8">
<title>MOVIT 예매하기</title>
</head>

<body>
	<div class="content">
		<div class="booking">
			<br>
			<div class="booking_table scheduleTable">
				<div class="table_heading">
					<div class="head schedule_theater">영화관</div>
					<div class="head schedule_movie">영화</div>
					<div class="head schedule_date">날짜</div>
					<div class="head schedule_schedule">상영시간</div>
				</div>
				<div class="table_body">
					<div class="table_row">
						<div class="cell theater_cell">
							<div class="region">
								<ul>
									<c:forEach var="r" items="${regionList}">
										<li name="regionValue" class="regionValue" data-region_name="${r.region_name}">${r.region_name}</li>
									</c:forEach>
								</ul>
							</div>
							<div class="theater">
								<ul>
									<c:forEach var="t" items="${theaterList}">
										<li name="theaterValue" class="theaterValue" data-theater_name="${t.theater_name}">${t.theater_name}</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="cell movie_cell">
							<ul>
								<c:forEach var="m" items="${movieList}">
									<li name="movieValue" class="movieValue" data-age_group="${m.age_group}" data-title="${m.title}" data-runningtime="${m.runningtime}" data-movie_id="${m.movie_id}" data-poster_img="${m.poster_img}"><img class='age_group' src='/resources/img/movie_ages/txt-age-${m.age_group}.png'><span class="title">${m.title}</span></li>
								</c:forEach>
							</ul>
						</div>
						<div class="cell date_cell"></div>
						<div class="cell schedule_cell"></div>
					</div>
				</div>
			</div>

			<div class="booking_table seatTable" style="display: none;">
				<div class="backwardBtn">이전</div>

				<div class="table_heading">
					<div class="head ticket_and_seat">인원/좌석 선택</div>
				</div>
				<div class="table_body">
					<div class="table_row">
						<div class="cell ticket_cell">
							<div class="summerized_movie_info">
								<img src="" class="s_poster_img">
								<div class="s_info">
									<img src="" class="s_age_group"> <span class="s_title"></span> <span class="s_class_type"></span> <span class="s_screen_datetime"> </span><span class="s_theater"></span>
								</div>
							</div>
							<div class="ticket_selection">
								<div class="adult">
									성인:
									<button type="button" class="btn btn-outline-dark decreaseBtn cntBtn">-</button>
									<input id="adultCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
									<button type="button" class="btn btn-outline-dark increaseBtn cntBtn">+</button>
								</div>
								<div class="youth">
									청소년:
									<button type="button" class="btn btn-outline-dark decreaseBtn cntBtn">-</button>
									<input id="youthCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
									<button type="button" class="btn btn-outline-dark increaseBtn cntBtn">+</button>
								</div>
								<div class="special">
									우대:
									<button type="button" class="btn btn-outline-dark decreaseBtn cntBtn">-</button>
									<input id="specialCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
									<button type="button" class="btn btn-outline-dark increaseBtn cntBtn">+</button>
								</div>
							</div>
						</div>
					</div>
					<div class="table_row">
						<div class="cell seat_cell">
							<div class="temp_screen">S C R E E N</div>
							<div class="seatAlignment"></div>
						</div>
					</div>
					<div class="table_row">
						<div class="cell orderInfo_cell">
							<span class="total">총 합계 <span class="totalPrice" id="totalPrice">0</span>원
							</span>
							<div id="initPayment" class="initPayment">결제하기</div>
						</div>

					</div>
				</div>
			</div>

			<div class="booking_table payTable" style="display: none;">
				<div class="backwardBtn">이전</div>

				<div class="table_heading">
					<div class="head booking_info">예매정보</div>
					<div class="head payment_method">결제수단</div>
				</div>
				<div class="table_body">
					<div class="table_row">
						<div class="cell booking_detail">
							<div class="info">
								<img src="" class="p_poster">
								<div>
									<img src="" class="p_age_group"> <span class="p_title"></span>
								</div>
								<dl class="dlist_infor">
									<dt>일시</dt>
									<dd class="p_datetime">상영시간</dd>
									<dt>영화관</dt>
									<dd class="p_theater">영화관 지점</dd>
									<dt>인원</dt>
									<dd class="p_buyer_qty"></dd>
									<!-- <dt>인원</dt>
									<dd >성인1</dd>
                                    <dt>인원</dt>
									<dd >성인1</dd> -->
								</dl>
							</div>
						</div>
						<div class="cell payment">
							<span>간편결제</span> <img src="https://developers.kakao.com/tool/resource/static/img/button/pay/payment_icon_yellow_medium.png" id="kakaopayBtn">

						</div>
					</div>
					<div class="table_row"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
initialize();

	function initialize(){
	    dateList();
	    
		$(".regionValue").eq(0).addClass("active");
		$(".theaterValue").eq(0).addClass("active");
		$(".movieValue").eq(0).addClass("active");
		$(".dateValue").eq(0).addClass("active");
		
	    getSchedules();
	}
     function initDetailBookingInfo(){
    	 $.ajax({
    		 type:"GET",
    		 dataType:"JSON",
    		 url:"/booking/getOrderInfo",
    		 success:function(result){
    			 $(".p_poster").attr("src",result.poster_img);
    			 $(".p_age_group").attr("src", "/resources/img/movie_ages/txt-age-"+ result.age_group + ".png");
    			 $(".p_title").text(result.title);
    			 
    			 $(".p_datetime").text(result.screen_date+" "+result.start_time.substring(0,result.start_time.length - 3)
    					 				+ "~"+ result.end_time.substring(0,result.start_time.length - 3));
    			 $(".p_theater").text(result.theater_name+" "+result.screen_name+" - " +result.class_type);
    		}
        })	
     };
     
    //영화 요약
    function summerizedMovieInfo() {
    	const s_info = $(".summerized_movie_info");
    	
    	$.ajax({
    		type: "GET",
    		dataType: "json",
    		url: "/booking/getOrderInfo",
    		success: function (result) {
    			const class_type = result.class_type;
    			const movie_id = result.movie_id;
    			const start_time = result.start_time;
    			const end_time = result.end_time;
    			
    			s_info.find(".s_poster_img").attr("src",result.poster_img);
    			s_info.find(".s_age_group").attr("src", "/resources/img/movie_ages/txt-age-"+ result.age_group + ".png");
    			s_info.find(".s_title").text(result.title);
    			s_info.find(".s_class_type").text("(" + result.class_type + ")");
    			s_info.find(".s_screen_datetime").text(result.screen_date+ " | "+ result.start_time.substring(0,result.start_time.length - 3)
    													+ "~"+ result.end_time.substring(0,result.start_time.length - 3));
    			s_info.find(".s_theater").text(result.theater_name + " · "+ result.screen_name);
    		}
    	});

        const adultCnt = parseInt($("#adultCnt").val());
        const youthCnt = parseInt($("#youthCnt").val());
        const specialCnt = parseInt($("#specialCnt").val());
        const totalPrice = parseInt($("#totalPrice").text());

        let tmp = adultCnt <= 0 ? "" : "성인 " + adultCnt +" ";
        tmp += youthCnt <= 0 ? "" : "청소년 " + youthCnt +" ";
        tmp += youthCnt <= 0 ? "" : "우대 " + specialCnt +" ";
    };
    
    //지역 클릭시 발생하는 (영화관 리스크 출력)
    $(".regionValue").click(function () {
        $(this).siblings().removeClass("active");
        $(this).addClass("active");

        const region_name = $(this).data("region_name");
        getTheaters(region_name);
        getSchedules();
    });

    //영화관 리스트 출력
    function getTheaters(region_name) {
    	$.ajax({
    		type: "POST",
    		data: "region_name=" + region_name,
    		url: "booking/getTheaterList",
    		success: function (result) {
    			let tmp = "<ul>";
    			for (let i = 0; i < result.length; i++) {
    				tmp += "<li name='theaterValue' class='theaterValue' data-theater_id=" + result[i].theater_id;
    				tmp += " data-theater_name=" + result[i].theater_name + ">" + result[i].theater_name+ "</li>";
    			}
    			
    			tmp += "</ul>"
    			$("div.theater").html(tmp);
    		}
    	});
    };
    
    //영화관 클릭시 동작하는 함수(영화 리스트 출력)
    $("div.theater").on("click", "li.theaterValue", function () {
    	$(this).siblings().removeClass("active");
    	$(this).addClass("active");
    	const theater_name = $(this).data("theater_name");
    	
    	getMovies(theater_name);
    	getSchedules();
    });

    //영화 리스트 출력
    function getMovies(theater_name) {
    	$.ajax({
    		type: "POST",
    		data: "theater_name=" + theater_name,
    		url: "booking/getMovieList",
    		success: function (result) {
    			let tmp = "<ul>";
    			$(result).each(function (i, ele) {
    				tmp += "<li name='movieValue' class='movieValue' data-age_group=" + ele.age_group
    					+ " data-title='" + ele.title + "' data-runningtime="
    					+ ele.runningtime + " data-movie_id=" + ele.movie_id + " data-poster_img=" + ele.poster_img + ">"
    					+ "<img class='age_group' src='/resources/img/movie_ages/txt-age-" + ele.age_group + ".png'>"
    					+ "<span class='title'>" + ele.title + "</span></li>";
    			})
    			
    		tmp += "</ul>";
    		$(".movie_cell").html(tmp);
    		}
    	})
	};
	
	//영화제목 클릭시 동작하는 함수
	$("div.movie_cell").on("click","li.movieValue",function () {
		$(this).siblings().removeClass("active");
		$(this).addClass("active");
		$(this).siblings().css("box-shadow", "");
		
		//CHECK이미지 본인에게만 추가
		$(this).children().siblings("img.movieChk").remove();
		$(this).siblings().children().siblings("img.movieChk").remove();
		$(this).children("span.title").after("<img class='movieChk' src='/resources/img/booking/check.png'>");
		$(this).css("box-shadow","0 0 0 2px #000 inset");
		
		getSchedules();
	});

    //날짜 클릭시 동작하는 함수
    $("div.date_cell").on("click", "li.dateValue", function () {
        $(this).siblings().removeClass("active");
        $(this).addClass("active");

        getSchedules();
    });

    //상영시간표를 출력하는 함수
    function getSchedules() {
    	const region_name = $(".regionValue.active").data("region_name");
    	const theater_name = $(".theaterValue.active").data("theater_name");
    	const movie_id = $(".movieValue.active").data("movie_id");
    	const screen_date = $(".dateValue.active").data("screen_date");

    	if (region_name != undefined && theater_name != undefined
    			&& movie_id != undefined && screen_date != undefined) {
    		
    		$.ajax({
    			type: "POST",
    			headers: {"content-type": "application/json"},
    			data: JSON.stringify({
    				"region_name": region_name,
    				"theater_name": theater_name,
    				"movie_id": movie_id,
    				"screen_date": screen_date
    				}),
    			url: "booking/getScheduleList",
    			success: function (result) {
    				let tmp = "<ul>";
    				$(result).each(function (idx, info) {
    					tmp += "<li><span name='scheduleValue' class='scheduleValue'";
    					tmp += " data-schedule_id=" + info.schedule_id + " data-movie_id=" + info.movie_id + " data-screen_date=" + info.screen_date;
    					tmp += " data-start_time=" + info.start_time + " data-end_time=" + info.end_time;
    					tmp += " data-class_type=" + info.theaterDto.screenDto.class_type + " data-seat_rows=" + info.theaterDto.screenDto.seat_rows;
    					tmp += " data-seat_columns=" + info.theaterDto.screenDto.seat_columns;
    					tmp += " data-total_seats=" + info.theaterDto.screenDto.total_seats + " data-screen_name=" + info.theaterDto.screenDto.screen_name + ">";
    					tmp += info.theaterDto.screenDto.class_type + " | " + info.theaterDto.screenDto.screen_name;
    					tmp += " | " + info.start_time + "~" + info.end_time + " | " + info.theaterDto.screenDto.total_seats + "</span></li>";  
    				});
                       	
    				tmp += "</ul>"
    				$(".schedule_cell").html(tmp);
    			}
    		});
    	}
    };

	//상영 일정 클릭 이벤트
	//OrderInfoDto에 상영할 영화에 대한 데이터 저장
	$("div.schedule_cell").on("click", ".scheduleValue",function () {
		const theaterDto = $(".theaterValue.active").data();
		theaterDto.region_name = $(".regionValue.active").data("region_name");
		const movieDto = $(".movieValue.active").data();
		const orderInfoJson = $(this).data();
		
		Object.assign(orderInfoJson, theaterDto, movieDto);
	
		$.ajax({
			type: "POST",
			url: "booking/myOrderInfo",
			headers: {"content-type": "application/json"},
			data: JSON.stringify(orderInfoJson),
			success: function () {
				summerizedMovieInfo();
			}
		})
	
		$(this).parent().siblings().find(".scheduleValue").removeClass("active");
		$(this).addClass("active");
		seatList();
		$(".booking_table.scheduleTable").css("display", "none");
		$(".booking_table.seatTable").css("display", "");	
	});
	
	//빈좌석 클릭시 작동하는 함수
	$(".seatAlignment").on("click",".seat",function () {
		if ($(this).hasClass("taken"))
			return;
		
		const adultCnt = parseInt($("#adultCnt").val());
		const youthCnt = parseInt($("#youthCnt").val());
		const specialCnt = parseInt($("#specialCnt").val());
	
		const totalCnt = adultCnt + youthCnt+ specialCnt;
		const selectedCnt = $(this).siblings(".selected").length;
	
		let price = 0;
		let totalPrice = parseInt($("#totalPrice").text());
		const class_type = $(".scheduleValue.active").data("class_type");
	
		if (totalCnt <= 0) {
			alert("관람하실 인원을 먼저 선택해주세요.");
			return;
		}
		
		//해당 좌석의 가격 체크
		if (selectedCnt < adultCnt) {
			price = getPriceByType(class_type, '성인');
		} else if (selectedCnt < adultCnt+youthCnt) {
			price = getPriceByType(class_type, '청소년');
		} else if (selectedCnt < adultCnt+ youthCnt + specialCnt) {
			price = getPriceByType(class_type, '우대');
	    }
		
		//선택한 좌석 다시 눌렀을 때 선택 취소시키기
		if ($(this).hasClass("selected")) {
			$(this).toggleClass("selected empty")
			totalPrice -= price;
			$(".totalPrice").text(totalPrice);
			return;
		}
		
		//해당 좌석의 금액을 추가
		if (totalCnt > $(".seat.selected").length) {
		    $(this).toggleClass("empty selected")
		    totalPrice += price;
		
		    $(".totalPrice").text(totalPrice);
		} else {
		    return;
		}
	});
	
	    //-버튼 이벤트
	$(".decreaseBtn").click(function () {
		const myCnt = $(this).siblings("input[name='inputCnt']").val();
		if ($(".seat.selected").length >= 1) {
			const reset = confirm("선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?");
			if (reset) {
				$("input[name='inputCnt']").val(0);
				$(".seat.selected").toggleClass("selected empty");
				$("#totalPrice").text(0);
				return;
				}
			}
	
		if (myCnt > 0) {
			const inputCnt = $(this).siblings("input[name='inputCnt']");
			const cnt = parseInt(inputCnt.val());
			inputCnt.val(cnt - 1);
		}
	});
	
	//+버튼 이벤트
	$(".increaseBtn").click(function() {
		const totalCnt = parseInt($("#adultCnt").val()) + parseInt($("#youthCnt").val()) + parseInt($("#specialCnt").val());
		if (totalCnt < 8) {
			const inputCnt = $(this).siblings("input[name='inputCnt']");
			const cnt = parseInt(inputCnt.val());
			inputCnt.val(cnt + 1);
		} else {
			alert("인원 선택은 8명까지만 가능합니다.")
		}
	});
	
	//결제 화면으로 넘어가기전 결제할 금액에 대한 유효성체크(백엔드)
	$(".cell.orderInfo_cell").on("click", "#initPayment",function () {
		if(${sessionScope.user_id==null || sessionScope.user_id==""}){
			alert("로그인이 필요한 서비스입니다.")
			return;
		}
		
		const adultCnt = parseInt($("#adultCnt").val());
		const youthCnt = parseInt($("#youthCnt").val());
		const specialCnt = parseInt($("#specialCnt").val());
		const quantity = (adultCnt + youthCnt + specialCnt);
		const totalPrice = parseInt($("#totalPrice").text());
		const class_type = $(".scheduleValue.active").attr("data-class_type");
		
        if (quantity <= 0) {
            alert("관람하실 인원을 먼저 선택해주세요.");
            return;
        }
        
		if (adultCnt + youthCnt + specialCnt > $(".seat.selected").length) {
			alert("좌석을 모두 선택해주시기바랍니다.");
			return;
		}
	    
		if (specialCnt >= 1) {
			alert("우대 요금으로 예매하신 고객님께서는\n"
				+ "상영관 입장 시 증빙서류를 제시해 주시기 바랍니다.\n"
				+ "(미지참 시 입장 제한)\n\n" + "- 장애인: 1~6급 (복지카드)\n"
				+ "- 국가유공자: (국가유공자증)\n"
				+ "- 경로: 만 65세 이상 (신분증)\n\n"
				+ "위 기재된 사항 외 우대 적용 대상 고객님께서는\n"
				+ "현장 매표소에서 우대 발권이 가능합니다.\n"
				+ "우대 요금 선택 시 추가 할인이 제한될 수 있습니다.\n"
				+ "※일부 지점의 경우 경로 우대요금 미운영");
			}
	    
		let ownSeatList = "[";
		$(".seat.selected").each(function (idx, el) {
			ownSeatList += JSON.stringify($(el).data())+ ",";
		});
		
	    ownSeatList = ownSeatList.substring(0,ownSeatList.length - 1);
	    ownSeatList += "]";
	    
	    const ownSeatJson = JSON.parse(ownSeatList);
	    
	    let json = {
	        "cid": "TC0ONETIME",
	        "quantity": quantity,
	        "adultCnt": adultCnt,
	        "youthCnt": youthCnt,
	        "specialCnt": specialCnt,
	        "totalPrice": totalPrice,
	        "class_type": class_type,
	        "ownSeatList": ownSeatJson
	    };
	    
	    $.ajax({
	    	type: "POST",
	    	url: "pay/valid",
	    	headers: {"content-type": "application/json"},
	    	data: JSON.stringify(json),
	    	success: function (result) {
	    		$(".seatTable").hide();
	    		$(".payTable").show();
	    		initDetailBookingInfo();
	    		},
	    	error: function () {
	    		alert("유효하지 않은 데이터가 있어 예매를 초기화합니다.");
	    		location.reload();
	        }
	    })
	});
	
	//카카오페이시 실제 결제를 준비시키는 함수
	$("#kakaopayBtn").click(function() {
		if(${sessionScope.user_id==null || sessionScope.user_id==""}){
			alert("로그인이 필요한 서비스입니다.")
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "pay/kakaoPay",
			dataType: "text",
			success: function (result) {
				let parent = window;
				let childWin = window.open(result,"카카오페이 결제창","width=450,height=700");
			},
			error: function (error) {
				alert(error);
			}
	    })
	});
	
	//오늘 날짜를 기준으로 7일을 출력
	//해당 달의 마지막 날 다음은 1일부터 재시작하도록 코드 수정
	function dateList() {
		const date = new Date();
		const year = date.getFullYear();
		const month = date.getMonth() + 1;
	   	
		let tmp = "<ul>";
		for (let i = 0; i < 7; i++) {
			tmp += "<li name='dateValue' class='dateValue' data-screen_date='"
				+ date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "' onclick=''>"
				+ date.getDate() + "일" + "</li>";
			date.setDate(date.getDate() + 1);
		}
		tmp += "</ul>"
	    
	   	$(".date_cell").html(tmp);
	};
	
	//상영정보에 따른 티켓 가격(프론트)
	function getPriceByType(class_type, ticketType) {
		if (class_type == '2D') {
			if (ticketType == '성인') {
				return 14000;
			} else if (ticketType == '청소년') {
				return 12000;
			} else if (ticketType == '우대') {
				return 6000;
			}
		} else if (class_type == '3D') {
			if (ticketType == '성인') {
				return 18000;
			} else if (ticketType == '청소년') {
				return 16000;
			} else if (ticketType == '우대') {
				return 8000;
			}
		} else if (class_type == '4D') {
			if (ticketType == '성인') {
				return 25000;
			} else if (ticketType == '청소년') {
				return 23000;
			} else if (ticketType == '우대') {
				return 17500;
			}
		}
	};
	
	//상영관의 좌석 정보를 출력하는 함수
	function seatList() {
		const seat_rows = $(".scheduleValue.active").attr("data-seat_rows");
		const seat_columns = $(".scheduleValue.active").attr("data-seat_columns");
		
		let tmp = "";
		for (let i = 1; i <= seat_rows; i++) {
			tmp += "<span class='seat_row'>"
				+ String.fromCharCode(i + 64) + "</span>";
			
				for (let j = 1; j <= seat_columns; j++){
					tmp += "<div class='seat empty' data-row_no=" + i + " data-column_no=" + j + ">" + j + "</div>";
				}
				
			tmp += "<br>";
	        
			if (i % 4 == 0)
			tmp += "<br>";
	    }
	    
	    $(".seatAlignment").html(tmp);
	    takenSeatList();
	};
	
	//이미 예약된 좌석을 처리하는 함수
	function takenSeatList() {
		const screen_id = $(".scheduleValue.active").attr("data-screen_id");
		const schedule_id = $(".scheduleValue.active").attr("data-schedule_id");
		const movie_id = $(".scheduleValue.active").attr("data-movie_id");
		const screen_date = $(".scheduleValue.active").attr("data-screen_date");
		$.ajax({
			type: "POST",
			url: "booking/getOwnSeat",
			headers: {"content-type": "application/json"},
			data: JSON.stringify({
				"screen_id": screen_id,
				"schedule_id": schedule_id,
				"movie_id": movie_id,
				"screen_date": screen_date
			}),
			success: function (result) {
				$(result).each(function (idx, ownSeat) {
					const takenSeat = $(".seat").filter("[data-row_no='"+ ownSeat.row_no+ "']").filter("[data-column_no='"+ ownSeat.column_no+ "']");
					takenSeat.toggleClass("empty taken");
					takenSeat.text("X");
				})
	        }
	    })
	};
	
	$(".backwardBtn").click(function(){
		if($(this).parent().hasClass("seatTable")){
		    $(this).parent().hide();
			$("input[name='inputCnt']").val(0);
			$(".seat.selected").toggleClass("selected empty");
			$("#totalPrice").text(0);
		    $(".scheduleTable").show();
		}
		
		if($(this).parent().hasClass("payTable")){
		    $(this).parent().hide();
		    $(".seatTable").show();
		}
	})

</script>
</body>

</html>