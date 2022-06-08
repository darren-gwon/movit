package com.bitcamp.semiproj.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.ScheduleDto;

public interface ScheduleService {
	public List<ScheduleDto> getAllSchedules();
	
	public List<ScheduleDto> getMovieBytheater_id(int theater_id);
	
	public List<ScheduleDto> getScheduleInfo(Map<String, String> map);
}