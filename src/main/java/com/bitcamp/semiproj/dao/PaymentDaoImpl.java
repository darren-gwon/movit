package com.bitcamp.semiproj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.semiproj.domain.KakaoPayApprovalDto;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	@Autowired
	SqlSession session;
	
	private final String namespace="com.bitcamp.semiproj.dao.PaymentMapper.";

	@Override
	public int insertPayInfo(KakaoPayApprovalDto kakaoPayApprovalDto) {
		System.out.println(kakaoPayApprovalDto);
		return session.insert(namespace+"insertPayment", kakaoPayApprovalDto);
	}
	/*
	 * @Override public int insertAmount (KakaoPayApprovalDto kakaoPayApprovalDto) {
	 * return session.insert(namespace+"insertAmount", kakaoPayApprovalDto); }
	 * 
	 * @Override public int insertCardInfo(KakaoPayApprovalDto kakaoPayApprovalDto)
	 * { return session.insert(namespace+"insertCardInfo", kakaoPayApprovalDto); }
	 */
}
