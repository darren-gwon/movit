package com.bitcamp.semiproj.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.semiproj.domain.MovieDto;
import com.bitcamp.semiproj.domain.OwnSeatDto;
import com.bitcamp.semiproj.domain.ScheduleDto;
import com.bitcamp.semiproj.domain.TheaterDto;
import com.bitcamp.semiproj.service.MovieService;
import com.bitcamp.semiproj.service.ScheduleService;
import com.bitcamp.semiproj.service.SeatService;
import com.bitcamp.semiproj.service.TheaterService;

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
	public List<TheaterDto> theaterList(int regionID){
		return theaterService.getTheaterByRegion(regionID);
	}
	
	@PostMapping("/getMovieList")
	@ResponseBody
	public List<MovieDto> movieList(int theaterID){
		return movieService.selectMovieByTheaterID(theaterID);
	}
	
	@PostMapping("/getScheduleList")
	@ResponseBody
	public List<ScheduleDto> scheduleList(@RequestBody Map<String, String> map){
		return scheduleService.getScheduleInfo(map);
	}

	@PostMapping("/getOwnSeat")
	@ResponseBody
	public List<OwnSeatDto> selectSeat(@RequestBody Map<String,String> map){
		return seatService.getAllOwnSeats(map);	
	}
	
	@GetMapping("/info")
	public String bookinginfo() {
		return "booking/info.tiles";
	}
}
