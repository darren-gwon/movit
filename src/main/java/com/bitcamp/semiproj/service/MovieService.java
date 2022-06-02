package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.MovieDto;

public interface MovieService {

	public List<MovieDto> selectMovieByTheaterID(int theaterID);
	public List<MovieDto> selectAllMovies();
}
