package com.bitcamp.semiproj.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.semiproj.dao.NoticeDaoImpl;
import com.bitcamp.semiproj.domain.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDaoImpl dao;

	@Override
	public List<NoticeDto> list() {
	 return dao.list();
	}

	@Override
	public void create (NoticeDto dto) {
		dao.create(dto);
	
	}
	@Override
	public NoticeDto detail(int seq) {
		return dao.detail(seq);
		
	}
	@Override
	public void updateform(NoticeDto dto) {
		dao.updateform(dto);
	}
	@Override
	public void readcount(NoticeDto dto) {
		dao.readcount(dto);
	}
	
	@Override
	public void delete(int seq) {
		dao.delete(seq);
	}
	@Override
	public int postcount() {
		return dao.postcount();
	}
	@Override
	public List<NoticeDto> listpage(int startnum, int postnum, String keyword) {
	 return dao.listpage(startnum, postnum, keyword);
	}


}