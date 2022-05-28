package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.ScheduleDto;

@Repository	
public class ScheduleDaoImpl implements ScheduleDao {
	@Autowired
	SqlSession session;
	
	private final String namespace="com.bitcamp.semiproj.dao.ScheduleMapper.";
	
	@Override
	public List<ScheduleDto> selectAll(){
		return session.selectList(namespace+"selectAll");
	}
	
	@Override
	public List<ScheduleDto> selectByTheaterID(int theaterID){
		return session.selectList(namespace+"selectByTheaterID", theaterID);
	}

	@Override
	public List<ScheduleDto> selectScheduleInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectScheduleInfo", map);
	}
	
}
