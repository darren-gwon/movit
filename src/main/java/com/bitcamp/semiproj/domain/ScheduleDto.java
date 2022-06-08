package com.bitcamp.semiproj.domain;

public class ScheduleDto {

	private Integer schedule_id;
	private Integer movie_id;
	private String screen_date;
	private String start_time;
	private String end_time;
	private TheaterDto theaterDto;
	
	public Integer getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(Integer schedule_id) {
		this.schedule_id = schedule_id;
	}

	public Integer getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(Integer movie_id) {
		this.movie_id = movie_id;
	}
	public String getScreen_date() {
		return screen_date;
	}
	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public TheaterDto getTheaterDto() {
		return theaterDto;
	}
	public void setTheaterDto(TheaterDto theaterDto) {
		this.theaterDto = theaterDto;
	}
	@Override
	public String toString() {
		return "ScheduleDto [schedule_id=" + schedule_id + ", movie_id=" + movie_id + ", screen_date=" + screen_date
				+ ", start_time=" + start_time + ", end_time=" + end_time + ", theaterDto=" + theaterDto + "]";
	}
	
	

		
}
