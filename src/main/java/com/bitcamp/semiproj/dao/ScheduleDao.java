package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.ScheduleDto;

public interface ScheduleDao {

	List<ScheduleDto> selectAll();

	List<ScheduleDto> selectBytheater_id(int theater_id);
	
	List<ScheduleDto> selectScheduleInfo(Map<String, String> map);

}