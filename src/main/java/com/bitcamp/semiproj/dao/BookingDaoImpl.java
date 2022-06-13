package com.bitcamp.semiproj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.OrderInfoDto;

@Repository
public class BookingDaoImpl implements BookingDao {
	@Autowired
	SqlSession session;
	
	private final String namespace="com.bitcamp.semiproj.dao.BookingMapper.";
	
	@Override
	public int insertBooking(OrderInfoDto orderInfoDto) {
		return session.insert(namespace+"insertBooking", orderInfoDto);
	}
	
	@Override
	public String selectSequence() {
		return session.selectOne(namespace+"selectSequence");
	}
}
