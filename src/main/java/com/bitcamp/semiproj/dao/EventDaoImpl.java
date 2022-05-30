package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.EventDto;


@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	private SqlSession session;
	
	private static String nameSpace="com.bitcamp.semiproj.dao.EventMapper.";
	
	
		@Override
		public List <EventDto> eventpage(Map<String, Object> map) {
			return session.selectList(nameSpace + "eventpage",map);
		
		}
		
		@Override
		public List<EventDto> eventlist() {
			// TODO Auto-generated method stub
			return session.selectList(nameSpace + "eventlist");
		}
		
		@Override
		public void eventwriteform(EventDto dto) {
			session.insert(nameSpace+"eventwriteform",dto);
			
		}
		
		@Override
		public EventDto detail(int seq) {
			return  session.selectOne(nameSpace + "detail",seq);
		}
		
		
		@Override
		public void updateform(EventDto dto) {
			session.update(nameSpace+"updateform", dto);
		}

		
		@Override
		public void readcount(EventDto dto) {
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


}
