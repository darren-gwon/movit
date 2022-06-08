package com.bitcamp.semiproj.domain;

public class TheaterDto {
	private Integer theater_id;
	private String theater_name;
	private String region_name;	
	private ScreenDto screenDto;
	private String address;
	private String contact;
	
	public Integer getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(Integer theater_id) {
		this.theater_id = theater_id;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public ScreenDto getScreenDto() {
		return screenDto;
	}
	public void setScreenDto(ScreenDto screenDto) {
		this.screenDto = screenDto;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	@Override
	public String toString() {
		return "TheaterDto [theater_id=" + theater_id + ", theater_name=" + theater_name + ", region_name=" + region_name
				+ ", screenDto=" + screenDto + ", address=" + address + ", contact=" + contact + "]";
	}
}