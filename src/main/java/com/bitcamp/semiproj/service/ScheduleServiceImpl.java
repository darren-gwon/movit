package com.bitcamp.semiproj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.ScheduleDao;
import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.ScheduleDto;


@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	ScheduleDao scheduleDao;
	
	public List<ScheduleDto> getAllSchedules(){
		return scheduleDao.selectAll();
	}
	
	public List<ScheduleDto> getMovieBytheater_id(int theater_id){
		return scheduleDao.selectBytheater_id(theater_id);
	}

	@Override
	public List<ScheduleDto> getScheduleInfo(Map<String, String> map) {
		return scheduleDao.selectScheduleInfo(map);
	}
}
