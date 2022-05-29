package com.bitcamp.semiproj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.EventDaoImpl;
import com.bitcamp.semiproj.domain.EventDto;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDaoImpl dao;

	@Override
	public List<EventDto> eventpage(int startnum, int perpage) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("startnum", startnum);
		map.put("perpage", perpage);
		
		return dao.eventpage(map);
	}
	
	@Override
	public List<EventDto> eventlist() {
		// TODO Auto-generated method stub
		return dao.eventlist();
	}
	
	@Override
	public void eventwriteform(EventDto dto) {
		dao.eventwriteform(dto);

	}

	@Override
	public EventDto detail(int seq) {
		return dao.detail(seq);
	}

	@Override
	public void updateform(EventDto dto) {
		dao.updateform(dto);

	}

	@Override
	public void readcount(EventDto dto) {
		dao.readcount(dto);

	}

	@Override
	public void delete(int seq) {
		dao.delete(seq);

	}

	@Override
	public int postcount() {
		return dao.postcount();
	}


}