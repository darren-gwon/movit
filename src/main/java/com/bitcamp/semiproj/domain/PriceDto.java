package com.bitcamp.semiproj.domain;

public class PriceDto {
	private Integer priceID;
	private Integer classID;
	private String age_group;
	private Integer price;
	
	public Integer getPriceID() {
		return priceID;
	}

	public void setPriceID(Integer priceID) {
		this.priceID = priceID;
	}

	public Integer getClassID() {
		return classID;
	}

	public void setClassID(Integer classID) {
		this.classID = classID;
	}

	public String getAge_group() {
		return age_group;
	}

	public void setAge_group(String age_group) {
		this.age_group = age_group;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "PriceDto [priceID=" + priceID + ", classID=" + classID + ", age_group=" + age_group + ", price=" + price
				+ "]";
	}
	
	

}
