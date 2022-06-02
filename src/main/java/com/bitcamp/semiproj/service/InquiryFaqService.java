package com.bitcamp.semiproj.service;

import java.util.List;


import com.bitcamp.semiproj.domain.InquiryFaqDto;

public interface InquiryFaqService {
	public List<InquiryFaqDto> getFaqList();
	
	public void create(InquiryFaqDto dto);
	public InquiryFaqDto faqdetail(int seq);
	public void update(InquiryFaqDto dto);
	public void delete(String seq);
	public int count() throws Exception;
	public List<InquiryFaqDto> faqlistPage(int startnum, int postnum, String keyword) throws Exception;
}
