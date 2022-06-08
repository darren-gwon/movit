package com.bitcamp.semiproj.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.OwnSeatDto;

public interface SeatService {

	List<OwnSeatDto> getAllOwnSeats(Map<String, String> map);
	public int isValidPrice(Map<String, String> tickets);
	
}