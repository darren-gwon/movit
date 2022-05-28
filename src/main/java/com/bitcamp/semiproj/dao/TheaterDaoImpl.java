package com.bitcamp.semiproj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.TheaterDto;

@Repository
public class TheaterDaoImpl implements TheaterDao {
	
	@Autowired
	SqlSession session;
	
	private final String namespace = "com.bitcamp.semiproj.dao.TheaterMapper.";
	
	@Override
	public List<TheaterDto> selectAll(){
		return session.selectList(namespace+"selectAll");
	}

	@Override
	public List<TheaterDto> selectRegion() {
		return session.selectList(namespace+"selectRegion");
	}
	
	@Override
	public List<TheaterDto> selectByRegion(int regionID) {
		return session.selectList(namespace+"selectTheaterByRegion", regionID);
	}

	
	
	
}
