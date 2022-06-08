package com.bitcamp.semiproj.dao;

import java.util.List;

import com.bitcamp.semiproj.domain.TheaterDto;

public interface TheaterDao {

	List<TheaterDto> selectAll();
	List<TheaterDto> selectRegions();
	List<TheaterDto> selectByRegion(String region_name);

}