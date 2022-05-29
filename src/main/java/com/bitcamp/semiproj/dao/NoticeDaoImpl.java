package com.bitcamp.semiproj.dao;


import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;
	
	private static String nameSpace="com.bitcamp.semiproj.dao.NoticeMapper.";
	
	
		@Override
		public List <NoticeDto> list() {
			return session.selectList(nameSpace + "eventpage");
		
		}
		
		@Override
		public void create(NoticeDto dto) {
			session.insert(nameSpace+"create",dto);
			
		}
		
		@Override
		public NoticeDto detail(int seq) {
			return  session.selectOne(nameSpace + "detail",seq);
		}
		
		
		@Override
		public void updateform(NoticeDto dto) {
			session.update(nameSpace+"updateform", dto);
		}

		
		@Override
		public void readcount(NoticeDto dto) {
			session.update(nameSpace+"readcount", dto);
		}
		
		
		@Override
		public void delete(int seq) {
			session.delete(nameSpace+"delete", seq);
		}
		
		@Override
		public int postcount() {
			return session.selectOne(nameSpace+"postcount");
}
		
		@Override
		public List<NoticeDto> listpage(int startnum, int postnum, String keyword) {

		 HashMap<String, Object> data = new HashMap<String, Object>();
		  
		 data.put("startnum", startnum);
		 data.put("postnum", postnum);
		 data.put("keyword", keyword);
		  
		 return session.selectList(nameSpace + "listpage", data);
		}

}
	