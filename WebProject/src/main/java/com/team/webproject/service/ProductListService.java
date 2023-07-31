package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;


public interface ProductListService {
	List<PerformanceDTO> getProductList(String main_category, Integer member_code, String area);
	
	
}
