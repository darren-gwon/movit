package com.bitcamp.semiproj.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.domain.MovieDto;
import com.bitcamp.semiproj.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieHomeController {

	@Autowired
	MovieService movieService;
	
	@GetMapping("")
	public String moviewhome(Model m){
		List<MovieDto> movieDto = movieService.selectAllMovies();
	
		m.addAttribute("movieDto", movieDto);
		
	return "movie/movie.tiles";
	}
	
	@GetMapping("/detail")
	public String moviewdetail(@RequestParam int movieID, Model model){
		model.addAttribute("movieID",movieID);
	return "movie/movieDetail.tiles";
	}
}
