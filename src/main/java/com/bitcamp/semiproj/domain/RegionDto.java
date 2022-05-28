package com.bitcamp.semiproj.domain;

public class RegionDto {
	private Integer regionID;
	private String name;
	
	public Integer getRegionID() {
		return regionID;
	}
	public void setRegionID(Integer regionID) {
		this.regionID = regionID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "RegionDto [regionID=" + regionID + ", name=" + name + "]";
	}
}
