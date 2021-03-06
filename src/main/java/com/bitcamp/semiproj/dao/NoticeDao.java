package com.bitcamp.semiproj.dao;

import java.util.List;


import com.bitcamp.semiproj.domain.NoticeDto;

public interface NoticeDao {
	public List<NoticeDto> list();
	public void create(NoticeDto dto); 
	public NoticeDto detail(int seq); 
	public void updateform(NoticeDto dto); 
	public void readcount(NoticeDto dto); 
	public void delete (int seq); 
    public int postcount(); 
    public List<NoticeDto> listpage(int startnum, int postnum, String keyword);
}
