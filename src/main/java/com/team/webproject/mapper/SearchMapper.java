package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;

public interface SearchMapper {
	List<PerformanceDTO> getSearchList(String keyword);
	Integer countSearchList(String keyword);
}
