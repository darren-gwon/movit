package com.bitcamp.semiproj.service;

import java.util.List;


import com.bitcamp.semiproj.domain.EventDto;

public interface EventService {
	
	public List <EventDto> eventpage(int startnum, int perpage);

	public List <EventDto> eventlist();	
	
	public void eventwriteform (EventDto dto);

	public EventDto detail(int seq);

	public void updateform(EventDto dto);

	public void readcount(EventDto dto);
	
	public void delete(int seq);

	public int postcount();
	

}
