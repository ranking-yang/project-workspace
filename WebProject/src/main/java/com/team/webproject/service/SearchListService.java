package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;

public interface SearchListService {
	List<PerformanceDTO> getSearchList(String keyword);
	List<PerformanceDTO> getUserSearchList(String keyword);
}
