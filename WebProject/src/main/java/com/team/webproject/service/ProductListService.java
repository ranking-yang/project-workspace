package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;


public interface ProductListService {
	List<PerformanceDTO> getProductList(String main_category, String area);
	List<PerformanceDTO> getUserProductList(String main_category, String area);
	int getMember_code(String member_id);
	
}
