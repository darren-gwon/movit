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
		return session.selectOne(namespace + "count");
	}
			
	//게시물 목록 + 페이징
	// 매개변수인 displayPost, postNum들 해시맵을 이용하여 하나로 그룹지어주고 매퍼로 전송됩니다.
	@Override
	public List<InquiryFaqDto> listPage(int displayPost, int postNum) throws Exception{
				
	HashMap<Object, Object> data = new HashMap<>();
				
	data.put("displayPost", displayPost);
	data.put("postNum", postNum);
				
		return session.selectList(namespace + "listPage", data);
				
			}
	}
