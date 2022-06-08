package com.bitcamp.semiproj.controller;

import java.util.List;

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
	public String moviewdetail(@RequestParam int movie_id, Model model){
		MovieDto dto = movieService.selectMovieByMovie_id(movie_id);
		String [] trailer_url = dto.getTrailer_url().split(",");
		for(int i=0; i<trailer_url.length; i++) {
			model.addAttribute("trailer_url"+(i+1), trailer_url[i]);
		}
		String [] still_cut = dto.getStill_cut().split(",");
		for(int i=0; i<still_cut.length; i++) {
			model.addAttribute("still_cut"+(i+1), still_cut[i]);
		}
		//model.addAttribute("trailer_url", trailer_url);
		model.addAttribute("movie_id", movie_id);
		model.addAttribute("dto", dto);
	return "movie/movieDetail.tiles";
	}
}
