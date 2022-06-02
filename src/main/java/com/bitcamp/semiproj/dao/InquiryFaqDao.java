package com.bitcamp.semiproj.dao;

import java.util.List;

import com.bitcamp.semiproj.domain.InquiryFaqDto;

public interface InquiryFaqDao {
	public List<InquiryFaqDto> selectAll();//조회
	public void create(InquiryFaqDto dto); //등록하기
	public InquiryFaqDto faqdetail(int seq); //상세보기
	public void update(InquiryFaqDto dto); //수정하기
	public void delete(String seq); //선택 삭제하기

	//게시물 총 개수
	public int count() throws Exception;
				
	//게시물 목록 + 페이징
	public List<InquiryFaqDto> listPage(int displayPost, int postNum) throws Exception;
	}


