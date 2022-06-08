package com.bitcamp.semiproj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.MovieDto;

@Repository	
public class MovieDaoImpl implements MovieDao  {
	@Autowired
	SqlSession session;
	
	private final String namespace="com.bitcamp.semiproj.dao.MovieMapper.";
	
	public List<MovieDto> selectMovieByTheaterName(String theater_name){
		return session.selectList(namespace+"selectMovieByTheaterName", theater_name);
	}

	@Override
	public MovieDto selectMovieByMovie_id(Integer movie_id) {
		return session.selectOne(namespace + "selectMovieByMovie_id", movie_id);
	}
	@Override
	public List<MovieDto> selectAllMovies() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectAllMovies");
	}


	
}
