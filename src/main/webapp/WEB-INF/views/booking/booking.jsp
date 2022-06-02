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
									<c:forEach var="r" items="${region}">
										<li name="regionValue" class="regionValue" data-regionid="${r.regionID}">${r.name}</li>
									</c:forEach>
								</ul>
							</div>
							<div class="theater"></div>
						</div>
						<div class="cell movie_cell"></div>
						<div class="cell date_cell"></div>
						<div class="cell schedule_cell"></div>
					</div>
				</div>
			</div>

			<div class="booking_table seatTable" style="display: none;">
				<div class="table_heading">
					<div class="head ticket_and_seat">인원/좌석 선택</div>
				</div>
				<div class="table_body">
					<div class="table_row">
						<div class="cell ticket_cell">
							<div class="simple_movie_info">
								<img src="" class="poster_img">
								<div>
									<img src="" class="age_group"><span class="m_title"></span>
									<span class="m_classtype"></span>
									<span class="m_screen_date"></span>
								</div>
							</div>
							<div class="ticket_qty">
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
				<div class="table_heading">
					<div class="head ticket_and_seat">인원/좌석 선택</div>
				</div>
				<div class="table_body">
					<div class="table_row">
						<div class="cell ticket_cell">
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

			<!--  
			<table class="table seatTable" style="display: '';">
				<tr>
					<td>좌석선택</td>
					<td>구매 정보</td>
				</tr>
				<tr>
					<td class="seat-count">
						<div class="cell">
							성인:
							<button type="button" class="btn btn-outline-dark decreaseBtn cntBtn">-</button>
							<input id="adultCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
							<button type="button" class="btn btn-outline-dark increaseBtn cntBtn">+</button>
						</div>
						<div class="cell">
							청소년:
							<button type="button" class="btn btn-outline-dark decreaseBtn cntBtn">-</button>
							<input id="youthCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
							<button type="button" class="btn btn-outline-dark increaseBtn cntBtn">+</button>
						</div>
						<div class="cell">
							우대:
							<button type="button" class="btn btn-outline-dark decreaseBtn cntBtn" >-</button>
							<input id="specialCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
							<button type="button" class="btn btn-outline-dark increaseBtn cntBtn">+</button>
						</div>
					</td>
					<td rowspan="2" class="seat-result">최종결제금액: <span id="totalPrice" class="totalPrice">0</span>원<br>
						<button type="button" id="doPayment">결제하기</button>
					</td>
				</tr>
				<tr>
					<td class="seat-layout"></td>
				</tr>
			</table>
			-->
			<table class="table payTable" style="display: none;">
				<tr>
					<td>좌석선택</td>
					<td>결제</td>
				</tr>
				<tr>
					<td></td>
					<td><span>간편결제</span> <img src="https://developers.kakao.com/tool/resource/static/img/button/pay/payment_icon_yellow_medium.png" id="kakaopayBtn"></td>
				</tr>
			</table>
		</div>

	</div>
	</div>

	<script>
	initialize();
    //영화 요약
    function setSimpleMovieInfo(){
    	const m_info = $(".simple_movie_info");

    	const poster_img = $(".movieValue.active").data("poster_img");
    	const age_group = $(".movieValue.active").data("age_group");
    	const movie_title = $(".movieValue.active").find(".title").text();
    	const classtype = $(".scheduleValue.active").data("classtype");
    	const screen_date = $(".scheduleValue.active").data("screen_date");
    	
    	m_info.find(".poster_img").attr("src",poster_img);  
    	m_info.find(".age_group").attr("src","/resources/img/movie_ages/txt-age-"+age_group+".png");  
    	m_info.find(".m_title").text(movie_title);  
    	m_info.find(".m_classtype").text(classtype);  
    	m_info.find(".m_screen_date").text(screen_date);  
    }
        
        $(".regionValue").click(function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            const regionID = $(this).attr("data-regionid");
            getTheaterList(regionID);
            getScheduleList();
        });

        function getTheaterList(regionID){
        	$.ajax({
                type: "POST",
                //dataType:"text",
                //headers: {'content-type': 'application/json'},
                data: "regionID=" + regionID,
                url: "booking/getTheaterList",
                success: function (result) {
                    const theaters = result;//JSON.parse(result);
                    let tmp = "<ul>";
                    for (let i = 0; i < theaters.length; i++) {
                        tmp += "<li name='theaterValue' class='theaterValue' data-theaterid=" + theaters[i].theaterID + ">" + theaters[i].name + "</li>";
                    }
                    tmp+="</ul>"
                    $(".theater").html(tmp);
                }
            });
        }
        
        $("div.theater").on("click", "li.theaterValue", function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            const theaterID = $(this).attr("data-theaterid");

            getMovieList(theaterID);
            getScheduleList();
        });
        
        function getMovieList(theaterID){
        	$.ajax({
                type: "POST",
                data: "theaterID=" + theaterID,
                url: "booking/getMovieList",
                success: function (result) {
                    const movies = new Map();
                    $.each(result, function (i, m) {
                        movies.set(m.movieID, m);
                    });
                    let tmp = "<ul>";
                    for (const [key, value] of movies) {
                        tmp += "<li name='movieValue' class='movieValue' data-age_group="+ value.age_group +" data-movieid=" + key + " data-poster_img="+value.poster_img+">"
                        	+ "<img class='age_group' src='/resources/img/movie_ages/txt-age-"+value.age_group+".png'>"
                        	+ "<span class='title'>"+ value.title + "</span></li>";
                    }
                    tmp+="</ul>"
                    $(".movie_cell").html(tmp);
                }
            });
        }

        $("div.movie_cell").on("click", "li.movieValue", function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            $(this).siblings().css("box-shadow","");

            //CHECK이미지 본인에게만 추가
            $(this).children().siblings("img.movieChk").remove();
            $(this).siblings().children().siblings("img.movieChk").remove();
            $(this).children("span.title").after("<img class='movieChk' src='/resources/img/booking/check.png'>")
            $(this).css("box-shadow","0 0 0 2px #000 inset")
            getScheduleList();
            
        });

        $("div.date_cell").on("click", "li.dateValue", function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");

            getScheduleList();
        });
        
        //상영시간표 출력
        function getScheduleList() {

            const regionID = $(".regionValue.active").attr("data-regionid");
            const theaterID = $(".theaterValue.active").attr("data-theaterid");;
            const movieID = $(".movieValue.active").attr("data-movieid");
            const date = $(".dateValue.active").attr("data-date");

            if (regionID != undefined && theaterID != undefined && movieID != undefined && date != undefined) {
                $.ajax({
                    type: "POST",
                    //data: "regionID=" + regionID + "&theaterID=" + theaterID + "&movieID=" + movieID + "&date=" + date,
                    headers:{"content-type":"application/json"},
                    data: JSON.stringify({"regionID":regionID, "theaterID":theaterID, "movieID":movieID, "date":date}),
                    url: "booking/getScheduleList",
                    success: function (result) {
                        let tmp = "<ul>";
                        $(result).each(function (idx, info) {
                            tmp += "<li><span name='scheduleValue' class='scheduleValue' data-screenid=" + info.screenDto.screenID;
                            tmp += " data-scheduleid=" + info.scheduleID + " data-movieid=" + info.movieID + " data-screen_date=" + info.screen_date;
                            tmp += " data-theaterid=" + info.theaterID + " data-start_time=" + info.start_time + " data-end_time=" + info.end_time;
                            tmp += " data-classid=" + info.screenDto.screenClass.classID + " data-classtype=" + info.screenDto.screenClass.class_type;
                            tmp += " data-row_qty=" + info.screenDto.seatDto.row_qty + " data-column_qty=" + info.screenDto.seatDto.column_qty;
                            tmp += " data-total_seat_qty=" + info.screenDto.seatDto.total_seat_qty + " data-screen_name="+info.screenDto.screen_name+">" + info.screenDto.screenClass.class_type + " | " + info.screenDto.screen_name;
                            tmp += " | " + info.start_time + "~" + info.end_time + " | " + info.screenDto.seatDto.total_seat_qty + "</span></li>";
                        });
                        tmp+="</ul>"
                        $(".schedule_cell").html(tmp);
                    }
                });
            }
        }

        //상영 일정 클릭 이벤트
        $("div.schedule_cell").on("click", ".scheduleValue", function () {
        	$(this).removeClass("active");
            $(this).addClass("active");
            seatList();
            setSimpleMovieInfo();
            $(".booking_table.scheduleTable").css("display", "none");
            $(".booking_table.seatTable").css("display", "");
        });

        //좌석 클릭 이벤트
        $(".seatAlignment").on("click", ".seat", function () {
            if ($(this).hasClass("taken")) {
                return;
            }


            const adultCnt = parseInt($("#adultCnt").val());
            const youthCnt = parseInt($("#youthCnt").val());
            const specialCnt = parseInt($("#specialCnt").val());
            
            const totalCnt = adultCnt + youthCnt + specialCnt;
            const selectedCnt = $(this).siblings(".selected").length;

            let totalPrice = parseInt($("#totalPrice").text());
            let price = 0;
            const classType = $(".scheduleValue.active").attr("data-classtype");

            if (totalCnt <= 0) {
                alert("관람하실 인원을 먼저 선택해주세요.");
                return;
            }
            
        	
            if (selectedCnt < adultCnt) {
                price = getPriceByType(classType, '성인');
            } else if (selectedCnt < adultCnt + youthCnt) {
                price = getPriceByType(classType, '청소년');
            } else if (selectedCnt < adultCnt + youthCnt + specialCnt) {
                price = getPriceByType(classType, '우대');
            }

            //선택한 좌석 다시 눌렀을 때 선택 취소시키기
            if ($(this).hasClass("selected")) {
                $(this).toggleClass("selected empty")
                totalPrice -= price;
                $(".totalPrice").text(totalPrice);
                return;
            }

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
        $(".increaseBtn").click(function () {
        	
            const totalCnt = parseInt($("#adultCnt").val()) + parseInt($("#youthCnt").val()) + parseInt($("#specialCnt").val());
            if (totalCnt < 8) {
                const inputCnt = $(this).siblings("input[name='inputCnt']");
                const cnt = parseInt(inputCnt.val());
                inputCnt.val(cnt + 1);
            } else {
                alert("인원 선택은 8명까지만 가능합니다.")
            }
        });

        //카카오페이 클릭이벤트
        $("#kakaopayBtn").click(function () {
            //JSON으로 결제 데이터 보내기
            const adultCnt = parseInt($("#adultCnt").val());
            const youthCnt = parseInt($("#youthCnt").val());
            const specialCnt = parseInt($("#specialCnt").val());
            const totalPrice = parseInt($("#totalPrice").text());

            const movieID = $(".scheduleValue.active").attr("data-movieid");
            const scheduleID = $(".scheduleValue.active").attr("data-scheduleid");
            const screenID = $(".scheduleValue.active").attr("data-screenid");
            const classID = $(".scheduleValue.active").attr("data-classid");
            
            const title = $(".movieValue.active .title").text();
            const quantity = (adultCnt + youthCnt + specialCnt);

        let ownSeatList = "[";
        $(".seat.selected").each(function(idx, el){
        	//ownSeatList+=JSON.stringify($(el).data())+",";
        	ownSeatList+=JSON.stringify($(el).data())+",";

        });
        ownSeatList=ownSeatList.substring(0, ownSeatList.length-1);
        ownSeatList+="]";
        const ownSeatJson = JSON.parse(ownSeatList);
            
            let json = {
                    "cid": "TC0ONETIME",
                    "quantity": quantity,
                    "total_amount": totalPrice,
                    "item_name": title,
                    "adultCnt": adultCnt,
                    "youthCnt": youthCnt,
                    "specialCnt": specialCnt,
                    "totalPrice": totalPrice,
                    "movieID": movieID,
                    "scheduleID": scheduleID,
                    "screenID": screenID,
                    "classID": classID,
                    "bookingDto":{
                    	"seq":null,
                    	"bookingID":null,
                    	"scheduleID":scheduleID,
                    	"pay_tid":null,
                    	"user_id":null,
                    	"quantity":quantity,
                    	"booking_time":null,
                    	"ownSeatList":ownSeatJson
                    }};
            
            $.ajax({
                type: "POST",
                url: "pay/kakaoPay",
                dataType: "text",
                headers: { "content-type": "application/json" },
                data: JSON.stringify(json),
                success: function (result) {
                    let parent = window;
                    let childWin = window.open(result, "카카오페이 결제창", "width=450,height=700");
                },
                error: function (error) {
                    alert(error);
                }
            })
        });

        //결제 페이지 넘어가기 전 가격 유효성체크
        $(".cell.orderInfo_cell").on("click", "#initPayment", function () {
            isValidPrice();
        })

        function isValidPrice() {
        	
        	
        	
            const adultCnt = parseInt($("#adultCnt").val());
            const youthCnt = parseInt($("#youthCnt").val());
            const specialCnt = parseInt($("#specialCnt").val());
            const totalPrice = parseInt($("#totalPrice").text());

            const movieID = $(".scheduleValue.active").attr("data-movieid");
            const scheduleID = $(".scheduleValue.active").attr("data-scheduleid");
            const screenID = $(".scheduleValue.active").attr("data-screenid");
            const classID = $(".scheduleValue.active").attr("data-classid");

        	
            if (adultCnt + youthCnt + specialCnt > $(".seat.selected").length) {
                alert("좌석을 모두 선택해주시기바랍니다.");
                return;
            }
            
            if(specialCnt>=1){
        		alert("우대 요금으로 예매하신 고객님께서는\n"
        				+"상영관 입장 시 증빙서류를 제시해 주시기 바랍니다.\n"
        				+"(미지참 시 입장 제한)\n\n"
        				+"- 장애인: 1~6급 (복지카드)\n"
        				+"- 국가유공자: (국가유공자증)\n"
        				+"- 경로: 만 65세 이상 (신분증)\n\n"
        				+"위 기재된 사항 외 우대 적용 대상 고객님께서는\n"
        				+"현장 매표소에서 우대 발권이 가능합니다.\n"
        				+"우대 요금 선택 시 추가 할인이 제한될 수 있습니다.\n"
        				+"※일부 지점의 경우 경로 우대요금 미운영");
        	}
        	

            $.ajax({
                type: "POST",
                url: "pay/valid",
                headers: { "content-type": "application/json" },
                data: JSON.stringify({
                    "adultCnt": adultCnt, "youthCnt": youthCnt, "specialCnt": specialCnt,
                    "totalPrice": totalPrice, "movieID": movieID, "scheduleID": scheduleID,
                    "screenID": screenID, "classID": classID
                }),
                success: function (result) {
                    $(".seatTable").hide();
                    $(".payTable").show();
                }, error: function () {
                    alert("유효하지 않은 데이터가 있어 예매를 초기화합니다.");
                    location.reload();
                }

            })
        }

        //오늘 날짜를 기준으로 7일을 출력
        function dateList() {
            const date = new Date();
            const year = date.getFullYear();
            const month = date.getMonth() + 1;

            let tmp = "<ul>";
            for (let i = 0; i < 7; i++) {
                tmp += "<li name='dateValue' class='dateValue' data-date='" + date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "' onclick=''>" + date.getDate() + "일" + "</li>"
    			date.setDate(date.getDate()+1);
            }
            tmp+="</ul>"
            $(".date_cell").html(tmp);
        }



        function getPriceByType(classType, ticketType) {
            if (classType == '2D') {
                if (ticketType == '성인') {
                    return 14000;
                } else if (ticketType == '청소년') {
                    return 12000;
                } else if (ticketType == '우대') {
                    return 6000;
                }
            } else if (classType == '3D') {
                if (ticketType == '성인') {
                    return 18000;
                } else if (ticketType == '청소년') {
                    return 16000;
                } else if (ticketType == '우대') {
                    return 8000;
                }
            } else if (classType == '4D') {
                if (ticketType == '성인') {
                    return 25000;
                } else if (ticketType == '청소년') {
                    return 23000;
                } else if (ticketType == '우대') {
                    return 17500;
                }
            }
        }

        function seatList() {
            const row_qty = $(".scheduleValue.active").attr("data-row_qty");
            const column_qty = $(".scheduleValue.active").attr("data-row_qty");

            let tmp = "";
            for (let i = 1; i <= row_qty; i++) {
                tmp += "<span class='seat_row'>"+String.fromCharCode(i+64)+"</span>";
                for (let j = 1; j <= column_qty; j++) {
                	tmp += "<div class='seat empty' data-row_no=" + i + " data-column_no=" + j + ">"+ j +"</div>";
                    //tmp += "<span class='seatIdx available' data-row_no=" + i + " data-column_no=" + j + ">" + j + "</span>";
                }
                tmp+="<br>";
                if(i%4==0){
                	tmp+="<br>";
                }
                
            }
            $(".seatAlignment").html(tmp);
            takenSeatList();
        }

        
        function takenSeatList() {
            const screenID = $(".scheduleValue.active").attr("data-screenid");
            const scheduleID = $(".scheduleValue.active").attr("data-scheduleid");
            const movieID = $(".scheduleValue.active").attr("data-movieid");
            const screen_date = $(".scheduleValue.active").attr("data-screen_date");

            $.ajax({
                type: "POST",	
                url: "booking/getOwnSeat",
                headers: { "content-type": "application/json" },
                data: JSON.stringify({ "screenID": screenID, "scheduleID": scheduleID, "movieID": movieID, "screen_date": screen_date }),
                success: function (result) {
                    $(result).each(function (idx, ownSeat) {
                        const takenSeat = $(".seat").filter("[data-row_no='" + ownSeat.row_no + "']").filter("[data-column_no='" + ownSeat.column_no + "']");
                        takenSeat.toggleClass("empty taken");
                        takenSeat.text("X");
                    })
                }
            });
        }
        
        function initialize(){
            dateList();
            getTheaterList(1);
            getMovieList(1);
        }
    </script>
</body>

</html>