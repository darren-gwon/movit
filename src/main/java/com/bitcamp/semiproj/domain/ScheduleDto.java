package com.bitcamp.semiproj.domain;

public class ScheduleDto {
	private Integer scheduleID;
	private Integer theaterID;
	private Integer screenID;
	private Integer movieID;
	private String screen_date;
	private String start_time;
	private String end_time;
	private ScreenDto screenDto;
	
	
	public Integer getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(Integer scheduleID) {
		this.scheduleID = scheduleID;
	}
	public Integer getScreenID() {
		return screenID;
	}
	public void setScreenID(Integer screenID) {
		this.screenID = screenID;
	}
	public Integer getMovieID() {
		return movieID;
	}
	public void setMovieID(Integer movieID) {
		this.movieID = movieID;
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
	public Integer getTheaterID() {
		return theaterID;
	}
	public void setTheaterID(Integer theaterID) {
		this.theaterID = theaterID;
	}
	
	@Override
	public String toString() {
		return "ScheduleDto [scheduleID=" + scheduleID + ", theaterID=" + theaterID + ", screenID=" + screenID
				+ ", movieID=" + movieID + ", screen_date=" + screen_date + ", start_time=" + start_time + ", end_time="
				+ end_time + "]";
	}
	public ScreenDto getScreenDto() {
		return screenDto;
	}
	public void setScreenDto(ScreenDto screenDto) {
		this.screenDto = screenDto;
	}

	
	
}
