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

	
}
