package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.MovieDto;
import com.bitcamp.semiproj.domain.ScheduleDto;

public interface MovieDao  {

	public List<MovieDto> selectMovieByTheaterID(int theaterID);
	public MovieDto selectMovieByMovieID(int movieID);

	public List<MovieDto> selectAllMovies();
	MovieDto selectMovieByMovieID(String movieID);

	
}
