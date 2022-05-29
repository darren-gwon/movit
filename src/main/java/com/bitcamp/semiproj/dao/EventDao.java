package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.EventDto;

public interface EventDao {
	public List<EventDto> eventlist();
	public List<EventDto> eventpage(Map<String, Object> map);
	public void eventwriteform(EventDto dto); 
	public EventDto detail(int seq); 
	public void updateform(EventDto dto);
	public void readcount(EventDto dto); 
	public void delete (int seq); 
    public int postcount(); 



}
