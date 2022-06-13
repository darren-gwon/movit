package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.OwnSeatDto;
import com.bitcamp.semiproj.domain.PriceDto;

@Repository
public class SeatDaoImpl implements SeatDao {
	@Autowired
	SqlSession session;
	
	private final String namespace="com.bitcamp.semiproj.dao.SeatMapper.";
	
	@Override
	public List<OwnSeatDto> selectAllOwnSeat(Map<String, String> map){
		return session.selectList(namespace+"selectOwnSeat", map);
	}
	
	@Override
	public PriceDto selectSeatPrice(Map<String, String> map){
		return session.selectOne(namespace+"selectSeatPrice", map);
	}
}