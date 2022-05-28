package com.bitcamp.semiproj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.BookingDto;

@Repository
public class BookingDaoImpl implements BookingDao {
	@Autowired
	SqlSession session;
	
	private final String namespace="com.bitcamp.semiproj.dao.BookingMapper.";
	
	@Override
	public int insertBooking(BookingDto bookingDto) {
		return session.insert(namespace+"insertBooking", bookingDto);
	}
	
	@Override
	public String selectSequence() {
		return session.selectOne(namespace+"selectSequence");
	}
}
