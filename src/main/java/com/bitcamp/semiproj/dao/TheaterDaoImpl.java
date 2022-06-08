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
	public List<TheaterDto> selectRegions() {
		return session.selectList(namespace+"selectRegions");
	}
	
	@Override
	public List<TheaterDto> selectByRegion(String region_name) {
		return session.selectList(namespace+"selectTheatersByRegion", region_name);
	}

	/*
	 * <select id="selectTheatersByRegion" parameterType="String"
	 * resultType="TheaterDto"> SELECT theater_id, theater_name FROM theater where
	 * region_name=#{region_name} </select> <select id="selectRegions"
	 * resultType="TheaterDto"> SELECT region_name from theater group by
	 * region_name; </select>
	 */
	
	
}
