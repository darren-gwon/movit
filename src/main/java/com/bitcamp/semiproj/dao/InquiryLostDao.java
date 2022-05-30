package com.bitcamp.semiproj.dao;

import java.util.List;

import com.bitcamp.semiproj.domain.InquiryLostDto;

public interface InquiryLostDao {
	public List<InquiryLostDto> selectLostAll();//조회
	public void lostcreate(InquiryLostDto dto); //등록하기
	public InquiryLostDto lostdetail(int seq); //상세보기
	public void lostupdate(InquiryLostDto dto); //수정하기
	public void lostdelete(String seq); //삭제하기

}
