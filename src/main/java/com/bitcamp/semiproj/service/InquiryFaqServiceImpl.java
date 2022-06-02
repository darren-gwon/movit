package com.bitcamp.semiproj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.InquiryFaqDao;
import com.bitcamp.semiproj.domain.InquiryFaqDto;

@Service
public class InquiryFaqServiceImpl implements InquiryFaqService{
	@Autowired
	InquiryFaqDao faqDao;
	
	@Override
	public List<InquiryFaqDto> getFaqList() {
		// TODO Auto-generated method stub
		return faqDao.selectAll();
	}
	
	@Override
	public void create(InquiryFaqDto dto) {
		faqDao.create(dto);
	}

	@Override
	public InquiryFaqDto faqdetail(int seq) {
		return faqDao.faqdetail(seq);
	}
	
	//게시물 수정
	@Override
	public void update(InquiryFaqDto dto) {
		faqDao.update(dto);
	}
	
	//게시물 선택 삭제
	@Override
	public void delete(String seq) {
		faqDao.delete(seq);
	}
	@Override
	public int count() throws Exception {
		return faqDao.count();
	}
	//게시물 목록 + 페이징 추가
	@Override
	public List<InquiryFaqDto> listPage(int displayPost, int postNum) throws Exception {
		return faqDao.listPage(displayPost, postNum);
	}
	
}
