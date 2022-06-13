package com.bitcamp.semiproj.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.BookingDao;
import com.bitcamp.semiproj.domain.OrderInfoDto;

@Service
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	BookingDao bookingDao;

	public int insertBooking(OrderInfoDto orderInfoDto) {
		return bookingDao.insertBooking(orderInfoDto);
	}
	
	public String generatebooking_id() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		sdf.format(new Date());
		
		return sdf.format(new Date())+bookingDao.selectSequence();
	}
}
