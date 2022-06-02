package com.bitcamp.semiproj.dao;

import java.util.List;

import com.bitcamp.semiproj.domain.InquiryDto;
import com.bitcamp.semiproj.domain.InquiryLostDto;

public interface InquiryLostDao {
	public List<InquiryLostDto> selectLostAll();//조회
	public void lostcreate(InquiryLostDto dto); //등록하기
	public InquiryLostDto lostdetail(int seq); //상세보기
	public void lostupdate(InquiryLostDto dto); //수정하기
	public void lostdelete(String seq); //삭제하기
	
	//게시물 총 개수
	public int count() throws Exception;
	//리스트 출력 및 검색 페이징 처리
	public List<InquiryLostDto> listPage(int startnum, int postnum, String keyword) throws Exception;
}
