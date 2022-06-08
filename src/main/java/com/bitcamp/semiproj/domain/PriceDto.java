package com.bitcamp.semiproj.domain;

public class PriceDto {
	private Integer price_id;
	private String class_type;
	private String age_group;
	private Integer price;
	
	public Integer getPrice_id() {
		return price_id;
	}

	public void setPrice_id(Integer price_id) {
		this.price_id = price_id;
	}

	public String getClass_type() {
		return class_type;
	}

	public void setClass_type(String class_type) {
		this.class_type = class_type;
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
		return "PriceDto [price_id=" + price_id + ", class_type=" + class_type + ", age_group=" + age_group + ", price=" + price
				+ "]";
	}
	
	

}
