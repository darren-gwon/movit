package com.bitcamp.semiproj.dao;

import java.util.List;

import com.bitcamp.semiproj.domain.InquiryFaqDto;

public interface InquiryFaqDao {
	public List<InquiryFaqDto> selectAll();//조회
	public void create(InquiryFaqDto dto); //등록하기
	public InquiryFaqDto faqdetail(int seq); //상세보기
	public void update(InquiryFaqDto dto); //수정하기
	public void delete(String seq); //선택 삭제하기
}
