package com.bitcamp.semiproj.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

	@PostMapping("/valid")
	public ResponseEntity<String> validPrice(HttpServletRequest requset, @RequestBody Map<String, String> tickets) {
		System.out.println("tickets"+tickets);
		int realPrice = seatService.isValidPrice(tickets);
		int totalPrice = Integer.valueOf(tickets.get("totalPrice"));

		if (realPrice == totalPrice) {
			return new ResponseEntity<String>("성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("데이터가 없습니다.", HttpStatus.SERVICE_UNAVAILABLE);
		}
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
			BookingDto bookingDto = null;//info.getBookingDto();
			bookingDto.setPay_tid(kPayApprovalDto.getTid());
			bookingDto.setUser_id((String) session.getAttribute("user_id"));
			bookingDto.setBooking_id(bookingService.generatebooking_id());

			bookingService.insertBooking(bookingDto);
			
			session.setAttribute("payInfo", kPayApprovalDto);
			session.setAttribute("orderInfo", info);
			session.setAttribute("bookingDto", bookingDto);

			return "pay/success.tiles";
		}

		return "pay/fail.tiles";
	}

	/*
	 * @PostMapping("/kakaoPay")
	 * 
	 * @ResponseBody public String kakaopayReady(@RequestBody OrderInfoDto
	 * orderInfo, HttpSession session) { session.setAttribute("user_id",
	 * "asdf1234"); session.setAttribute("orderInfoDto", orderInfo); return
	 * kakaoPayService.ready(session); }
	 */

	@PostMapping("/kakaoPay")
	@ResponseBody
	public String kakaopayReady(@RequestBody String jsonObj, HttpSession session) {

		System.out.println(jsonObj);
		ObjectMapper objMapper = new ObjectMapper();
		objMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		try {
			OrderInfoDto orderInfo = objMapper.readValue(jsonObj, OrderInfoDto.class);
			
			System.out.println(orderInfo);
			session.setAttribute("orderInfoDto", orderInfo);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kakaoPayService.ready(session);
	}
}
