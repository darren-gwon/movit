package com.bitcamp.semiproj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/movie")
public class MovieHomeController {

	@GetMapping("/moviehome")
	public String moviewhome(){
		
	return "movie/movie.tiles";
	}
	
	@GetMapping("/moviedetail")
	public String moviewdetail(@RequestParam int movieID, Model model){
		model.addAttribute("movieID",movieID);
	return "movie/movieDetail.tiles";
	}
}
