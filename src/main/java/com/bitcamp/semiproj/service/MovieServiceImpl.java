package com.bitcamp.semiproj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.MovieDao;
import com.bitcamp.semiproj.domain.MovieDto;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	MovieDao movieDao;
	
	public List<MovieDto> selectMovieByTheaterName(String theater_name){
		return movieDao.selectMovieByTheaterName(theater_name);
	}
	
	@Override
	public MovieDto selectMovieByMovie_id(Integer movie_id) {
		return movieDao.selectMovieByMovie_id(movie_id);
	}	
	
	@Override
	public List<MovieDto> selectAllMovies() {
		// TODO Auto-generated method stub
		return movieDao.selectAllMovies();
	}
}
