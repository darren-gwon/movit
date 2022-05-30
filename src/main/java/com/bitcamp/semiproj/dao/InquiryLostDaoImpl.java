package com.bitcamp.semiproj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.InquiryLostDto;

@Repository
public class InquiryLostDaoImpl implements InquiryLostDao {

	@Autowired
	private SqlSession sessionLost;
	
	private static String namespace = "com.bitcamp.semiproj.dao.InquiryMapper.";
	
	//게시물 목록
	@Override
	public List<InquiryLostDto> selectLostAll() {
		// TODO Auto-generated method stub
		return sessionLost.selectList(namespace + "selectLostAll");
	}
	
	//게시물 등록
	@Override
	public void lostcreate(InquiryLostDto dto) {
		sessionLost.insert(namespace + "lostcreate", dto);
	}
	
	//게시물 상세내용 불러오기
	public InquiryLostDto lostdetail(int seq) {
		return sessionLost.selectOne(namespace +"lostdetail", seq);
	}
	
	//게시물 수정하기
	@Override
	public void lostupdate(InquiryLostDto dto) {
		sessionLost.update(namespace +"lostupdate",dto);
	}
	//
	@Override
	public void lostdelete(String seq) {
		sessionLost.delete(namespace +"lostdelete",seq);
	}
}
