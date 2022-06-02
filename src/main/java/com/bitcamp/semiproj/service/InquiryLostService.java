package com.bitcamp.semiproj.service;

import java.util.List;

import com.bitcamp.semiproj.domain.InquiryDto;
import com.bitcamp.semiproj.domain.InquiryLostDto;

public interface InquiryLostService {
	public List<InquiryLostDto> getLostList();
	public void lostcreate(InquiryLostDto dto);
	public InquiryLostDto lostdetail(int seq);
	public void lostupdate(InquiryLostDto dto);
	public void lostdelete(String ajaxMsg);
	public int count() throws Exception;
	public List<InquiryLostDto> listPage(int startnum, int postnum, String keyword) throws Exception;
}
