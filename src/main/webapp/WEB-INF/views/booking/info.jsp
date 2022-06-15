<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<link href="/resources/css/info.css" rel='stylesheet' />

<meta charset="UTF-8">
<title>MOVIT 결제 성공</title>
</head>
<body>
	<div class="content">
	<h3>예매 성공!</h3>
	<img src="https://cdn-icons-png.flaticon.com/512/190/190411.png" class="pay_success">
	<h2 class="message">즐거운 관람되시길 바랍니다!</h2>
		<div class="paySuccessInfo">
			<table class="table table-striped payment_info">
				<tr>
					<td colspan="2">예매정보</td>
				</tr>
				<tr>
					<td>결제일자</td>
					<td>${payInfo.approved_at}</td>
				</tr>
				<tr>
					<td>예매번호</td>
					<td>${orderInfoDto.booking_id}</td>
				</tr>
				<tr>
					<td>결제번호</td>
					<td>${orderInfoDto.pay_tid}</td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td>${payInfo.payment_method_type}</td>
				</tr>
				<tr>
					<td>영화관</td>
					<td>${orderInfoDto.theater_name}</td>
				</tr>
				<tr>
					<td>상영시간 </td>
				<td>${orderInfoDto.screen_date} | ${orderInfoDto.start_time} ~ ${orderInfoDto.end_time}</td>
				</tr>
				<tr>
					<td>영화명</td>
					<td>${orderInfoDto.title}</td>
				</tr>
				
				<tr>
					<td>총수량</td>
					<td>${orderInfoDto.quantity} 장</td>
				</tr>
				<tr>
					<td>총금액</td>
					<td>${orderInfoDto.totalPrice}원</td>
				</tr>
				<tr>
					<td>좌석번호</td>
					<td>준비중</td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>