package com.bitcamp.semiproj.dao;

import com.bitcamp.semiproj.domain.BookingDto;

public interface BookingDao {

	int insertBooking(BookingDto bookingDto);

	String selectSequence();

}