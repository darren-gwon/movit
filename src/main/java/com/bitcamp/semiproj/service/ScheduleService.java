package com.bitcamp.semiproj.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.ScheduleDto;

public interface ScheduleService {
	public List<ScheduleDto> getAllSchedules();
	
	public List<ScheduleDto> getMovieByTheaterID(int theaterID);
	
	public List<ScheduleDto> getScheduleInfo(Map<String, String> map);
}