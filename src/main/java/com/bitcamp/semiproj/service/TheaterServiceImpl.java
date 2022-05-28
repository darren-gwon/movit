package com.bitcamp.semiproj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.TheaterDao;
import com.bitcamp.semiproj.domain.TheaterDto;

@Service
public class TheaterServiceImpl implements TheaterService {
	@Autowired
	TheaterDao theaterDao;
	
	@Override
	public List<TheaterDto> getAllTheaters(){
		return theaterDao.selectAll();
	}
	
	@Override
	public List<TheaterDto> getTheaterByRegion(int regionID){
		return theaterDao.selectByRegion(regionID);
	}
	
	@Override
	public List<TheaterDto> getAllRegions(){
		return theaterDao.selectRegion();
	}
}
