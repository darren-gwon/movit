package com.bitcamp.semiproj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.SeatDao;
import com.bitcamp.semiproj.domain.OwnSeatDto;

@Service
public class SeatServiceImpl implements SeatService {
	@Autowired
	SeatDao seatDao;

	@Override
	public List<OwnSeatDto> getAllOwnSeats(Map<String, String> map) {
		return seatDao.selectAllOwnSeat(map);
	}
	
	@Override
	public int isValidPrice(Map<String, String> tickets) {
		Integer adultCnt = Integer.valueOf(tickets.get("adultCnt"));
		Integer youthCnt = Integer.valueOf(tickets.get("youthCnt"));
		Integer specialCnt = Integer.valueOf(tickets.get("specialCnt"));
		
		int realTotalPrice = 0;
		if(adultCnt > 0) {
			tickets.put("age_group", "성인");
			realTotalPrice += (seatDao.selectSeatPrice(tickets).getPrice()*adultCnt);
		}
		
		if(youthCnt > 0) {
			tickets.put("age_group", "청소년");
			realTotalPrice += (seatDao.selectSeatPrice(tickets).getPrice()*youthCnt);
		}
		
		if(specialCnt > 0) {
			tickets.put("age_group", "우대");
			realTotalPrice += (seatDao.selectSeatPrice(tickets).getPrice()*specialCnt);
		}
		
		return realTotalPrice;
		
	}
}
