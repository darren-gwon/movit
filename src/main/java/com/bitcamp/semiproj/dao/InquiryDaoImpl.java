package com.bitcamp.semiproj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.InquiryDto;

@Repository
public class InquiryDaoImpl implements InquiryDao {

	@Autowired
	private SqlSession inquirysession;
	
	private static String namespace = "com.bitcamp.semiproj.dao.InquiryMapper.";

	@Override
	public List<InquiryDto> selectinquiryAll() {
		
		// TODO Auto-generated method stub
		return inquirysession.selectList(namespace+"selectinquiryAll");
	}
	
	//FAQ 게시물 등록
	@Override
	public void inquirycreate(InquiryDto dto) {
		inquirysession.insert(namespace+"inquirycreate", dto);
	}
	
	//게시물 상세내용 불러오기
	@Override
	public InquiryDto inquirydetail(int seq) {
		return inquirysession.selectOne(namespace +"inquirydetail", seq);
	}
	
	//FAQ 게시물 수정
	@Override
	public void inquiryupdate(InquiryDto dto) {
		inquirysession.update(namespace +"inquiryupdate",dto);
	}
	//게시물 선택 삭제
	@Override
	public void inquirydelete(String seq) {
		inquirysession.delete(namespace +"inquirydelete",seq);
	}
}
