package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.MovieDto;

public interface MovieService {

	public List<MovieDto> selectMovieByTheaterID(Integer theaterID);
	public MovieDto selectMovieByMovieID(Integer movieID);
	public List<MovieDto> selectAllMovies();
}
