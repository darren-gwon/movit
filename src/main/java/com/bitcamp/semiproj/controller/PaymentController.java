package com.bitcamp.semiproj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.KakaoPayApprovalDto;
import com.bitcamp.semiproj.domain.OrderInfoDto;
import com.bitcamp.semiproj.service.BookingService;
import com.bitcamp.semiproj.service.KakaoPayService;
import com.bitcamp.semiproj.service.SeatService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/pay")
public class PaymentController {

	@Autowired
	private SeatService seatService;
	@Autowired
	private KakaoPayService kakaoPayService;
	@Autowired
	private BookingService bookingService;

	@Autowired
	@Qualifier("jacksonObjectMapper")
	ObjectMapper objMapper;

	@PostMapping("/valid")
	public ResponseEntity<String> validPrice(HttpSession session, @RequestBody String json) {// Map<String, String> tickets) {

		OrderInfoDto tmpOrderDto;
		try {
			tmpOrderDto = objMapper.readValue(json, OrderInfoDto.class);
			
			Map<String, String> tickets = new HashMap<>();
			tickets.put("adultCnt", tmpOrderDto.getAdultCnt().toString());
			tickets.put("youthCnt", tmpOrderDto.getYouthCnt().toString());
			tickets.put("specialCnt", tmpOrderDto.getSpecialCnt().toString());
			tickets.put("totalPrice", tmpOrderDto.getTotalPrice().toString());
			tickets.put("class_type", tmpOrderDto.getClass_type().toString());
			tickets.put("quantity", tmpOrderDto.getQuantity().toString());

			int realPrice = seatService.isValidPrice(tickets);
			int totalPrice = tmpOrderDto.getTotalPrice();


			if (realPrice == totalPrice) {

				OrderInfoDto orderInfoDto = (OrderInfoDto) session.getAttribute("orderInfoDto");

				orderInfoDto.setAdultCnt(tmpOrderDto.getAdultCnt());
				orderInfoDto.setYouthCnt(tmpOrderDto.getYouthCnt());
				orderInfoDto.setSpecialCnt(tmpOrderDto.getSpecialCnt());
				orderInfoDto.setTotalPrice(tmpOrderDto.getTotalPrice());
				orderInfoDto.setOwnSeatList(tmpOrderDto.getOwnSeatList());
				orderInfoDto.setQuantity(tmpOrderDto.getQuantity());

			} else {
				return new ResponseEntity<String>("데이터가 없습니다.", HttpStatus.SERVICE_UNAVAILABLE);
			}

		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>("데이터가 없습니다.", HttpStatus.SERVICE_UNAVAILABLE);

		}
		return new ResponseEntity<String>("성공", HttpStatus.OK);

	}

	@GetMapping("/kakaoPayFail")
	public String payFail() {
		return "pay/fail.tiles";
	}

	@GetMapping("/kakaoPayCancel")
	public String payCandel() {
		return "pay/cancel.tiles";
	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(String pg_token, Model model, HttpSession session) {
		OrderInfoDto info = (OrderInfoDto) session.getAttribute("orderInfoDto");

		KakaoPayApprovalDto kPayApprovalDto = kakaoPayService.payInfo(pg_token, session);
		if (kPayApprovalDto != null) {
			info.setPay_tid(kPayApprovalDto.getTid());
			info.setUser_id((String) session.getAttribute("user_id"));
			info.setBooking_id(bookingService.generatebooking_id());
			info.setOwnSeatList(info.getOwnSeatList());
			bookingService.insertBooking(info);

			session.setAttribute("payInfo", kPayApprovalDto);
//			session.setAttribute("orderInfo", info);
//			session.setAttribute("bookingDto", bookingDto);

			return "pay/success.tiles";
		}

		return "pay/fail.tiles";
	}

	@PostMapping("/kakaoPay")
	@ResponseBody
	public String kakaopayReady(HttpSession session) {
		return kakaoPayService.ready(session);
	}
}
