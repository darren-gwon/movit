package com.bitcamp.semiproj.dao;

import java.util.HashMap;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.KakaoDto;
import com.bitcamp.semiproj.domain.NaverDto;
import com.bitcamp.semiproj.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSessionTemplate session;

	private final String namespace = "com.bitcamp.semiproj.dao.UserDao.";

	// 회원가입
	@Override
	public int regUser(UserDto userdto) {
		return session.insert(namespace + "regUser", userdto);

	}

	// 로그인 확인
	@Override
	public int login(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "Login", map);
	}

	// ID 중복확인
	@Override
	public int getCheckId(String user_id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "getCheckId", user_id);
	}

	// 이메일 중복 확인
	@Override
	public int getCheckEmail(String email) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "getCheckEmail", email);
	}

	// 사용자 이름 검색
	@Override
	public String getSearchName(String user_id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "getSearchName", user_id);
	}

	// 사용자 아이디 찾기
	@Override
	public String getSearchId(Map<String, String> map) {
		// TODO Auto-generated method stub

		return session.selectOne(namespace + "getSearchId", map);
	}

	// 사용자 비밀번호 찾기
	@Override
	public String getSearchPassword(Map<String, String> map) {
		// TODO Auto-generated method stub

		return session.selectOne(namespace + "getSearchPassword", map);
	}

	// 회원 임시 비밀번호 변경
	@Override
	public void temporaryPassword(Map<String, String> map) {
		// TODO Auto-generated method stub

		session.update(namespace + "temporaryPassword", map);
	}

	// 카카오 db 저장
	@Override
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		// TODO Auto-generated method stub
		session.insert(namespace + "kakaoInsert", userInfo);
	}

	// 카카오 유저 검색
	@Override
	public KakaoDto findkakao(HashMap<String, Object> userInfo) {
		// TODO Auto-generated method stub

		return session.selectOne(namespace + "findkakao", userInfo);
	}

	// 네이버 db저장
	@Override
	public void naverinsert(HashMap<String, Object> naver) {
		// TODO Auto-generated method stub
		session.insert(namespace + "naverInsert", naver);
	}

	// 네이버 유저 검색
	@Override
	public NaverDto findnaver(HashMap<String, Object> naver) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "findnaver", naver);

	}
	//sns db 회원가입
	@Override
	public void snsReguser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		session.insert(namespace + "kakaoregUser", map);

	}

}
