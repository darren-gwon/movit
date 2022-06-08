package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.MovieDto;
import com.bitcamp.semiproj.domain.ScheduleDto;

public interface MovieDao  {

	public List<MovieDto> selectMovieByTheaterName(String theater_name);
	public MovieDto selectMovieByMovie_id(Integer movie_id);

	public List<MovieDto> selectAllMovies();

	
}
