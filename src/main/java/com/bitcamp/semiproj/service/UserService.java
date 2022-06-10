package com.bitcamp.semiproj.service;


import java.util.Map;
import com.bitcamp.semiproj.domain.KakaoDto;
import com.bitcamp.semiproj.domain.UserDto;


public interface UserService {
	//회원가입용
	int userReg_service(UserDto userdto);
	//ID중복확인
	int userIdCheck(String user_id);
	//email중복확인
	int userEmailCheck(String email);
	// 이름 찾기
	String getSearchName(String user_id);
	// 로그인용
	int login(Map<String, String> map);
	// id 찾기
	String get_searchId(Map<String, String> map);
	// password 찾기
	String get_searchPassword(Map<String, String> map);
	// 회원 임시 비밀번호 변경 메서드
	void temporaryPassword(Map<String, String> map); 
	// 카카오토큰얻기
	public String getAccessToken(String authorize_code);
	// 카카오 유저정보 얻기
	public KakaoDto getUserInfo(String access_Token);
	// sns 간편회원가입
	public void snsReg (Map<String, Object> map);
	//sns 비번 난수
	public String getKey(boolean lowerCheck, int size);
}

