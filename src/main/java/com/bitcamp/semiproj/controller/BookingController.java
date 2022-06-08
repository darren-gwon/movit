package com.bitcamp.semiproj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.KakaoPayApprovalDto;
import com.bitcamp.semiproj.domain.MovieDto;
import com.bitcamp.semiproj.domain.OrderInfoDto;
import com.bitcamp.semiproj.domain.OwnSeatDto;
import com.bitcamp.semiproj.domain.ScheduleDto;
import com.bitcamp.semiproj.domain.TheaterDto;
import com.bitcamp.semiproj.service.MovieService;
import com.bitcamp.semiproj.service.ScheduleService;
import com.bitcamp.semiproj.service.SeatService;
import com.bitcamp.semiproj.service.TheaterService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	TheaterService theaterService;
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	MovieService movieService;
	@Autowired
	SeatService seatService;

	@GetMapping("")
	public String booking(Model m) {
		List<TheaterDto> region = theaterService.getAllRegions();
		m.addAttribute("region", region);
		return "booking/booking.tiles";
	}

	@PostMapping("/getTheaterList")
	@ResponseBody
	public List<TheaterDto> theaterList(String region_name) {
		return theaterService.getTheatersByRegion(region_name);
	}

	@PostMapping("/getMovieList")
	@ResponseBody
	public List<MovieDto> movieList(String theater_name) {
		return movieService.selectMovieByTheaterName(theater_name);
	}

	@PostMapping("/getScheduleList")
	@ResponseBody
	public List<ScheduleDto> scheduleList(@RequestBody Map<String, String> map) {
		return scheduleService.getScheduleInfo(map);
	}

	@PostMapping("/myOrderInfo")
	@ResponseBody
	public void myOrderInfo(@RequestBody String jsonObj, HttpSession session) {

		ObjectMapper objMapper = new ObjectMapper();
		objMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		OrderInfoDto orderInfoDto;
			try {
				orderInfoDto = objMapper.readValue(jsonObj, OrderInfoDto.class);
				System.out.println(orderInfoDto);
				session.setAttribute("orderInfo", orderInfoDto);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	/*
	 * ObjectMapper objMapper = new ObjectMapper();
	 * objMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,
	 * false); OrderInfoDto orderInfoDto; try { orderInfoDto =
	 * objMapper.readValue(orderInfo, OrderInfoDto.class);
	 */

	@PostMapping("/getOwnSeat")
	@ResponseBody
	public List<OwnSeatDto> selectSeat(@RequestBody Map<String, String> map) {
		return seatService.getAllOwnSeats(map);
	}

	@GetMapping("/info")
	public String bookinginfo(HttpSession session, Model m) {

		KakaoPayApprovalDto payInfo = (KakaoPayApprovalDto) session.getAttribute("payInfo");
		OrderInfoDto orderInfo = (OrderInfoDto) session.getAttribute("orderInfo");
		BookingDto bookingDto = (BookingDto) session.getAttribute("bookingDto");
		MovieDto movieDto = null;// movieService.selectMovieByMovie_id(orderInfo.getMovie_id());
		System.out.println(payInfo);
		System.out.println(orderInfo);
		System.out.println(bookingDto);

		m.addAttribute("payInfo", payInfo);
		m.addAttribute("orderInfo", orderInfo);
		m.addAttribute("bookingDto", bookingDto);
		m.addAttribute("movieDto", movieDto);

		session.removeAttribute("payInfo");
		session.removeAttribute("payInfo");

		session.removeAttribute("orderInfo");
		session.removeAttribute("bookingDto");

		return "booking/info.tiles";
	}
	
	@GetMapping("/getOrderInfo")
	@ResponseBody
	public OrderInfoDto summerizedMovieInfo(HttpSession session) {
		return (OrderInfoDto)session.getAttribute("orderInfo");
	}
}
