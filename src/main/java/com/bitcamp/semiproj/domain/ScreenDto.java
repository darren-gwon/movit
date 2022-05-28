package com.bitcamp.semiproj.domain;

public class ScreenDto {
	private Integer screenID;
	private Integer theaterID;
	private String screen_name;
	private ScreenClassDto screenClassDto;
	private ScreenSeatDto seatDto;
	
	public Integer getScreenID() {
		return screenID;
	}
	public void setScreenID(Integer screenID) {
		this.screenID = screenID;
	}
	public Integer getTheaterID() {
		return theaterID;
	}
	public void setTheaterID(Integer theaterID) {
		this.theaterID = theaterID;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public ScreenClassDto getScreenClass() {
		return screenClassDto;
	}
	public void setScreenClass(ScreenClassDto screenClass) {
		this.screenClassDto = screenClass;
	}
	public ScreenSeatDto getSeatDto() {
		return seatDto;
	}
	public void setSeatDto(ScreenSeatDto seatDto) {
		this.seatDto = seatDto;
	}
	
	@Override
	public String toString() {
		return "ScreenDto [screenID=" + screenID + ", theaterID=" + theaterID + ", name=" + screen_name
				+ ", screenClass=" + screenClassDto + ", seatDto=" + seatDto + "]";
	}

}
