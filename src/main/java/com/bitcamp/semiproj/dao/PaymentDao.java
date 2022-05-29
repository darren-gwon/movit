package com.bitcamp.semiproj.dao;

import com.bitcamp.semiproj.domain.KakaoPayApprovalDto;

public interface PaymentDao {

	public int insertPayInfo(KakaoPayApprovalDto kakaoPayApprovalDto);
	/*
	 * public int insertAmount (KakaoPayApprovalDto kakaoPayApprovalDto); public int
	 * insertCardInfo(KakaoPayApprovalDto kakaoPayApprovalDto);
	 */
}