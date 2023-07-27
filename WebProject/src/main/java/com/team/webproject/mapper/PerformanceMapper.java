package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;

public interface PerformanceMapper {
	List<PerformanceDTO> getAllPerformances();
	List<PerformanceDTO> getPerformances(String main_category);
	PerformanceDTO getPerformance(String pk);
	List<PerformanceDTO> getUserWishlist();
	
}
