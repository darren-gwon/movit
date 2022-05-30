package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.InquiryDto;

public interface InquiryService {
	public List<InquiryDto> getInquiryList();
	public void inquirycreate(InquiryDto dto);
	public InquiryDto inquirydetail(int seq);
	public void inquiryupdate(InquiryDto dto);
	public void inquirydelete(String ajaxMsg);
}
