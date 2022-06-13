package com.bitcamp.semiproj.service;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.OrderInfoDto;

public interface BookingService {

	int insertBooking(OrderInfoDto orderInfoDto);
	public String generatebooking_id();
}