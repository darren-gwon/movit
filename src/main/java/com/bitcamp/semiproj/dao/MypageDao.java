package com.bitcamp.semiproj.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.semiproj.domain.BookingDto;
import com.bitcamp.semiproj.domain.InquiryDto;
import com.bitcamp.semiproj.domain.InquiryLostDto;
import com.bitcamp.semiproj.domain.MypageDto;
import com.bitcamp.semiproj.domain.ReviewDto;

public interface MypageDao {
	MypageDto getUserData(String user_id);
	void updateMypage(MypageDto dto);
	String pwCheck(String user_id);
	void pwUpdate(Map<String, String> map);
	void deleteAccount(String user_id);
	int checkNickName(String nickname);
	List<ReviewDto> getUserReviewList(String user_id);
	List<InquiryDto> getUserInquiry(String user_id);
	List<InquiryLostDto> getUserLost(String user_id);
	List<BookingDto> myMovieList(String user_id);
}