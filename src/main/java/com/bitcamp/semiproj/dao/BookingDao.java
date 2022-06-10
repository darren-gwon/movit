package com.bitcamp.semiproj.dao;

import com.bitcamp.semiproj.domain.OrderInfoDto;

public interface BookingDao {

	int insertBooking(OrderInfoDto orderInfoDto);

	String selectSequence();

}