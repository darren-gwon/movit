package com.bitcamp.semiproj.dao;

import java.util.List;

import com.bitcamp.semiproj.domain.InquiryDto;

public interface InquiryDao {
	public List<InquiryDto> selectinquiryAll();//조회
	public void inquirycreate(InquiryDto dto); //등록하기
	public InquiryDto inquirydetail(int seq); //상세보기
	public void inquiryupdate(InquiryDto dto); //수정하기
	public void inquirydelete(String seq); //삭제하기
	
	//게시물 총 개수
	public int count() throws Exception;
			
	//게시물 목록 + 페이징
	public List<InquiryDto> listPage(int startnum, int postnum, String keyword) throws Exception;
	
	//조회수 증가
	public void inquiryreadcount(InquiryDto inquirydto);


}

	

