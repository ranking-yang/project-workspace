package com.team.webproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.mapper.SearchMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchListSeriviceImpl implements SearchListService{

	private final SearchMapper searchMapper;
	
	@Override
	public List<PerformanceDTO> getSearchList(String keyword) {
			return searchMapper.getSearchList(keyword);


	}

	@Override
	public List<PerformanceDTO> getUserSearchList(String keyword) {
		return searchMapper.getUserSearchList(keyword);
	}

}
