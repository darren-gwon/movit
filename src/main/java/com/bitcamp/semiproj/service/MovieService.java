package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.MovieDto;

public interface MovieService {

	public List<MovieDto> selectMovieByTheaterName(String theater_name);
	public MovieDto selectMovieByMovie_id(Integer movie_id);
	public List<MovieDto> selectAllMovies();
}
