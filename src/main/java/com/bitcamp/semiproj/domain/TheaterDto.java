package com.bitcamp.semiproj.domain;

public class TheaterDto {
	private Integer theaterID;
	private String name;
	private RegionDto regionDto;
	private String address;
	private String contact;
	
	public Integer getTheaterID() {
		return theaterID;
	}
	public void setTheaterID(Integer theaterID) {
		this.theaterID = theaterID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public RegionDto getRegionDto() {
		return regionDto;
	}
	public void setRegionDto(RegionDto regionDto) {
		this.regionDto = regionDto;
	}
	
	@Override
	public String toString() {
		return "TheaterDto [theaterID=" + theaterID + ", name=" + name + ", regionDto=" + regionDto + ", address="
				+ address + ", contact=" + contact + "]";
	}
	
	
}
