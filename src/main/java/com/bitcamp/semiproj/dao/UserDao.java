package com.bitcamp.semiproj.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.semiproj.domain.KakaoDto;
import com.bitcamp.semiproj.domain.NaverDto;
import com.bitcamp.semiproj.domain.UserDto;

public interface UserDao {
 
	/*유저정보관련*/
	//회원가입
	int regUser(UserDto userdto) throws SQLException; //유저 회원가입 메서드
	//로그인 확인
	int login(Map<String, String> map);
	//아이디 중복확인
	int getCheckId(String user_id);
	//이메일 중복확인
	int getCheckEmail(String email);
	//사용자 이름찾기 
	String getSearchName(String user_id);
	//사용자 아이디 찾기
	String getSearchId(Map<String, String> map);
	//사용자 비밀번호 찾기
	String getSearchPassword(Map<String, String> map);
	//회원 임시 비밀번호 변경
	void temporaryPassword(Map<String, String> map);
	
    //카카오 db저장
	public void kakaoinsert(HashMap<String, Object> userInfo);
	//카카오 유저검색
	public KakaoDto findkakao(HashMap<String, Object> userInfo);
	// 네이버 db 저장
	public void naverinsert(HashMap<String, Object> userInfo); 
	// 네이버 유저 검색
	public NaverDto findnaver(HashMap<String, Object> userInfo);
	
}
