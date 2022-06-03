package com.bitcamp.semiproj.service;


import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.bitcamp.semiproj.dao.PaymentDao;
import com.bitcamp.semiproj.domain.KakaoPayApprovalDto;
import com.bitcamp.semiproj.domain.KakaoPayReadyDto;
import com.bitcamp.semiproj.domain.OrderInfoDto;

@Service
public class KakaoPayServiceImpl implements KakaoPayService{
	
	@Autowired
	PaymentDao payDao;
	
    private final String HOST = "https://kapi.kakao.com";

    
    public String ready(HttpSession session) {
		
		OrderInfoDto info = (OrderInfoDto)session.getAttribute("orderInfoDto");
		
///////////////////////////////////////////////////////////////////////////////////////		
		System.out.println(info);
		
		
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK e1ff9dd9f0346c637eaab414f5d209d6");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
                
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", info.getCid());
        params.add("partner_order_id", "123456789");
        params.add("partner_user_id", (String) session.getAttribute("user_id"));
        params.add("item_name", info.getItem_name());
        params.add("quantity", info.getQuantity().toString());
        params.add("total_amount", info.getTotal_amount().toString());
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://52.78.89.161:8080/pay/kakaoPaySuccess");
        params.add("cancel_url", "http://52.78.89.161:8080/pay/kakaoPayCancel");
        params.add("fail_url", "http://52.78.89.161:8080/pay/kakaoPayFail");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
    	System.out.println("-----------------------PAY-READY RESPONSE PAYINFO-----------------------");
    	System.out.println(body);
    	System.out.println("------------------------------------------------------------------------");
    	
    	try {
    		KakaoPayReadyDto kPayReadyDto  = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyDto.class);
            session.setAttribute("kakaoPayReadyDto", kPayReadyDto);
    		
        	System.out.println("-----------------------PAY-READY ReadyDto PAYINFO-----------------------");
        	System.out.println(kPayReadyDto);
        	System.out.println("-------------------------------------------------------------------------");
        	
        	
            return kPayReadyDto.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "/pay";   
    }
	
	public KakaoPayApprovalDto payInfo(String pg_token, HttpSession session) {
		
		OrderInfoDto info = (OrderInfoDto)session.getAttribute("orderInfoDto");
		KakaoPayReadyDto kPayReadyDto = (KakaoPayReadyDto)session.getAttribute("kakaoPayReadyDto");
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK e1ff9dd9f0346c637eaab414f5d209d6");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", info.getCid());
        params.add("tid", kPayReadyDto.getTid());
        
        //partner_order_id(가맹점 고유 주문번호) 수정 필요.
        params.add("partner_order_id", "123456789");
        params.add("partner_user_id", (String) session.getAttribute("user_id"));
        params.add("pg_token", pg_token);
        params.add("total_amount", info.getTotal_amount().toString());
        
    	HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
    	System.out.println("-----------------------SUCCESS RESPONSE PAYINFO-----------------------");
    	System.out.println(body);
    	System.out.println("----------------------------------------------------------------------");
    	
    	
        try {
        	
        	KakaoPayApprovalDto kPayApprovalDto = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalDto.class);        	
        	System.out.println(kPayApprovalDto);
        	System.out.println("-----------------------SUCCESS ApprovalDto PAYINFO-----------------------");
        	if(payDao.insertPayInfo(kPayApprovalDto)==1) {
        		
        	}

        	System.out.println(kPayApprovalDto);        	
        	System.out.println("결제 성공!");
        	System.out.println("-------------------------------------------------------------------------");

        	
        	session.removeAttribute("OrderInfoDto");
        	session.removeAttribute("kakaoPayReadyDto");
        	
        	return kPayApprovalDto;
	    } catch (RestClientException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } catch (URISyntaxException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
        return null;
	}

}