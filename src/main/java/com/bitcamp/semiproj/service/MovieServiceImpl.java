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
	
	public List<MovieDto> selectMovieByTheaterID(int theaterID){
		return movieDao.selectMovieByTheaterID(theaterID);
	}
	
	@Override
	public MovieDto selectMovieByMovieID(int movieID) {
		return movieDao.selectMovieByMovieID(movieID);
	}
}
