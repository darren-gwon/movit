package com.bitcamp.semiproj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class MovieHomeController {

	@GetMapping("/moviehome")
	public String moviewhome(){
		
	return "movie/movie.tiles";
	}
	
	@GetMapping("/moviedetail")
	public String moviewdetail(){
	return "movie/movieDetail.tiles";
	}
}
