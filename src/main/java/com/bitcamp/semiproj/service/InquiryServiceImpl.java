package com.bitcamp.semiproj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.InquiryDao;
import com.bitcamp.semiproj.domain.InquiryDto;

@Service
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	InquiryDao inquiryDao;
	
	@Override
	public List<InquiryDto> getInquiryList() {
		// TODO Auto-generated method stub
		return inquiryDao.selectinquiryAll();
	}
	
	@Override
	public void inquirycreate(InquiryDto dto) {
		inquiryDao.inquirycreate(dto);
	}
	
	@Override
	public InquiryDto inquirydetail(int seq) {
		return inquiryDao.inquirydetail(seq);
	}
	
	//게시물 수정
	@Override
	public void inquiryupdate(InquiryDto dto) {
		inquiryDao.inquiryupdate(dto);
	}

	@Override
	public void inquirydelete(String seq) {
		// TODO Auto-generated method stub
		inquiryDao.inquirydelete(seq);
		
	}

}
