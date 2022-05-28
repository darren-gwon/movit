package com.bitcamp.semiproj.domain;

public class ScreenClassDto {
	private Integer classID;
	private String class_type;
	private PriceDto priceDto;
	public Integer getClassID() {
		return classID;
	}
	public void setClassID(Integer classID) {
		this.classID = classID;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public PriceDto getPriceDto() {
		return priceDto;
	}
	public void setPriceDto(PriceDto priceDto) {
		this.priceDto = priceDto;
	}
	
	
}
