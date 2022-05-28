package com.bitcamp.semiproj.service;

import javax.servlet.http.HttpSession;

import com.bitcamp.semiproj.domain.KakaoPayApprovalDto;
import com.bitcamp.semiproj.domain.OrderInfoDto;

public interface KakaoPayService {
	public String ready(HttpSession session);
	public KakaoPayApprovalDto payInfo(String pg_token, HttpSession session);
}
