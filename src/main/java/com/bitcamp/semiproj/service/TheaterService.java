package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.TheaterDto;

public interface TheaterService {

	List<TheaterDto> getAllTheaters();

	List<TheaterDto> getTheaterByRegion(int regionID);

	List<TheaterDto> getAllRegions();

}