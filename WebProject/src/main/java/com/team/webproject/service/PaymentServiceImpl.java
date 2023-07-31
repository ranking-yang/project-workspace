package com.team.webproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.common.IamportAPI;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.mapper.PerformanceMapper;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PerformanceMapper performanceMapper;
	
	@Autowired
	IamportAPI imaportAPI;
	
	// 아이디 정보 조회
	
	// 쿠폰 조회
	
	// 선택한 공연정보 조회
	public PerformanceDTO getPerformance(String performance_code) {
		return performanceMapper.getPerformance(performance_code);
	}
	
	// API KEY 값 조회
	public String getApiMarketkey() {
		return imaportAPI.getImport_api_marketkey();
	}
	
	public String getApiRestkey() {
		return imaportAPI.getImport_api_restkey();
	}
	

}
