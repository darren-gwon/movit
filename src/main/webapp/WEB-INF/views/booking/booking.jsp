<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">  -->
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        table {
            border: 1px solid black;
            width: 900px;
            height: 500px;
            text-align: center;
        }

        th,
        td {
            border: 1px solid black;
        }

        ul {
            list-style: none;
            padding-left: 0px;
            cursor: pointer;
        }

        .active {
            font-weight: bold;
        }

        .available {}

        .taken {
            color: grey;
            font-weight: bold;
        }

        .unavailable {}

        .selected {
            color: red;
            font-weight: bold;
        }

        .seatIdx {
            width: 30px;
            height: 30px;
            display: inline-block;
            text-align: center;
            cursor: pointer;
        }

        #kakaopayBtn {
            cursor: pointer;
        }
    </style>
</head>

<body>
    BOOKING VIEW
    <br>
    <table class="table scheduleTable">
        <tr>
            <th colspan="2">영화관</th>
            <th>영화</th>
            <th>날짜</th>
            <th>상영시간</th>

        </tr>
        <tr>
            <td class="region">
                <c:forEach var="r" items="${region}">
                    <ul name="regionValue" class="regionValue" data-regionid="${r.regionID}">${r.name}</ul>
                </c:forEach>
            </td>
            <td class="theater">상영관</td>
            <td class="movieTitle">제목</td>
            <td class="date"><br></td>
            <td class="schedule">시간</td>
        </tr>
    </table>
    <table class="table seatTable" style="display: none;">
        <tr>
            <td>좌석선택</td>
            <td>구매 정보</td>
        </tr>
        <tr>
            <td class="seat-count">
                <div class="cell">
                    성인: <button type="button" class="decreaseBtn" class="cntBtn">-</button>
                    <input id="adultCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
                    <button type="button" class="increaseBtn" class="cntBtn">+</button>
                </div>
                <div class="cell">
                    청소년: <button type="button" class="decreaseBtn" class="cntBtn">-</button>
                    <input id="youthCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
                    <button type="button" class="increaseBtn" class="cntBtn">+</button>
                </div>
                <div class="cell">
                    우대: <button type="button" class="decreaseBtn" class="cntBtn">-</button>
                    <input id="specialCnt" name="inputCnt" class="inputCnt" type="text" value="0" />
                    <button type="button" class="increaseBtn" class="cntBtn">+</button>
                </div>
            </td>
            <td rowspan="2" class="seat-result">
                최종결제금액: <span id="totalPrice" class="totalPrice">0</span>원<br>
                <button type="button" id="doPayment">결제하기</button>
            </td>
        </tr>
        <tr>
            <td class="seat-layout">
                좌석 선택 영역
            </td>
        </tr>
    </table>
    <table class="table payTable" style="display: none;">
        <tr>
            <td>좌석선택</td>
            <td>결제</td>
        </tr>
        <tr>
            <td>

            </td>
            <td>
                <span>간편결제</span>
                <img src="https://developers.kakao.com/tool/resource/static/img/button/pay/payment_icon_yellow_medium.png"
                    id="kakaopayBtn">
            </td>
        </tr>
    </table>
    <br>
    <br>
    <hr>
    ${theater2}
    <script>
        dateList();

        $(".regionValue").click(function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            const regionID = $(this).attr("data-regionid");

            $.ajax({
                type: "POST",
                //dataType:"text",
                //headers: {'content-type': 'application/json'},
                data: "regionID=" + regionID,
                url: "booking/getTheaterList",
                success: function (result) {
                    const theaters = result;//JSON.parse(result);
                    let tmp = "";
                    for (let i = 0; i < theaters.length; i++) {
                        tmp += "<ul name='theaterValue' class='theaterValue' data-theaterid=" + theaters[i].theaterID + ">" + theaters[i].name + "</ul>";
                    }
                    $(".theater").html(tmp);
                }
            });
            getScheduleList();
        });

        $("td.theater").on("click", "ul.theaterValue", function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            const theaterID = $(this).attr("data-theaterid");

            $.ajax({
                type: "POST",
                data: "theaterID=" + theaterID,
                url: "booking/getMovieList",
                success: function (result) {
                    const movies = new Map();
                    $.each(result, function (i, m) {
                        movies.set(m.movieID, m);
                    });
                    let tmp = "";
                    for (const [key, value] of movies) {
                        tmp += "<ul name='movieValue' class='movieValue' data-age_group="+ value.age_group +" data-movieid=" + key + ">" + "<span class='age_group'	>(" + (value.age_group == 0 ? '전체' : value.age_group) + ")</span><span class='title'>" + value.title + "</span></ul>";
                    }
                    $(".movieTitle").html(tmp);
                }
            });
            getScheduleList();
        });

        $("td.movieTitle").on("click", "ul.movieValue", function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            getScheduleList();
            /* 	$.ajax({
                    type:"POST",
                    data:"theaterID="+theaterID,
                    url:"booking/getMovieList",
                    success:function(result){
                        const movies = new Map();
                        $.each(result, function(i, m){
                            movies.set(m.movieID, m.title);
                        });
                        let tmp = "";
                        for (const [key, value] of movies) {
                            tmp += "<ul name='movieValue' class='movieValue' data-movieID='"+key+"'>"+value+"</ul>";
                        }
                        $(".movieTitle").html(tmp);
                    }
                }); */
        });

        $("td.date").on("click", "ul.dateValue", function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            getScheduleList();
        });

        //상영 일정 클릭 이벤트
        $("td.schedule").on("click", "span.scheduleValue", function () {
            $("span.scheduleValue").removeClass("active");
            $(this).addClass("active");
            seatList();
            $("table.scheduleTable").css("display", "none");
            $("table.seatTable").css("display", "");
        });

        //좌석 클릭 이벤트
        $("td.seat-layout").on("click", "span.seatIdx", function () {
            if ($(this).hasClass("taken")) {
                return;
            }

            const adultCnt = parseInt($("#adultCnt").val());
            const youthCnt = parseInt($("#youthCnt").val());
            const specialCnt = parseInt($("#specialCnt").val());

            const totalCnt = adultCnt + youthCnt + specialCnt;
            const selectedCnt = $(this).siblings(".selected").length;

            let totalPrice = parseInt($(".totalPrice").text());
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
                $(this).removeClass("selected")
                totalPrice -= price;
                $(".totalPrice").text(totalPrice);
                return;
            }

            if (totalCnt > $("span.seatIdx.selected").length) {
                $(this).addClass("selected")
                totalPrice += price;

                $(".totalPrice").text(totalPrice);

            } else {
                return;
            }
        });

        //-버튼 이벤트
        $(".decreaseBtn").click(function () {
            const myCnt = $(this).siblings("input[name='inputCnt']").val();
            if ($("span.seatIdx.selected").length >= 1) {
                const reset = confirm("선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?");
                if (reset) {
                    $("input[name='inputCnt']").val(0);
                    $("span.seatIdx.selected").removeClass("selected");
                    $(".totalPrice").text(0);
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

            const movieID = $("span.scheduleValue.active").attr("data-movieid");
            const scheduleID = $("span.scheduleValue.active").attr("data-scheduleid");
            const screenID = $("span.scheduleValue.active").attr("data-screenid");
            const classID = $("span.scheduleValue.active").attr("data-classid");
            
            const title = $(".movieValue.active .title").text();
            const quantity = (adultCnt + youthCnt + specialCnt);

        let ownSeatList = "[";
        $(".seatIdx.selected").each(function(idx, el){
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
        $(".seat-result").on("click", "#doPayment", function () {
            isValidPrice();
        })

        function isValidPrice() {
        	
        	
        	
            const adultCnt = parseInt($("#adultCnt").val());
            const youthCnt = parseInt($("#youthCnt").val());
            const specialCnt = parseInt($("#specialCnt").val());
            const totalPrice = parseInt($("#totalPrice").text());

            const movieID = $("span.scheduleValue.active").attr("data-movieid");
            const scheduleID = $("span.scheduleValue.active").attr("data-scheduleid");
            const screenID = $("span.scheduleValue.active").attr("data-screenid");
            const classID = $("span.scheduleValue.active").attr("data-classid");

            if (adultCnt + youthCnt + specialCnt > $("span.seatIdx.selected").length) {
                alert("좌석을 모두 선택해주시기바랍니다.");
                return;
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
            const today = new Date();
            const year = today.getFullYear();
            const month = today.getMonth() + 1;
            const day = today.getDate();
            console.log(year + "/" + month + "/" + day);

            let tmp = "";
            for (let i = 0; i < 7; i++) {
                tmp += "<ul name='dateValue' class='dateValue' data-date='" + year + "-" + month + "-" + (day + i) + "' onclick=''>" + (day + i) + "일" + "</ul>"
            }
            $(".date").html(tmp);
        }

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
                        let tmp = "";
                        $(result).each(function (idx, info) {
                            tmp += "<ul><span name='scheduleValue' class='scheduleValue' data-screenid=" + info.screenDto.screenID;
                            tmp += " data-scheduleid=" + info.scheduleID + " data-movieid=" + info.movieID + " data-screen_date=" + info.screen_date;
                            tmp += " data-theaterid=" + info.theaterID + " data-start_time=" + info.start_time + " data-end_time=" + info.end_time;
                            tmp += " data-classid=" + info.screenDto.screenClass.classID + " data-classtype=" + info.screenDto.screenClass.class_type;
                            tmp += " data-row_qty=" + info.screenDto.seatDto.row_qty + " data-column_qty=" + info.screenDto.seatDto.column_qty;
                            tmp += " data-total_seat_qty=" + info.screenDto.seatDto.total_seat_qty + ">" + info.screenDto.screenClass.class_type + " | " + info.screenDto.screen_name;
                            tmp += " | " + info.start_time + "~" + info.end_time + " | " + info.screenDto.seatDto.total_seat_qty + "</span></ul>";
                        });
                        $(".schedule").html(tmp);
                    }
                });
            }
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
            const row_qty = $("span.scheduleValue.active").attr("data-row_qty");
            const column_qty = $("span.scheduleValue.active").attr("data-row_qty");

            let tmp = "";
            tmp += "<span>" + "----- SCREEN -----" + "</span><br><br>"
            for (let i = 0; i < row_qty; i++) {
                tmp += "<span>[행:" + i + "]</span>";
                for (let j = 0; j < column_qty; j++) {
                    tmp += "<span class='seatIdx available' data-row_no=" + i + " data-column_no=" + j + ">" + j + "</span>";
                }
                tmp += "<br>";
            }
            $(".seat-layout").html(tmp);
            takenSeatList();
        }

        function takenSeatList() {

            const screenID = $("span.scheduleValue.active").attr("data-screenid");
            const scheduleID = $("span.scheduleValue.active").attr("data-scheduleid");
            const movieID = $("span.scheduleValue.active").attr("data-movieid");
            const screen_date = $("span.scheduleValue.active").attr("data-screen_date");


            $.ajax({
                type: "POST",	
                url: "booking/getOwnSeat",
                headers: { "content-type": "application/json" },
                data: JSON.stringify({ "screenID": screenID, "scheduleID": scheduleID, "movieID": movieID, "screen_date": screen_date }),
                success: function (result) {
                    $(result).each(function (idx, ownSeat) {
                        const takenSeat = $(".seatIdx").filter("[data-row_no='" + ownSeat.row_no + "']").filter("[data-column_no='" + ownSeat.column_no + "']");
                        takenSeat.text("X");
                        takenSeat.removeClass("available");
                        takenSeat.addClass("taken");
                    })
                }
            });
        }
    </script>
</body>

</html>