package com.bitcamp.semiproj.service;

import com.bitcamp.semiproj.domain.BookingDto;

public interface BookingService {

	int insertBooking(BookingDto bookingDto);
	public String generatebooking_id();
}