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
	
	public List<MovieDto> selectMovieByTheaterID(int theaterID){
		return session.selectList(namespace+"selectMovieByTheaterID", theaterID);
	}

	@Override
	public MovieDto selectMovieByMovieID(String movieID) {
		return session.selectOne(namespace + "selectMovieByMovieID", movieID);
	}
	@Override
	public List<MovieDto> selectAllMovies() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectAllMovies");
	}

	@Override
	public MovieDto selectMovieByMovieID(int movieID) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
