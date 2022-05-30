package com.bitcamp.semiproj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.InquiryFaqDao;
import com.bitcamp.semiproj.dao.TheaterDao;
import com.bitcamp.semiproj.domain.InquiryFaqDto;

public interface InquiryFaqService {
	public List<InquiryFaqDto> getFaqList();
	
	public void create(InquiryFaqDto dto);
	public InquiryFaqDto faqdetail(int seq);
	public void update(InquiryFaqDto dto);
	public void delete(String seq);

}
