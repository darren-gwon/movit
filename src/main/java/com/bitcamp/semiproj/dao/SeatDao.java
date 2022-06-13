package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.OwnSeatDto;
import com.bitcamp.semiproj.domain.PriceDto;
import com.bitcamp.semiproj.domain.ScheduleDto;

public interface SeatDao {

	List<OwnSeatDto> selectAllOwnSeat(Map<String, String> map);

	PriceDto selectSeatPrice(Map<String, String> map);
	
}