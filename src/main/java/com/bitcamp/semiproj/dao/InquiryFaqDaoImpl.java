package com.bitcamp.semiproj.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.InquiryFaqDto;

@Repository("faqDAO")
public class InquiryFaqDaoImpl implements InquiryFaqDao {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.bitcamp.semiproj.dao.InquiryMapper.";

	@Override
	public List<InquiryFaqDto> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"selectAll");
	}
	
	//FAQ 게시물 등록
	@Override
	public void create(InquiryFaqDto dto) {
		session.insert(namespace+"create", dto);
	}
	
	//게시물 상세내용 불러오기
	@Override
	public InquiryFaqDto faqdetail(int seq) {
		return session.selectOne(namespace +"faqdetail", seq);
	}
	
	//FAQ 게시물 수정
	@Override
	public void update(InquiryFaqDto dto) {
		session.update(namespace +"faqupdate",dto);
	}
	//게시물 선택 삭제
	@Override
	public void delete(String seq) {
			session.delete(namespace +"faqdelete",seq);
	}

	//게시물 총 개수
	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + "faqcount");
	}
			
	//게시물 목록 + 페이징 + 키워드 검색기능 
	@Override
	public List<InquiryFaqDto> faqlistPage(int startnum, int postnum, String keyword) throws Exception{
				
	HashMap<Object, Object> data = new HashMap<>();
				
	data.put("startnum", startnum);
	data.put("postnum", postnum);
	 data.put("keyword", keyword);
				
		return session.selectList(namespace + "faqlistPage", data);
				
	}
	}
