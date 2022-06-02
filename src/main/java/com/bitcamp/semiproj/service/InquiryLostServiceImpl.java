package com.bitcamp.semiproj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.InquiryLostDao;
import com.bitcamp.semiproj.domain.InquiryLostDto;

@Service
public class InquiryLostServiceImpl implements InquiryLostService {
	@Autowired
	InquiryLostDao lostDao;
	
	@Override
	public List<InquiryLostDto> getLostList() {
		// TODO Auto-generated method stub
		return lostDao.selectLostAll();
	}
	
	@Override
	public void lostcreate(InquiryLostDto dto) {
		lostDao.lostcreate(dto);
	}
	
	@Override
	public InquiryLostDto lostdetail(int seq) {
		return lostDao.lostdetail(seq);
	}
	
	//게시물 수정
	@Override
	public void lostupdate(InquiryLostDto dto) {
		lostDao.lostupdate(dto);
	}

	@Override
	public void lostdelete(String seq) {
		// TODO Auto-generated method stub
		lostDao.lostdelete(seq);
		
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return lostDao.count();
	}

	@Override
	public List<InquiryLostDto> listPage(int startnum, int postnum, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return lostDao.listPage(startnum, postnum, keyword);
	}

}
